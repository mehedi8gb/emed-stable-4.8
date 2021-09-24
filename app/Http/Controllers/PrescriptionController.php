<?php

namespace App\Http\Controllers;

use App\Prescription;
use App\Upload;
use App\User;
use Illuminate\Support\Facades\Response;
use Chatify\Facades\ChatifyMessenger as Chatify;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PrescriptionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $prescription = Prescription::with('proceed','user')->orderBy('created_at', 'desc');
     // Date
        $date_search = null;

        if ($request->date != null){
            $prescription = $prescription->where('created_at', 'like', '%'.$request->date_search.'%');
            $date_search = $request->date;
        }

     // user_search
        $user_search = null;

        if ($request->user != null){
            $prescription = $prescription->where('user_id', 'like', '%'.$request->user.'%')->orWhere('name', 'like', '%'.$request->user.'%');
            $user_search = $request->user;
        }
     // Prescription search
        $p_search = null;

        if ($request->p != null){
            $prescription = $prescription->where('id', 'like', '%'.$request->p.'%');
            $p_search = $request->p;
        }
     // proceed by search
        $proceed_search = null;

        if ($request->proceed != null){
            $prescription = $prescription->where('proceed_by', 'like', '%'.$request->proceed.'%');
            $proceed_search = $request->proceed;
        }

        $prescription = $prescription->paginate(50);
        $count = Prescription::all()->count();
      // $user = User::with('prescriptions')->get();


        if(Auth::user()->user_type == 'customer'){
            return view('frontend.user.prescriptions.index', compact('prescription', 'date_search', 'user_search', 'proceed_search'));
        }
        if(Auth::user()->user_type == 'admin'){
            return view('backend.prescriptions.index', compact('prescription', 'date_search', 'user_search', 'proceed_search', 'count'));
        }
        if(Auth::user()->user_type == 'staff'){
            return view('backend.prescriptions.index', compact('prescription', 'date_search', 'p_search', 'proceed_search'));
        }
        if(Auth::user()->user_type == 'seller'){
            return view('frontend.user.prescriptions.index', compact('prescription'));
        }
        else {
            abort(404);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if(Auth::user()->user_type == 'customer'){
            return view('frontend.user.prescriptions.add');
        }
        if(Auth::user()->user_type == 'admin'){
            return view('backend.prescriptions.add');
        }
        if(Auth::user()->user_type == 'seller'){
            return view('frontend.user.prescriptions.add');
        }
        else {
            abort(404);
        }

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $request->validate([

            'message' => 'required',

            'prescription' => 'required'


        ]);

         $prescription = $request->file('prescription');
         $name_gen = hexdec(uniqid());
        $extension = strtolower($prescription->getClientOriginalExtension());
        $name = $name_gen.'.'.$extension;
        $up_location = 'public/uploads/prescriptions/';

        $last_img = $up_location.$name;
        $prescription->move($up_location,$name);

        Prescription::insert([
            'prescription' => $last_img,
            'message' => $request->message,
           'created_at' => Carbon::now(),
            'user_id' => Auth::user()->id,
             'name' => Auth::user()->name

        ]);

    flash(translate('Application has been send successfully'))->success();
    return Redirect()->route('prescription');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function admin_show($id)
    {

    }

    public function sendMsg(Request $request) {



        // default variables
        $error = (object)[
          'status' => 0,
          'message' => null
      ];
      $attachment = null;
      $attachment_title = null;

      // if there is attachment [file]
      if ($request->hasFile('file')) {
          // allowed extensions
          $allowed_images = Chatify::getAllowedImages();
          $allowed_files  = Chatify::getAllowedFiles();
          $allowed        = array_merge($allowed_images, $allowed_files);

          $file = $request->file('file');
          // if size less than 150MB
          if ($file->getSize() < 150000000) {
              if (in_array($file->getClientOriginalExtension(), $allowed)) {
                  // get attachment name
                  $attachment_title = $file->getClientOriginalName();
                  // upload attachment and store the new name
                  $attachment = Str::uuid() . "." . $file->getClientOriginalExtension();
                  $file->storeAs("public/" . config('chatify.attachments.folder'), $attachment);
              } else {
                  $error->status = 1;
                  $error->message = "File extension not allowed!";
              }
          } else {
              $error->status = 1;
              $error->message = "File extension not allowed!";
          }
      }

      if (!$error->status) {
          // send to database
          $messageID = mt_rand(9, 999999999) + time();
          Chatify::newMessage([
              'id' => $messageID,
              'type' => Auth::user()->user_type,
              'from_id' => Auth::user()->id,
              'to_id' => $request->to_id,
              'body' => htmlentities(trim($request['message']), ENT_QUOTES, 'UTF-8'),
              'attachment' => ($attachment) ? json_encode((object)[
                  'new_name' => $attachment,
                  'old_name' => $attachment_title,
              ]) : null,
          ]);

          // fetch message to send it with the response
          $messageData = Chatify::fetchMessage($messageID);

          // send to user using pusher
          Chatify::push('private-chatify', 'messaging', [
              'from_id' => Auth::user()->id,
              'to_id' => $request['to_id'],
              'message' => Chatify::messageCard($messageData, 'default')
          ]);
      }

      // send the response
      flash(translate('Your Message Has Been Sent Successfully'))->success();
      return Redirect()->route('chat');
      return Response::json([
          'status' => '200',
          'error' => $error,
          'message' => Chatify::messageCard(@$messageData),
          'tempID' => $request['temporaryMsgId'],
      ]);

      }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        $pres = Prescription::find($id);
            $pres->prescription = $request->prescription;
            $pres->message = $request->message;
            $pres->proceed_by = $request->proceed_by;
            $pres->updated_at = Carbon::now();
            $pres->user_id = Auth::user()->id;
            $pres->name = Auth::user()->name;
            $pres->save();

        flash(translate('Prescription saved successfully'))->success();


        if(Auth::user()->user_type == 'customer'){
            return Redirect()->route('prescription');
        }
        if(Auth::user()->user_type == 'admin'){
            return Redirect()->route('prescriptions');
        }
        if(Auth::user()->user_type == 'seller'){
            return Redirect()->route('prescription');
        }
        else {
            abort(404);
        }



    }

    public function proceed(Request $request, $id)
    {


        $prescription = Prescription::find($id);
        $prescription->viewed = 1;

        $prescription->proceed_by = $request->proceed_by;
        $prescription->action_taken_at = Carbon::now();

        $prescription->save();

    flash(translate('Action taken successfully'))->success();
    // return Redirect()->route('poin-of-sales.index');
    return Redirect()->route('prescriptions');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {


        if(Auth::user()->user_type == 'admin'){

           $data = Prescription::find($id);
           $old_data = $data->prescription;
           unlink($old_data);

           $data->delete();

        flash(translate('Prescription has been deleted successfully'))->success();

        return Redirect()->route('prescriptions');

            }
            elseif(Auth::user()->user_type == 'customer'){

                $data = Prescription::find($id);
                $old_data = $data->prescription;
                unlink($old_data);

                $data->delete();

        flash(translate('Prescription has been deleted successfully'))->success();

        return redirect()->route('prescription');

            }
            else {
                abort(404);
            }


    }
}
