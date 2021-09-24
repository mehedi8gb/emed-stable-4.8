<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Response;
use App\Doctors;
use App\Category;
use App\FlashDeal;
use App\Brand;
use App\Product;
use App\PickupPoint;
use App\CustomerPackage;
use App\CustomerProduct;
use App\User;
use App\Seller;
use App\Shop;
use Illuminate\Support\Facades\Cookie;
use App\Color;
use App\Order;
use App\BusinessSetting;
use App\educations;
use App\experience;
use App\Generic;
use App\Http\Controllers\SearchController;
use ImageOptimizer;

use Illuminate\Support\Str;
use App\Mail\SecondEmailVerifyMailManager;
use App\minor_group_id;
use App\Models\Staff;
use Mail;
use App\ChMessage as Message;
use App\ChFavorite as Favorite;
use App\Models\Review;
use App\SellerProduct;
use Chatify\Facades\ChatifyMessenger as Chatify;
use App\Utility\TranslationUtility;
use App\Utility\CategoryUtility;
use Carbon\Carbon;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Facades\Redirect;
use Laracasts\Flash\Flash;
use Mpdf\Tag\Input;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx\Rels;

class HomeController extends Controller
{
    public function login()
    {
        if(Auth::check()){
            return redirect()->route('home');
        }
        return view('frontend.user_login');
    }

    public function registration(Request $request)
    {
        if(Auth::check()){
            return redirect()->route('home');
        }
        if($request->has('referral_code') &&
                \App\Addon::where('unique_identifier', 'affiliate_system')->first() != null &&
                \App\Addon::where('unique_identifier', 'affiliate_system')->first()->activated) {

            try {
                $affiliate_validation_time = \App\AffiliateConfig::where('type', 'validation_time')->first();
                $cookie_minute = 30 * 24;
                if($affiliate_validation_time) {
                    $cookie_minute = $affiliate_validation_time->value * 60;
                }

                Cookie::queue('referral_code', $request->referral_code, $cookie_minute);
                $referred_by_user = User::where('referral_code', $request->product_referral_code)->first();

                $affiliateController = new AffiliateController;
                $affiliateController->processAffiliateStats($referred_by_user->id, 1, 0, 0, 0);
            } catch (\Exception $e) {

            }
        }
        return view('frontend.user_registration');
    }

    public function cart_login(Request $request)
    {
        $user = User::whereIn('user_type', ['customer', 'seller'])->where('email', $request->email)->orWhere('phone', $request->email)->first();
        if($user != null){
            if(Hash::check($request->password, $user->password)){
                if($request->has('remember')){
                    auth()->login($user, true);
                }
                else{
                    auth()->login($user, false);
                }
            }
            else {
                flash(translate('Invalid email or password!'))->warning();
            }
        }
        return back();
    }
    public function job_login(Request $request)
    {
        $user = User::whereIn('user_type', ['customer', 'seller'])->where('email', $request->email)->orWhere('phone', $request->email)->first();
        if($user != null){
            if(Hash::check($request->password, $user->password)){
                if($request->has('remember')){
                    auth()->login($user, true);
                }
                else{
                    auth()->login($user, false);
                }
            }
            else {
                flash(translate('Invalid email or password!'))->warning();
            }
        }
        return Redirect()->back();
    }

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('auth');
    }

    /**
     * Show the admin dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function admin_dashboard()
    {
        return view('backend.dashboard');
    }

    /**
     * Show the customer/seller dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function dashboard()
    {
        if(Auth::user()->user_type == 'seller'){
            return view('frontend.user.seller.dashboard');
        }
        elseif(Auth::user()->user_type == 'customer'){
            return view('frontend.user.customer.dashboard');
        }
        elseif(Auth::user()->user_type == 'delivery_boy'){
            return view('delivery_boys.frontend.dashboard');
        }
        // elseif(Auth::user()->user_type == 'lab_user'){
        //     return view('frontend.user.seller.dashboard');
        // }
        else {
            abort(404);
        }
    }

    public function profile(Request $request)
    {
        if(Auth::user()->user_type == 'customer'){
            return view('frontend.user.customer.profile');
        }
        elseif(Auth::user()->user_type == 'delivery_boy'){
            return view('delivery_boys.frontend.profile');
        }
        elseif(Auth::user()->user_type == 'seller'){
            return view('frontend.user.seller.profile');
        }
        // elseif(Auth::user()->user_type == 'lab_user'){
        //     return view('frontend.user.seller.profile');
        // }

    }

    public function customer_update_profile(Request $request)
    {
        if(env('DEMO_MODE') == 'On'){
            flash(translate('Sorry! the action is not permitted in demo '))->error();
            return back();
        }

        $user = Auth::user();
        $user->name = $request->name;
        $user->address = $request->address;
        $user->country = $request->country;
        $user->city = $request->city;
        $user->postal_code = $request->postal_code;
        $user->phone = $request->phone;

        if($request->new_password != null && ($request->new_password == $request->confirm_password)){
            $user->password = Hash::make($request->new_password);
        }
        $user->avatar_original = $request->photo;

        if($user->save()){
            flash(translate('Your Profile has been updated successfully!'))->success();
            return back();
        }

        flash(translate('Sorry! Something went wrong.'))->error();
        return back();
    }


    public function seller_update_profile(Request $request)
    {
        if(env('DEMO_MODE') == 'On'){
            flash(translate('Sorry! the action is not permitted in demo '))->error();
            return back();
        }

        $user = Auth::user();
        $user->name = $request->name;
        $user->address = $request->address;
        $user->country = $request->country;
        $user->city = $request->city;
        $user->postal_code = $request->postal_code;
        $user->phone = $request->phone;

        if($request->new_password != null && ($request->new_password == $request->confirm_password)){
            $user->password = Hash::make($request->new_password);
        }
        $user->avatar_original = $request->photo;

        $seller = $user->seller;
        $seller->cash_on_delivery_status = $request->cash_on_delivery_status;
        $seller->bank_payment_status = $request->bank_payment_status;
        $seller->bank_name = $request->bank_name;
        $seller->bank_acc_name = $request->bank_acc_name;
        $seller->bank_acc_no = $request->bank_acc_no;
        $seller->bank_routing_no = $request->bank_routing_no;

        if($user->save() && $seller->save()){
            flash(translate('Your Profile has been updated successfully!'))->success();
            return back();
        }

        flash(translate('Sorry! Something went wrong.'))->error();
        return back();
    }

    /**
     * Show the application frontend home.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        return view('frontend.index');
    }

    public function flash_deal_details($slug)
    {
        $flash_deal = FlashDeal::where('slug', $slug)->first();
        if($flash_deal != null)
            return view('frontend.flash_deal_details', compact('flash_deal'));
        else {
            abort(404);
        }
    }

    public function load_featured_section(){
        return view('frontend.partials.featured_products_section');
    }

    public function load_best_selling_section(){

        return view('frontend.partials.best_selling_section');
    }

    public function load_home_categories_section(){
        return view('frontend.partials.home_categories_section');
    }

    public function load_best_sellers_section(){
        return view('frontend.partials.best_sellers_section');
    }

    public function trackOrder(Request $request)
    {
        if($request->has('order_code')){
            $order = Order::where('code', $request->order_code)->first();
            if($order != null){
                return view('frontend.track_order', compact('order'));
            }
        }
        return view('frontend.track_order');
    }

    public function product(Request $request, $slug)
    {
        $detailedProduct  = Product::where('slug', $slug)->first();
        $generics = Product::with('generic')->get();
        $categories = Category::get();
        $minor = minor_group_id::get();
        $labs = Shop::where('active_lab', 1)->get();


        if($detailedProduct != null && $detailedProduct->published){
            //updateCartSetup();
            if($request->has('product_referral_code') &&
                    \App\Addon::where('unique_identifier', 'affiliate_system')->first() != null &&
                    \App\Addon::where('unique_identifier', 'affiliate_system')->first()->activated) {

                $affiliate_validation_time = \App\AffiliateConfig::where('type', 'validation_time')->first();
                $cookie_minute = 30 * 24;
                if($affiliate_validation_time) {
                    $cookie_minute = $affiliate_validation_time->value * 60;
                }
                Cookie::queue('product_referral_code', $request->product_referral_code, $cookie_minute);
                Cookie::queue('referred_product_id', $detailedProduct->id, $cookie_minute);

                $referred_by_user = User::where('referral_code', $request->product_referral_code)->first();

                $affiliateController = new AffiliateController;
                $affiliateController->processAffiliateStats($referred_by_user->id, 1, 0, 0, 0);
            }
            if($detailedProduct->digital == 1){
                return view('frontend.digital_product_details', compact('detailedProduct', 'generics', 'labs'));
            }
            else {
                return view('frontend.product_details', compact('detailedProduct', 'minor' , 'generics', 'categories'));
            }
            // return view('frontend.product_details', compact('detailedProduct'));
        }
        abort(404);
    }

    public function shop($slug)
    {
        $shop  = Shop::where('slug', $slug)->first();
        if($shop!=null){
            $seller = Seller::where('user_id', $shop->user_id)->first();
            if ($seller->verification_status != 0){
                return view('frontend.seller_shop', compact('shop'));
            }
            else{
                return view('frontend.seller_shop_without_verification', compact('shop', 'seller'));
            }
        }
        abort(404);
    }

    public function filter_shop($slug, $type)
    {
        $shop  = Shop::where('slug', $slug)->first();
        if($shop!=null && $type != null){
            return view('frontend.seller_shop', compact('shop', 'type'));
        }
        abort(404);
    }

    public function all_categories(Request $request)
    {
//        $categories = Category::where('level', 0)->orderBy('name', 'asc')->get();
        $categories = Category::where('level', 0)->orderBy('order_level', 'desc')->get();
        return view('frontend.all_category', compact('categories'));
    }
    public function all_brands(Request $request)
    {
        $categories = Category::all();
        return view('frontend.all_brand', compact('categories'));
    }
// vendor
    public function show_product_upload_form(Request $request)
    {
        if(\App\Addon::where('unique_identifier', 'seller_subscription')->first() != null && \App\Addon::where('unique_identifier', 'seller_subscription')->first()->activated){
            if(Auth::user()->seller->remaining_uploads > 0){
                $categories = Category::where('parent_id', 0)
                    ->where('digital', 0)
                    ->with('childrenCategories')
                    ->get();
                return view('frontend.user.seller.product_upload', compact('categories'));
            }
            else {
                flash(translate('Upload limit has been reached. Please upgrade your package.'))->warning();
                return back();
            }
        }
        $categories = Category::where('parent_id', 0)
            ->where('digital', 0)
            ->with('childrenCategories')
            ->get();
            $product = Product::get();
        return view('frontend.user.seller.product_upload', compact('categories', 'product'));
    }
    public function show_product_upload_form_step2(Request $request)
    {

        $categories = Category::where('parent_id', 0)
            ->where('digital', 0)
            ->with('childrenCategories')
            ->get();
            $products = Product::with('generic')->where('brand_id', $request->id)->get();
            $company = SellerProduct::where('user_id', Auth::user()->id)->where('company_id', $request->id)->first();
        return view('frontend.user.seller.product_upload_step_2', compact('categories','company' ,'products'));
    }

    public function SellerProductStore(Request $request)
    {
$test = array($request->id,$request->product_id,$request->qty);
foreach($test as $key) {
    $data = array('id' => 'test_name', 'test' => $key, 'property' => 'test_property');
    SellerProduct::find($request->id)->insert($data);
}
    }

    public function companyStore(Request $request)
    { $request->validate([
        'company_id' => 'required',
        'company_discount' => 'required'
    ],[
        'company_id.required' => 'Company Name field Can Not be Empty',
        'company_discount.required' => 'Company Discount field Can Not be Empty'
    ]);

        if(SellerProduct::where('company_id', $request->company_id)->first() == null){
        $data = new SellerProduct;
        $data->user_id = Auth::user()->id;
        $data->company_id = $request->company_id;
        $data->company_discount = $request->company_discount;
        $data->discount_type = $request->discount_type;
        $data->save();
        flash(translate('Successfully Update Company.'))->success();
        return Redirect()->route('seller.products.add.2',['id'=> $request->company_id]);
        }
        else{
        flash(translate('You Can Not Add Same Company Twice.'))->warning();
        return back();

        }


    }

    public function show_add_product_upload_form(Request $request)
    {
        if(\App\Addon::where('unique_identifier', 'seller_subscription')->first() != null && \App\Addon::where('unique_identifier', 'seller_subscription')->first()->activated){
            if(Auth::user()->seller->remaining_uploads > 0){
                $categories = Category::where('parent_id', 0)
                    ->where('digital', 0)
                    ->with('childrenCategories')
                    ->get();
                return view('frontend.user.seller.product_update', compact('categories'));
            }
            else {
                flash(translate('Upload limit has been reached. Please upgrade your package.'))->warning();
                return back();
            }
        }
        $categories = Category::where('parent_id', 0)
            ->where('digital', 0)
            ->with('childrenCategories')
            ->get();
            $products = Product::get();
        return view('frontend.user.seller.product_upload', compact('categories', 'products'));
    }

    public function profile_edit(Request $request){
		//bugs
    }

    public function show_product_edit_form(Request $request, $id)
    {
        $product = Product::findOrFail($id);
        $lang = $request->lang;
        $tags = json_decode($product->tags);
        $categories = Category::where('parent_id', 0)
            ->where('digital', 0)
            ->with('childrenCategories')
            ->get();
        return view('frontend.user.seller.product_edit', compact('product', 'categories', 'tags', 'lang'));
    }

    public function seller_product_list(Request $request)
    {
        $search = null;
        $products = Product::where('user_id', Auth::user()->id)->where('digital', 0)->orderBy('created_at', 'desc');
        if ($request->has('search')) {
            $search = $request->search;
            $products = $products->where('name', 'like', '%'.$search.'%');
        }
        $products = $products->paginate(10);
        return view('frontend.user.seller.products', compact('products', 'search'));
    }

    public function ajax_search(Request $request)
    {
        $keywords = array();
        $products = Product::where('published', 1)->orderBy('name', 'asc')->where('name', 'like', '%'.$request->search.'%')->orWhere('tags', 'like', '%'.$request->search.'%')->get();
        foreach ($products as $key => $product) {
            foreach (explode(',',$product->tags) as $key => $tag) {
                if(stripos($tag, $request->search) !== false){
                    if(sizeof($keywords) > 5){
                        break;
                    }
                    else{
                        if(!in_array(strtolower($tag), $keywords)){
                            array_push($keywords, strtolower($tag));
                        }
                    }
                }
            }
        }

        $products = filter_products(Product::where('published', 1)->orderBy('name', 'asc')->where('name', 'like', '%'.$request->search.'%'))
        ->orWhere('tags', 'like', '%'.$request->search.'%')->get()->take(7);
        $indicates = Product::where('indicates', 'like', '%'.$request->search.'%')->get()->take(7);
        $categories = Category::where('name', 'like', '%'.$request->search.'%')->get()->take(7);
        $generics = Generic::where('name', 'like', '%'.$request->search.'%')->get()->take(7);


        // $shops = Shop::whereIn('user_id', verified_sellers_id())->where('name', 'like', '%'.$request->search.'%')->get()->take(3);

        $minor_group = minor_group_id::get();
        if(sizeof($keywords)>0 || sizeof($categories)>0 || sizeof($products)>0 || sizeof($generics)>0 || sizeof($indicates)>0){
            return view('frontend.partials.search_content', compact('products', 'categories', 'keywords','indicates',  'minor_group','generics'));
        }
        return '0';
    }

    public function listing(Request $request)
    {
        return $this->search($request);
    }

    public function listingByCategory(Request $request, $category_slug)
    {
        $category = Category::where('slug', $category_slug)->first();
        if ($category != null) {
            return $this->search($request, $category->id);
        }
        abort(404);
    }

    public function listingByBrand(Request $request, $brand_slug)
    {
        $brand = Brand::where('slug', $brand_slug)->first();
        if ($brand != null) {
            return $this->search($request, null, $brand->id);
        }
        abort(404);
    }

    public function search(Request $request, $category_id = null, $brand_id = null)
    {
        $query = $request->q;
        $sort_by = $request->sort_by;
        $min_price = $request->min_price;
        $max_price = $request->max_price;
        $seller_id = $request->seller_id;

        $conditions = ['published' => 1];

        if($brand_id != null){
            $conditions = array_merge($conditions, ['brand_id' => $brand_id]);
        }elseif ($request->brand != null) {
            $brand_id = (Brand::where('slug', $request->brand)->first() != null) ? Brand::where('slug', $request->brand)->first()->id : null;
            $conditions = array_merge($conditions, ['brand_id' => $brand_id]);
        }

        if($seller_id != null){
            $conditions = array_merge($conditions, ['user_id' => Seller::findOrFail($seller_id)->user->id]);
        }

        $products = Product::where($conditions);

        if($category_id != null){
            $category_ids = CategoryUtility::children_ids($category_id);
            $category_ids[] = $category_id;

            $products = $products->whereIn('category_id', $category_ids);
        }

        if($min_price != null && $max_price != null){
            $products = $products->where('unit_price', '>=', $min_price)->where('unit_price', '<=', $max_price);
        }

        if($query != null){
            $searchController = new SearchController;
            $searchController->store($request);
            $products = $products->where('name', 'like', '%'.$query.'%')->orWhere('tags', 'like', '%'.$query.'%');
        }

        switch ($sort_by) {
            case 'newest':
                $products->orderBy('created_at', 'desc');
                break;
            case 'oldest':
                $products->orderBy('created_at', 'asc');
                break;
            case 'price-asc':
                $products->orderBy('unit_price', 'asc');
                break;
            case 'price-desc':
                $products->orderBy('unit_price', 'desc');
                break;
            default:
                $products->orderBy('created_at', 'desc');
                break;
        }


        $non_paginate_products = filter_products($products)->get();

        //Attribute Filter

        $attributes = array();
        foreach ($non_paginate_products as $key => $product) {
            if($product->attributes != null && is_array(json_decode($product->attributes))){
                foreach (json_decode($product->attributes) as $key => $value) {
                    $flag = false;
                    $pos = 0;
                    foreach ($attributes as $key => $attribute) {
                        if($attribute['id'] == $value){
                            $flag = true;
                            $pos = $key;
                            break;
                        }
                    }
                    if(!$flag){
                        $item['id'] = $value;
                        $item['values'] = array();
                        foreach (json_decode($product->choice_options) as $key => $choice_option) {
                            if($choice_option->attribute_id == $value){
                                $item['values'] = $choice_option->values;
                                break;
                            }
                        }
                        array_push($attributes, $item);
                    }
                    else {
                        foreach (json_decode($product->choice_options) as $key => $choice_option) {
                            if($choice_option->attribute_id == $value){
                                foreach ($choice_option->values as $key => $value) {
                                    if(!in_array($value, $attributes[$pos]['values'])){
                                        array_push($attributes[$pos]['values'], $value);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        $selected_attributes = array();

        foreach ($attributes as $key => $attribute) {
            if($request->has('attribute_'.$attribute['id'])){
                foreach ($request['attribute_'.$attribute['id']] as $key => $value) {
                    $str = '"'.$value.'"';
                    $products = $products->where('choice_options', 'like', '%'.$str.'%');
                }

                $item['id'] = $attribute['id'];
                $item['values'] = $request['attribute_'.$attribute['id']];
                array_push($selected_attributes, $item);
            }
        }


        //Color Filter
        $all_colors = array();

        foreach ($non_paginate_products as $key => $product) {
            if ($product->colors != null) {
                foreach (json_decode($product->colors) as $key => $color) {
                    if(!in_array($color, $all_colors)){
                        array_push($all_colors, $color);
                    }
                }
            }
        }

        $selected_color = null;

        if($request->has('color')){
            $str = '"'.$request->color.'"';
            $products = $products->where('colors', 'like', '%'.$str.'%');
            $selected_color = $request->color;
        }


        $products = filter_products($products)->paginate(12)->appends(request()->query());

        return view('frontend.product_listing', compact('products', 'query', 'category_id', 'brand_id', 'sort_by', 'seller_id','min_price', 'max_price', 'attributes', 'selected_attributes', 'all_colors', 'selected_color'));
    }

    public function home_settings(Request $request)
    {
        return view('home_settings.index');
    }

    public function top_10_settings(Request $request)
    {
        foreach (Category::all() as $key => $category) {
            if(is_array($request->top_categories) && in_array($category->id, $request->top_categories)){
                $category->top = 1;
                $category->save();
            }
            else{
                $category->top = 0;
                $category->save();
            }
        }

        foreach (Brand::all() as $key => $brand) {
            if(is_array($request->top_brands) && in_array($brand->id, $request->top_brands)){
                $brand->top = 1;
                $brand->save();
            }
            else{
                $brand->top = 0;
                $brand->save();
            }
        }

        flash(translate('Top 10 categories and brands have been updated successfully'))->success();
        return redirect()->route('home_settings.index');
    }

    public function variant_price(Request $request)
    {
        $product = Product::find($request->id);
        $str = '';
        $quantity = 0;
        $tax = 0;
        $max_limit = 0;

        if($request->has('color')){
            $str = $request['color'];
        }

        if(json_decode($product->choice_options) != null){
            foreach (json_decode($product->choice_options) as $key => $choice) {
                if($str != null){
                    $str .= '-'.str_replace(' ', '', $request['attribute_id_'.$choice->attribute_id]);
                }
                else{
                    $str .= str_replace(' ', '', $request['attribute_id_'.$choice->attribute_id]);
                }
            }
        }

        $product_stock = $product->stocks->where('variant', $str)->first();
        $price = $product_stock->price;
        $quantity = $product_stock->qty;
        $max_limit = $product_stock->qty;
//        if($str != null && $product->variant_product){
//        }
//        else{
//            $price = $product->unit_price;
//            $quantity = $product->current_stock;
//        }


        //Product Stock Visibility
        if($product->stock_visibility_state == 'text') {
            if($quantity >= 1 && $product->min_qty < $quantity){
                $quantity = translate('In Stock');
            }else{
                $quantity = translate('Out Of Stock');
            }
        }
        if($quantity >= 1 && $product->min_qty < $quantity){
            $in_stock = 1;
        }else{
            $in_stock = 0;
        }

        //discount calculation
        $discount_applicable = false;

        if ($product->discount_start_date == null) {
            $discount_applicable = true;
        }
        elseif (strtotime(date('d-m-Y H:i:s')) >= $product->discount_start_date &&
            strtotime(date('d-m-Y H:i:s')) <= $product->discount_end_date) {
            $discount_applicable = true;
        }

        if ($discount_applicable) {
            if($product->discount_type == 'percent'){
                $price -= ($price*$product->discount)/100;
            }
            elseif($product->discount_type == 'amount'){
                $price -= $product->discount;
            }
        }

        // taxes
        foreach ($product->taxes as $product_tax) {
            if($product_tax->tax_type == 'percent'){
                $tax += ($price * $product_tax->tax) / 100;
            }
            elseif($product_tax->tax_type == 'amount'){
                $tax += $product_tax->tax;
            }
        }

        $price += $tax;

        return array(
            'price' => single_price($price*$request->quantity),
            'quantity' => $quantity,
            'digital' => $product->digital,
            'variation' => $str,
            'max_limit' => $max_limit,
            'in_stock' => $in_stock
        );
    }

    public function sellerpolicy(){
        return view("frontend.policies.sellerpolicy");
    }

    public function returnpolicy(){
        return view("frontend.policies.returnpolicy");
    }

    public function supportpolicy(){
        return view("frontend.policies.supportpolicy");
    }

    public function terms(){
        return view("frontend.policies.terms");
    }

    public function privacypolicy(){
        return view("frontend.policies.privacypolicy");
    }

    public function get_pick_ip_points(Request $request)
    {
        $pick_up_points = PickupPoint::all();
        return view('frontend.partials.pick_up_points', compact('pick_up_points'));
    }

    public function get_category_items(Request $request){
        $category = Category::findOrFail($request->id);
        return view('frontend.partials.category_elements', compact('category'));
    }

    public function premium_package_index()
    {
        $customer_packages = CustomerPackage::all();
        return view('frontend.user.customer_packages_lists', compact('customer_packages'));
    }

    public function seller_digital_product_list(Request $request)
    {
        $products = Product::where('user_id', Auth::user()->id)->where('digital', 1)->orderBy('created_at', 'desc')->paginate(10);
        return view('frontend.user.seller.digitalproducts.products', compact('products'));
    }
    public function show_digital_product_upload_form(Request $request)
    {
        if(\App\Addon::where('unique_identifier', 'seller_subscription')->first() != null && \App\Addon::where('unique_identifier', 'seller_subscription')->first()->activated){
            if(Auth::user()->seller->remaining_digital_uploads > 0){
                $business_settings = BusinessSetting::where('type', 'digital_product_upload')->first();
                $categories = Category::where('digital', 1)->get();
                return view('frontend.user.seller.digitalproducts.product_upload', compact('categories'));
            }
            else {
                flash(translate('Upload limit has been reached. Please upgrade your package.'))->warning();
                return back();
            }
        }

        $business_settings = BusinessSetting::where('type', 'digital_product_upload')->first();
        $categories = Category::where('digital', 1)->get();
        return view('frontend.user.seller.digitalproducts.product_upload', compact('categories'));
    }

    public function show_digital_product_edit_form(Request $request, $id)
    {
        $categories = Category::where('digital', 1)->get();
        $lang = $request->lang;
        $product = Product::find($id);
        return view('frontend.user.seller.digitalproducts.product_edit', compact('categories', 'product', 'lang'));
    }

    // Ajax call
    public function new_verify(Request $request)
    {
        $email = $request->email;
        if(isUnique($email) == '0') {
            $response['status'] = 2;
            $response['message'] = 'Email already exists!';
            return json_encode($response);
        }

        $response = $this->send_email_change_verification_mail($request, $email);
        return json_encode($response);
    }


    // Form request
    public function update_email(Request $request)
    {
        $email = $request->email;
        if(isUnique($email)) {
            $this->send_email_change_verification_mail($request, $email);
            flash(translate('A verification mail has been sent to the mail you provided us with.'))->success();
            return back();
        }

        flash(translate('Email already exists!'))->warning();
        return back();
    }

    public function send_email_change_verification_mail($request, $email)
    {
        $response['status'] = 0;
        $response['message'] = 'Unknown';

        $verification_code = Str::random(32);

        $array['subject'] = 'Email Verification';
        $array['from'] = env('MAIL_FROM_ADDRESS');
        $array['content'] = 'Verify your account';
        $array['link'] = route('email_change.callback').'?new_email_verificiation_code='.$verification_code.'&email='.$email;
        $array['sender'] = Auth::user()->name;
        $array['details'] = "Email Second";

        $user = Auth::user();
        $user->new_email_verificiation_code = $verification_code;
        $user->save();

        try {
            Mail::to($email)->queue(new SecondEmailVerifyMailManager($array));

            $response['status'] = 1;
            $response['message'] = translate("Your verification mail has been Sent to your email.");

        } catch (\Exception $e) {
            // return $e->getMessage();
            $response['status'] = 0;
            $response['message'] = $e->getMessage();
        }

        return $response;
    }

    public function email_change_callback(Request $request){
        if($request->has('new_email_verificiation_code') && $request->has('email')) {
            $verification_code_of_url_param =  $request->input('new_email_verificiation_code');
            $user = User::where('new_email_verificiation_code', $verification_code_of_url_param)->first();

            if($user != null) {

                $user->email = $request->input('email');
                $user->new_email_verificiation_code = null;
                $user->save();

                auth()->login($user, true);

                flash(translate('Email Changed successfully'))->success();
                return redirect()->route('dashboard');
            }
        }

        flash(translate('Email was not verified. Please resend your mail!'))->error();
        return redirect()->route('dashboard');

    }

    public function reset_password_with_code(Request $request){
        if (($user = User::where('email', $request->email)->where('verification_code', $request->code)->first()) != null) {
            if($request->password == $request->password_confirmation){
                $user->password = Hash::make($request->password);
                $user->email_verified_at = date('Y-m-d h:m:s');
                $user->save();
                event(new PasswordReset($user));
                auth()->login($user, true);

                flash(translate('Password updated successfully'))->success();

                if(auth()->user()->user_type == 'admin' || auth()->user()->user_type == 'staff')
                {
                    return redirect()->route('admin.dashboard');
                }
                return redirect()->route('home');
            }
            else {
                flash("Password and confirm password didn't match")->warning();
                return redirect()->route('password.request');
            }
        }
        else {
            flash("Verification code mismatch")->error();
            return redirect()->route('password.request');
        }
    }


    public function all_flash_deals() {
        $today = strtotime(date('Y-m-d H:i:s'));

        $data['all_flash_deals'] = FlashDeal::where('status', 1)
                ->where('start_date', "<=", $today)
                ->where('end_date', ">", $today)
                ->orderBy('created_at', 'desc')
                ->get();

        return view("frontend.flash_deal.all_flash_deal_list", $data);
    }

    public function labs(Request $request) {
        $shops = Shop::whereIn('user_id', verified_sellers_id())
                ->paginate(15);

        return view('frontend.shop_listing', compact('shops'));
    }





// Doctors Section


    public function all_doctors(Request $id) {
        $doctor = \App\Staff::with('user', 'educations')->get();
        $users = User::with('educations')->find($id);


        return view('frontend.doctors_listing', compact('doctor', 'users'));
    }


    public function doctor(Request $request) {

        $users = User::with('educations','experiences', 'reviews', 'reviewd_users')->find($request->id);
        // $reviews = Review::with('user')->get();

        return view('frontend.doctor_profile', compact('users'));
    }



function review(Request $request)
{
    $review = new Review;
    $review->user_id = $request->user_id;
    $review->doctor_id = $request->doctor_id;
    $review->name = $request->name;
    $review->email = $request->email;
    $review->comment = $request->comment;
    $review->rating = $request->rating;
    $review->save();
    $reviews = User::findOrFail($request->doctor_id);
    $reviews->rating = $request->rating;
    $reviews->save();
    flash(translate('Your Review Has Been Submited Successfully'))->success();
    return Redirect()->back();

}



public function add_doctor_education(Request $request)
{
    educations::insert([

        'degree'=> $request->degree,
        'institute' => $request->institute,
        'user_id' => $request->user_id,
        'added_by' => Auth::user()->name,
        'created_at' => Carbon::now()
            ]);

            flash(translate('Educational Status has been Inserted Successfully'))->success();
                return Redirect()->route('staffs.create');
}

public function add_doctor_experience(Request $request)
{
    $validated = $request->validate([

        'employment_period' => 'date_format:DD-MM-Y|before:today',
    ]);

    experience::insert([


        'hospital' => $request->hospital,
        'designation' => $request->designation,
        'department' => $request->department,
        'user_id' => $request->user_id,
        'employment_period_start' => $request->employment_period_start,
        'employment_period_end' => $request->employment_period_end,
        'created_at' => Carbon::now()
            ]);

            flash(translate('Experience has been Inserted Successfully'))->success();
                return Redirect()->route('staffs.create');
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
            'to_id' => $request['id'],
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




    public function generic_list(Request $request) {
        $generic = Generic::with('products')->where('active', 1)->paginate(20);

        return view('frontend.generic_listing', compact('generic'));
    }

    public function generic_show(Request $request) {
        $generic  = Generic::where('active', 1)->with('products')->FindOrFail($request->id);

        return view('frontend.generic_show', compact('generic'));
    }

}
