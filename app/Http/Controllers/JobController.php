<?php

namespace App\Http\Controllers;

use App\educations;
use App\experience;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Jobs;
use App\JobCategory;
use App\JobLocations;
use App\Mail\EmailManager;
use Carbon\Carbon;
use App\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
// use Intervention\Image\Facades\Image;

use Intervention\Image\ImageManagerStatic as Image;

// cv pdf
use App\JobApplication;
use Illuminate\Support\Facades\Session;
use niklasravnsborg\LaravelPdf\Facades\Pdf;
use Illuminate\Support\Facades\Config;


class JobController extends Controller
{
    public function customerIndex(Request $request){

        $sort_search = null;

         $jobs = Jobs::where('user_id', Auth::user()->id)->orderBy('created_at', 'asc');


        if ($request->has('search')){
            $sort_search = $request->search;
            $jobs = $jobs->where('job_title', 'like', '%'.$sort_search.'%');
        }

        $jobs = $jobs->latest()->paginate(7);
        if(Auth::user()->user_type == 'customer'){
            return view('frontend.user.job_circuler.index' , compact('jobs', 'sort_search'));
        }
        if(Auth::user()->user_type == 'seller'){
            return view('frontend.user.job_circuler.index' , compact('jobs', 'sort_search'));
        }
        else {
            abort(404);
        }

    }
    public function applicationsIndex(Request $request){

        $sort_search = null;


         $data = JobApplication::where('user_id', Auth::user()->id)->orderBy('created_at', 'asc');


        if ($request->has('search')){
            $sort_search = $request->search;
            $data = $data->where('job_title', 'like', '%'.$sort_search.'%')->orWhere('id', 'like', '%'.$sort_search.'%')->orWhere('created_at', 'like', '%'.$sort_search.'%');;
        }


$data = $data->latest()->paginate(10);
            return view('frontend.user.job_circuler.applications.index' , compact( 'data' ,'sort_search'));


    }



    public function applicationsShow(Request $request)
    {
        $application = JobApplication::find($request->id);
        $educations = educations::where('user_id', $application->user_id)->get();
        $experience = experience::where('user_id', $application->user_id)->get();

        // flash()->success('success', 'You are successfully reconnected');

        return view('frontend.user.job_circuler.applications.show', compact('educations', 'experience', 'application'));
    }


    public function applicationsDestroy(Request $request)
    {
        $app = JobApplication::find($request->id);

        if ($app->status == 0) {
            $app = JobApplication::find($request->id);
            $app->delete();
            flash(translate('Application has been deleted successfully'))->success();
        }
        else {
            flash(translate('You cant delete approved application'))->warning();
        }
            return Redirect()->route('cus.application.index');
    }
    // admin
    public function applicationDestroy(Request $request)
    {
        $app = JobApplication::find($request->id);

        if ($app->status == 1) {
            $app = JobApplication::find($request->id);
            $app->delete();
            flash(translate('Application has been deleted successfully'))->success();
        }
        else {
            flash(translate('You cant delete approved application'))->warning();
        }
            return Redirect()->back();

    }




    public function index(Request $request){

        $sort_search = null;
        $jobs = Jobs::orderBy('created_at', 'desc');


        if ($request->has('search')){
            $sort_search = $request->search;
            $jobs = $jobs->where('job_title', 'like', '%'.$sort_search.'%');
        }

        $jobs = $jobs->latest()->paginate(7);
        if(Auth::user()->user_type == 'admin'){
            return view('backend.job_circuler.index' , compact('jobs', 'sort_search'));
        }
        else {
            abort(404);
        }

    }

// admin section
    public function ApplicationIndex(Request $request)
    {

        $jobs = Jobs::all();
        $application = JobApplication::latest()->paginate(20);

        return view('backend.job_circuler.application.index', compact('application', 'jobs'));
    }
    public function MainApplicationShow(Request $request)
    {

        $circuler = Jobs::find($request->id);
        $application = JobApplication::where('circuler_id', $request->id)->paginate(20);

        return view('backend.job_circuler.application.main_application', compact('application','circuler'));
    }



    public function applicationShow(Request $request)
    {
        $application = JobApplication::find($request->id);
        $educations = educations::where('user_id', $application->user_id)->get();
        $experience = experience::where('user_id', $application->user_id)->get();
        $address = json_decode($application->addresses);
        return view('backend.job_circuler.application.show', compact('application', 'address', 'educations', 'experience'));
    }




    // CV PDF

    public function cv_download($id)
    {
        if(Session::has('currency_code')){
            $currency_code = Session::get('currency_code');
        }
        else{
            $currency_code = \App\Currency::findOrFail(get_setting('system_default_currency'))->code;
        }
        $language_code = Session::get('locale', Config::get('app.locale'));

        if(\App\Language::where('code', $language_code)->first()->rtl == 1){
            $direction = 'rtl';
            $text_align = 'right';
            $not_text_align = 'left';
        }else{
            $direction = 'ltr';
            $text_align = 'left';
            $not_text_align = 'right';
        }

        if($currency_code == 'BDT' || $language_code == 'bd'){
            // bengali font
            $font_family = "'Hind Siliguri','sans-serif'";
        }elseif($currency_code == 'KHR' || $language_code == 'kh'){
            // khmer font
            $font_family = "'Hanuman','sans-serif'";
        }elseif($currency_code == 'AMD'){
            // Armenia font
            $font_family = "'arnamu','sans-serif'";
        }elseif($currency_code == 'ILS'){
            // Israeli font
            $font_family = "'Varela Round','sans-serif'";
        }elseif($currency_code == 'AED' || $currency_code == 'EGP' || $language_code == 'sa' || $currency_code == 'IQD'){
            // middle east/arabic font
            $font_family = "'XBRiyaz','sans-serif'";
        }else{
            // general for all
            $font_family = "'Roboto','sans-serif'";
        }

        $application = JobApplication::findOrFail($id);
        $educations = educations::where('user_id', $application->user_id)->get();
        $experience = experience::where('user_id', $application->user_id)->get();
        return PDF::loadview('backend.invoices.cv',[
            'application' => $application,
            'educations' => $educations,
            'experience' => $experience,
            'font_family' => $font_family,
            'direction' => $direction,
            'text_align' => $text_align,
            'not_text_align' => $not_text_align
        ], [ 'format' => 'A5-L'], [])
        ->stream('application-'.$application->id.'.pdf');

    }




    public function update_app_status(Request $request)
    {
        $order = JobApplication::find($request->id);
        $order->status = 0;
        $order->status = $request->status;
        $order->save();

        return Redirect()->back();



    }

    public function jobCreate(){
        $job = Jobs::all();
        $job_category = JobCategory::all();
        $job_locations = JobLocations::all();

        if(Auth::user()->user_type == 'admin'){

        return view('backend.job_circuler.create', compact('job','job_category','job_locations'));
        }
        elseif(Auth::user()->user_type == 'customer'){

        return view('frontend.user.job_circuler.create', compact('job','job_category', 'job_locations'));
        }
        else {
            abort(404);
        }



}




    public function Create(Request $request){
        if(Auth::user()->user_type == 'admin'){
            $request->validate([
                'job_title' => 'required|max:50|min:5',
                'category_id' => 'required',
                'short_description' => 'required|min:5',
                'job_description' => 'required|min:5',
                'slug' => 'required'
            ],
            [
                'category_id.required' => 'The category name field is required.',
                'slug.required' => 'The slug is required. add the title slug will automatically complete.'
            ]
        );




        $job = new Jobs;
        $job->category_id = $request->category_id;
        $job->added_by = Auth::user()->name;
        $job->user_id = Auth::user()->id;
        $job->job_title = $request->job_title;
        $job->company = $request->company;
        $job->education = $request->education;
        $job->experience = $request->experience;
        $job->salary = $request->salary;
        $job->vacancy = $request->vacancy;
        $job->location_id = $request->location_id;
        $job->employment_status = $request->employment_status;
        $job->address = $request->address;
        $job->address2 = $request->address2;
        $job->gender = $request->gender;
        $job->age = $request->age;
        $job->address2 = $request->address2;
        $job->banner = $request->banner;
        $job->deadline = $request->deadline;
        $job->phone = $request->phone;
        $job->email = $request->email;
        $job->slug = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', $request->slug));
        $job->short_description = $request->short_description;
        $job->job_description = $request->job_description;

        $job->meta_title = $request->meta_title;
        $job->meta_img = $request->meta_img;
        $job->meta_description = $request->meta_description;
        $job->meta_keywords = $request->meta_keywords;
        $job->created_at = Carbon::now();

        $job->save();


                flash(translate('Circuler has been inserted successfully'))->success();
                return Redirect()->route('job');



        }

        else {
            abort(404);
        }
    }


        public function customerCreate(Request $request)
        {
        if(Auth::user()->user_type == 'customer'){

            $request->validate([
                'job_title' => 'required|max:50|min:5',
                'category_id' => 'required',
                'short_description' => 'required|min:5|max:220',
                'job_description' => 'required|min:5|max:2400',
                'slug' => 'required'
            ],
            [
                'category_id.required' => 'The category name field is required.',
                'slug.required' => 'The slug is required. add the title slug will automatically complete.'
            ]
        );


            Jobs::insert([
                'job_title' => $request->job_title,
                'category_id' => $request->category_id,
                'company' => $request->company,
                'education' => $request->education,
                'experience' => $request->experience,
                'salary' => $request->salary,
                'vacancy' => $request->vacancy,
                'location_id' => $request->location_id,
                'employment_status' => $request->employment_status,
                'address' => $request->address,
                'address2' => $request->address2,
                'gender' => $request->gender,
                'age' => $request->age,
                'phone' => $request->phone,
                'deadline' => $request->deadline,
                'email' => $request->email,
                'user_id' => Auth::user()->id,
                'added_by' => Auth::user()->name,
                'slug' => preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', $request->slug)),
                'short_description' => $request->short_description,
                'job_description' => $request->job_description,
                'banner' => $request->banner,
                'meta_title' => $request->meta_title,
                'meta_img' => $request->meta_img,
                'meta_description' => $request->meta_description,
                'meta_keywords' => $request->meta_keywords,
                'created_at' => Carbon::now()
                ]);
                flash(translate('Circuler has been inserted successfully'))->success();
                return Redirect()->route('users.job');


        }
        else {
            abort(404);
        }


    }

    public function destroy($id)
    {

        if(Auth::user()->user_type == 'admin'){

        Jobs::find($id)->delete();
        flash(translate('Circuler has been Delated successfully'))->success();

        return redirect('admin/job');

        }
        elseif(Auth::user()->user_type == 'customer'){

        Jobs::find($id)->delete();
        flash(translate('Circuler has been Delated successfully'))->success();

        return redirect('customer/job');

        }
        else {
            abort(404);
        }
    }


    public function jobEdit($id){
        $job = Jobs::find($id);
        $job_category = JobCategory::all();
        $job_locations = JobLocations::orderBy('location','ASC')->get();

        if(Auth::user()->user_type == 'admin'){

        return view('backend.job_circuler.edit', compact('job','job_category','job_locations'));
        }
        elseif(Auth::user()->user_type == 'customer'){

        return view('frontend.user.job_circuler.edit', compact('job','job_category', 'job_locations'));
        }
        else {
            abort(404);
        }



}

    public function update(Request $request, $id)
    {
        $request->validate([
            'job_title' => 'required|max:50|min:5',
            'category_id' => 'required',
            'short_description' => 'required|min:5',
            'job_description' => 'required|min:5',
            'slug' => 'required'
        ],
        [
            'category_id.required' => 'The category name field is required.',
            'slug.required' => 'The slug is required. add title then slug will automatically create.'
        ]
    );

        $job = Jobs::find($id);
        $job->category_id = $request->category_id;
        $job->job_title = $request->job_title;
        $job->company = $request->company;
        $job->education = $request->education;
        $job->experience = $request->experience;
        $job->salary = $request->salary;
        $job->vacancy = $request->vacancy;
        $job->location_id = $request->location_id;
        $job->employment_status = $request->employment_status;
        $job->address = $request->address;
        $job->address2 = $request->address2;
        $job->gender = $request->gender;
        $job->age = $request->age;
        $job->address2 = $request->address2;
        $job->banner = $request->banner;
        $job->deadline = $request->deadline;
        $job->phone = $request->phone;
        $job->email = $request->email;
        $job->slug = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', $request->slug));
        $job->short_description = $request->short_description;
        $job->job_description = $request->job_description;

        $job->meta_title = $request->meta_title;
        $job->meta_img = $request->meta_img;
        $job->meta_description = $request->meta_description;
        $job->meta_keywords = $request->meta_keywords;

        $job->save();
        if(Auth::user()->user_type == 'admin'){
            flash(translate('Circuler has been updated successfully'))->success();
            return redirect()->route('job');
        }
        elseif(Auth::user()->user_type == 'customer'){
            flash(translate('Circuler has been updated successfully'))->success();
        return redirect()->route('users.job');
        }
        else {
            abort(404);
        }
    }


    public function customerUpdate(Request $request, $id)
    {
        $request->validate([
            'job_title' => 'required|max:50|min:5',
            'category_id' => 'required',
            'short_description' => 'required|min:5',
            'job_description' => 'required|min:5',
            'slug' => 'required'
        ],
        [
            'category_id.required' => 'The category name field is required.',
            'slug.required' => 'The slug is required. add title then slug will automatically create.'
        ]
    );

        $job = Jobs::find($id);
        $job->category_id = $request->category_id;
        $job->job_title = $request->job_title;
        $job->user_id = Auth::user()->id;
        $job->company = $request->company;
        $job->education = $request->education;
        $job->experience = $request->experience;
        $job->salary = $request->salary;
        $job->vacancy = $request->vacancy;
        $job->location_id = $request->location_id;
        $job->employment_status = $request->employment_status;
        $job->address = $request->address;
        $job->address2 = $request->address2;
        $job->gender = $request->gender;
        $job->age = $request->age;
        $job->address2 = $request->address2;
        $job->deadline = $request->deadline;
        $job->phone = $request->phone;
        $job->email = $request->email;
        $job->banner = $request->banner;
        $job->slug = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', $request->slug));
        $job->short_description = $request->short_description;
        $job->job_description = $request->job_description;

        $job->meta_title = $request->meta_title;
        $job->meta_img = $request->meta_img;
        $job->meta_description = $request->meta_description;
        $job->meta_keywords = $request->meta_keywords;

        $job->save();

        if(Auth::user()->user_type == 'customer'){
            flash(translate('Circuler has been updated successfully'))->success();
        return redirect()->route('users.job');
        }
        else {
            abort(404);
        }
    }


    public function change_status(Request $request)
    {
        $job = Jobs::find($request->id);
        $job->status = $request->status;
        $job->save();
        return 1;
        if(Auth::user()->user_type == 'admin'){
            $job = Jobs::find($request->id);
        $job->status = $request->status;
        $job->save();
        return 1;
        }
        else {
            abort(404);
        }
    }

    public function getDistrict($permanent_division)
    {
        $dis = DB::table('districts')->where('DivisionId',$permanent_division)->get();
        return json_encode($dis);
    }

    public function application($id)
    {
        $job = Jobs::find($id);
        $job_category = JobCategory::all();
        $job_locations = JobLocations::orderBy('location','ASC')->get();
        $job_application = JobApplication::all();
        $education = educations::all();

        return view("frontend.user.job_circuler.apply", compact('job','job_category','job_locations', 'job_application', 'education'));
    }

    public function SuccessApplication(Request $request)
    {
        $user = Auth::user();
        $app = JobApplication::find($request->id);
        if ($user != null) {

            $title =  $user->application->job_title;
            $id = $user->application->id;


            $array['view'] = 'emails.success';
            $array['from'] = env('MAIL_FROM_ADDRESS');
            $array['subject'] = translate('Application Post:').$title;
            $array['name'] = translate($user->name);

            Mail::to($user->email)->queue(new EmailManager($array));
            flash(translate('Your Application has been send successfully, We will check your application'))->success();

            return view('frontend.user.job_circuler.success');
        }
        else {
            flash(translate('No account exists with this email'))->error();
            return back();
        }






        // flash(translate('Your Application has been send successfully, We will check your application'))->success();
        // return view('frontend.user.job_circuler.success' , compact('job','job_category','job_locations', 'job_application', 'education'));

    }


    public function StoreApplication(Request $request)
    {
        $request->validate([
            'name' => 'required|max:50|min:5',
            'father_name' => 'required',
            'mother_name' => 'required',
            'date' => 'required|before:01-01-2003|after:01-01-1985',
            'agree' => 'required',
            'permanent_road' => 'required',
            'permanent_area' => 'required',
            'permanent_thana' => 'required',
            'permanent_district' => 'required',
            'permanent_division' => 'required',
            'permanent_house' => 'required',
            'permanent_postal_code' => 'required|numeric',
            // 'present_postal_code' => 'numeric',
            'nationality' => 'required',
            'gender' => 'required',
            'marital' => 'required',
            'nid' => 'required|min:10|max:13',
            'email' => 'required|email',
            'mobile' => 'required|numeric|min:11',
            'photo' => 'required|mimes:jpeg,jpg,png,gif'

        ],
        [
            'agree.required' => 'You must agree with our terms and conditions',
            'mobile.min' => 'The mobile number must be at least 11 Digits.',
            'mobile.max' => 'The mobile number may not be greater than 11 Digits.',
            'date.before' => 'Your age must be at least 18 years.',
            'date.after' => 'Your can not set birthday before 01/01/1985'
        ]);





       $img = $request->file('photo');
       $name = strtolower($img->getClientOriginalName()).'-'.hexdec(uniqid()).'.'.strtolower($img->getClientOriginalExtension());
       $up_location = 'public/uploads/apply_photo/';
       $img_url = $up_location.$name;
       Image::make($img)->resize(590, 708)->save($up_location.$name);


        $import = new JobApplication;

        $import->photo = $img_url;
        $import->id = round(microtime(true));
        $import->name = $request->name;
        $import->father_name = $request->father_name;
        $import->mother_name = $request->mother_name;
        $import->date = $request->date;

        $import->about = $request->about;
        $import->agree = $request->agree;
        $import->same_as_permanent = $request->same_as_permanent;

        $import->permanent_division = $request->permanent_division;
        $import->permanent_district = $request->permanent_district;
        $import->permanent_thana = $request->permanent_thana;
        $import->permanent_area = $request->permanent_area;
        $import->permanent_road = $request->permanent_road;
        $import->permanent_house = $request->permanent_house;
        $import->permanent_postal_code = $request->permanent_postal_code;

        $import->present_division = $request->present_division;
        $import->present_district = $request->present_district;
        $import->present_thana = $request->present_thana;
        $import->present_area = $request->present_area;
        $import->present_road = $request->present_road;
        $import->present_house = $request->present_house;
        $import->present_postal_code = $request->present_postal_code;

        $import->nationality = $request->nationality;
        $import->marital = $request->marital;
        $import->nid = $request->nid;
        $import->user_id = Auth::user()->id;
        $import->user_name = Auth::user()->name;

        $import->email = $request->email;
        $import->mobile = $request->mobile;
        $import->facebook = $request->facebook;
        $import->linkdin = $request->linkdin;
        $import->email = $request->email;

        $import->gender = $request->gender;

        $import->circuler_id = $request->circuler_id;
        $import->location_id = $request->location_id;
        $import->job_title = $request->job_title;
        $import->category_id = $request->category_id;
        $import->created_at = Carbon::now();

        $skill = array();
        if($request->skill[0] != null){
        foreach (json_decode($request->skill[0]) as $key => $tag) {
            array_push($skill, $tag->value);
        }
        }
        $import->skill        = implode(',', $skill);
        $import->save();


            flash(translate('Application has been send successfully'))->success();
            return Redirect()->route('education.view');
    }


    public function EduIndex()

    {
        $application = JobApplication::all();
        $education = educations::where('user_id', Auth::user()->id)->get();


        $exp = experience::where('user_id', Auth::user()->id)->get();
        return view('frontend.user.job_circuler.apply_step2', compact('education','application', 'exp'));

    }

    public function EduStore(Request $request)
    {
        $request->validate([
            'degree' => 'required|max:60',
            'institute' => 'required',
            'roll' => 'required',
            'subject' => 'required',
            'degree' => 'required',
            'result' => 'required',
            'passing_year' => 'required',

        ]);
        if (educations::where('user_id', Auth::user()->id)->first() == null) {
        educations::insert([

        'degree'=> $request->degree,
        'institute' => $request->institute,
        'board' => $request->board,
        'roll' => $request->roll,
        'subject' => $request->subject,
        'passing_year' => $request->passing_year,
        'result'=> $request->result,
        'user_id' => Auth::user()->id,
        'added_by' => Auth::user()->name,
        'set_default' => 1,
        'created_at' => Carbon::now()
            ]);
        }
        else {
            educations::insert([

                'degree'=> $request->degree,
                'institute' => $request->institute,
                'board' => $request->board,
                'roll' => $request->roll,
                'subject' => $request->subject,
                'passing_year' => $request->passing_year,
                'result'=> $request->result,
                'user_id' => Auth::user()->id,
                'added_by' => Auth::user()->name,
                'created_at' => Carbon::now()
                    ]);
        }
            flash(translate('Educational status has been inserted successfully'))->success();
                return Redirect()->route('education.view');

    }

    public function EduUpdate(Request $id, $request)
    {
        $education = educations::FindOrFail($id);
        $education->degree = $request->degree;
        $education->institute = $request->institute;
        $education->board = $request->board;
        $education->subject = $request->subject;
        $education->passing_Year = $request->passing_Year;
        $education->result = $request->result;
        $education->save();

                flash(translate('Educational Status has been Updated Successfully'))->success();
                    return Redirect()->route('application');
    }

    public function EduEdit($id)
    {
        $data['address_data'] = educations::findOrFail($id);
        return view('frontend.user.job_circuler.edit_education_modal', $data);
    }


    public function EduDestroy($id)
    {
        $education = educations::findOrFail($id);
        if(!$education->set_default){
            $education->delete();
            flash(translate('Data Successfully Deleted'))->success();
            return back();
        }
        flash(translate('Default address can not be deleted'))->warning();
        return back();
    }

    public function set_default($id){
        foreach (Auth::user()->education as $key => $educations) {
            $educations->set_default = 0;
            $educations->save();
        }
        $education = educations::findOrFail($id);
        $education->set_default = 1;
        $education->save();
        flash(translate('Default Educational status set successfully'))->success();
        return back();
    }

// experience start



public function expStore(Request $request)
{
$request->validate([
    'description' => 'required|max:60',
    'organization' => 'required|max:50',
    'employment_period_start' => 'required|date|before:today',
    'employment_period_end' => 'required|date|before:today|after:employment_period_start',
]);

    experience::insert([

    'organization'=> $request->organization,
    'employment_period_start' => $request->employment_period_start,
    'employment_period_end' => $request->employment_period_end,
    'designation' => $request->designation,
    'description' => $request->description,
    'user_id' => Auth::user()->id,
    'created_at' => Carbon::now()
        ]);

        flash(translate('Experience status has been inserted successfully'))->success();
            return Redirect()->back();

}




    public function expEdit($id)
    {
        $data['address_data'] = educations::findOrFail($id);
        return view('frontend.user.job_circuler.edit_education_modal', $data);
    }


    public function expDestroy($id)
    {
        $education = experience::findOrFail($id);
        if(!$education->set_default){
            $education->delete();
            flash(translate('Data Successfully Deleted'))->success();
            return back();
        }
        flash(translate('Default experience can not be deleted'))->warning();
        return back();
    }

    public function exp_set_default($id){
        foreach (Auth::user()->experiences as $key => $experience) {
            $experience->set_default = 0;
            $experience->save();
        }
        $education = experience::findOrFail($id);
        $education->set_default = 1;
        $education->save();
        flash(translate('Default experience status set successfully'))->success();
        return back();
    }

    // Finish

    public function afterApply(Request $request) {
        $user = Auth::user();
        // $aid = JobApplication::where('circuler_id', $request->id)->first();
        if (experience::where('user_id', Auth::user()->id)->first() && educations::where('user_id', Auth::user()->id)->first()) {

            if ($user != null) {

                $title =  $request->job_title;
                $cid = $request->circuler_id;
                $aid = $request->id;
                $mail = $request->email;


                $array['view'] = 'emails.success';
                $array['from'] = env('MAIL_FROM_ADDRESS');
                $array['subject'] = translate('Application Sub: ').$title;
                $array['name'] = translate($user->name);
                $array['aid'] = translate('Your Application ID: ').$aid;
                $array['cid'] = translate('Circuler ID: ').$cid;

                Mail::to($mail)->queue(new EmailManager($array));
                flash(translate('Your Application has been send successfully, We will check your application'))->success();

                return view('frontend.user.job_circuler.success');
            }
            else {
                flash(translate('No account exists with this email'))->error();
                return back();
            }
        }
        else {
            flash(translate('You have to fillup experience & education before finish'))->error();
            return back();
        }
    }

    public function alljobs() {
        $jobs = Jobs::where('status', 1)->orderBy('job_title', 'asc')->paginate(12);
        return view("frontend.job.listing", compact('jobs'));
    }

    public function job_details(Request $id, $slug) {
        $job = Jobs::with('user')->FindOrFail($id);
        $jobs = Jobs::where('slug', $slug)->first();
        $user = User::all();
        $months = DB::table('months')->get();
        return view("frontend.job.details", compact('jobs','job','user', 'months'));
    }

}
