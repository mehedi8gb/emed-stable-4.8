@extends('frontend.layouts.app')

@section('content')


<style>

@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
    .category-item__image, .top-category-item__image {
    border-radius: 50%;
    margin-top: 15px;
    background-color: rgb(240, 230, 198);
    -webkit-box-shadow: 0 5px 20px rgb(36 36 36 / 5%);
    box-shadow: 0 5px 20px rgb(36 36 36 / 5%);
    margin-bottom: 10px;
}


/*

.align-items-center {
    -ms-flex-align: center!important;
    -webkit-box-align: center!important;
    align-items: center!important;
}
.justify-content-between {
    -ms-flex-pack: justify!important;
    -webkit-box-pack: justify!important;
    justify-content: space-between!important;
}
.d-flex {
    display: -ms-flexbox!important;
    display: -webkit-box!important;
    display: flex!important;
}


.imggg {
    max-width: 100%;
    height: auto;
}
.imggg {
    vertical-align: middle;
}
.imggg {
    border-style: none;
}
.imggg {
    vertical-align: middle;
    border-style: none;
}
.category-item {
    text-align: center;
    width: 100%;
    display: inline-block;
    margin-bottom: 10px;
}
.fixxx{
    margin-left: 13px;
    margin-top: 18px;
    margin-bottom: 2px;
}

.vll {
    border-left: 2px solid #007bff;
    height: 74px;
    margin-top: 17px;
}
.category-item__title{
    line-height: 1;
    display: block;
    color: #495057;
    font-weight: 500;
    padding: 0 10px;
    font-family: 'Roboto', sans-serif;
} */
.todays-row-bg {
	background: linear-gradient(-45deg, #52ee744b, #23a5d541, #4423d50e);
	background-size: 400% 400%;
	animation: gradient 10s ease infinite;
    font-size: 16px;
    font-weight: bold;
}

@keyframes gradient {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}



</style>

    {{-- Categories , Sliders . Today's deal --}}
    <div  class="home-banner-area  pt-3">
        <div class="container">
            <div class="row gutters-10 position-relative">
                {{-- <div class="col-lg-3 position-static d-none d-lg-block">
                    @include('frontend.partials.category_menu')
                </div> --}}

                @php
                    $num_todays_deal = count(filter_products(\App\Product::where('published', 1)->where('todays_deal', 1 ))->get());
                    $featured_categories = \App\Category::where('featured', 1)->get();
                @endphp

                <div class="@if($num_todays_deal > 0) col-lg-12 @else col-lg-12 @endif">
                    @if (get_setting('home_slider_images') != null)
                        <div class="aiz-carousel dots-inside-bottom mobile-img-auto-height" data-arrows="true" data-dots="true" data-autoplay="true">
                            @php $slider_images = json_decode(get_setting('home_slider_images'), true);  @endphp
                            @foreach ($slider_images as $key => $value)
                                <div class="carousel-box">
                                    <a href="{{ json_decode(get_setting('home_slider_links'), true)[$key] }}">
                                        <img
                                            class="d-block mw-100 img-fit rounded shadow-sm overflow-hidden"
                                            src="{{ uploaded_asset($slider_images[$key]) }}"
                                            alt="{{ env('APP_NAME')}} promo"
                                            @if(count($featured_categories) == 0)
                                            height="457"
                                            @else
                                            height="315"
                                            @endif
                                            onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder-rect.jpg') }}';"
                                        >
                                    </a>
                                </div>
                            @endforeach
                        </div>
                    @endif




{{-- <div  class="d-xl-none">
    <div   class="container">

            <div  class="row">
                <div style="
                flex-direction: row !important;
                 padding-right: 17px !important;
                padding-left: 11px !important;"
                 class="card ">
                    <div  class="col-3">
                    <a style="color: #4d144b;" href="{{url('flash-deals')}}" class="">
                        <div  class="">
                            <div  class="">
                                <i class="fixxx fad fa-bomb la-2x"></i>
                            </div>
                             <div  class="text-center">Flash Sale</div>
                            </div>
                        </a>
                </div>
                <div class="vl"></div>
                <div  class="col-3">
                    <a style="color: #4d144b;" href="{{url('flash-deals')}}" class="">
                        <div  class="">
                            <div  class="">
                                <i class="fixxx fad fa-flask la-2x"></i></div>
                                 <div  class="text-center">
                                    Lab Test</div>
                            </div>
                            </a>
                </div>
                <div class="vl"></div>
                <div  class="col-3">
                    <a style="color: #4d144b;" href="{{url('flash-deals')}}" class="">
                        <div  class="category-item">
                            <div  class="">
                    <i class="fixxx fad fa-stars la-2x"></i></div> <div style="  font-size: 12px; margin-left: -5px;"  class="text-center">Campaigns</div></div></a>
                </div>
                <div class="vl"></div>
                <div  class="col-3">
                    <a style="color: #4d144b;" href="{{url('doctors')}}" class="">
                        <div  class="category-item">
                            <div  class="">
                                <i class="fixxx fad fa-user-md-chat fa-2x"></i>
                            </div>
                             <div style="font-size: 11px" class="text-center">Find Doctors</div>
                         </div></a>
                </div>
                </div>

            </div>
      </div>

</div> --}}







                    @if (count($featured_categories) > 0)
                        <ul  class="list-unstyled mb-0 row gutters-5">
                            @foreach ($featured_categories as $key => $category)
                                <li class="minw-0 col-4 col-md-2 mt-3">
                                    <a href="{{ route('products.category', $category->slug) }}" class="d-block rounded bg-white p-2 text-reset shadow-sm">
                                        <img
                                            src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                            data-src="{{ uploaded_asset($category->banner) }}"
                                            alt="{{ $category->getTranslation('name') }}"
                                            class="lazyload img-fit"
                                            height="78"
                                            onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder-rect.jpg') }}';"
                                        >
                                        <div class="text-center text-truncate fs-12 fw-600 mt-2 opacity-70">{{ $category->getTranslation('name') }}</div>
                                    </a>
                                </li>
                                {{-- <li class="minw-0 col-4 col-md-2 mt-3">
                                    <div class="text-center text-truncate fs-12 fw-600 mt-2 opacity-70">{{ route('') }}</div>
                                </li> --}}

                            @endforeach
                            {{-- <li class="minw-0 col-4 col-md-2 mt-3">
                                <div class="text-center text-truncate fs-12 fw-600 mt-2 opacity-70">
                                    <a href="{{ route('doctors') }}" class="d-block rounded bg-white p-2 text-reset shadow-sm">
                                        <img
                                            src="http://localhost/4.8/public/uploads/all/J1XNX5M2vLZSGPPVNy1RzaaMODodaopGeqjxFsRH.png"
                                            class="lazyload img-fit"
                                            height="78"
                                            onerror="this.onerror=null;this.src='{{ uploaded_asset('uploads/all/J1XNX5M2vLZSGPPVNy1RzaaMODodaopGeqjxFsRH.png') }}';"
                                        >
                                        <div class="text-center text-truncate fs-12 fw-600 mt-2 opacity-70">{{ translate('Doctors') }}</div>
                                    </a>
                                </div>
                            </li> --}}
                        </ul>
                    @endif

                    {{-- <div  class="d-none d-sm-block">
                        <div  class="container">

                                <div  class="row">
                                    <div  class="col-md-2">
                                        <a  href="{{url('flash-deals')}}" class="">
                                            <div  class="category-item">
                                                <div  class="top-category-item__image">
                                        <img class="imggg"  src="https://storage.googleapis.com/bponi/asset/site/store-multivendor1/flash_sell.jpg" alt=""></div> <div  class="">Flash Sale</div></div></a>
                                    </div>
                                    <div  class="col-md-2">
                                        <a  href="/trending/" class="">
                                            <div  class="category-item">
                                                <div  class="top-category-item__image">
                                        <img class="imggg"  src="https://storage.googleapis.com/bponi/asset/site/store-multivendor1/trending.jpg" alt=""></div> <div  class="">Lab Test</div></div></a>
                                    </div>
                                    <div  class="col-md-2 d-inline">
                                        <a  href="{{url('campaigns')}}" class="">
                                            <div  class="category-item">
                                                <div  class="top-category-item__image">
                                        <img class="imggg"  src="https://storage.googleapis.com/bponi/asset/site/store-multivendor1/campaigns.jpg" alt=""></div> <div  class="">Campaigns</div></div></a>
                                    </div>
                                    <div  class="col-md-2 d-inline">
                                        <a  href="{{url('doctors')}}" class="">
                                            <div  class="category-item">
                                                <div  class="top-category-item__image">
                                        <img class="imggg"  src="https://storage.googleapis.com/bponi/asset/site/store-multivendor1/category.png" alt="" style="width: 100%;"></div> <div  class="">Find Doctors</div></div></a>
                                    </div>
                                </div>
                          </div>

                    </div> --}}


                </div>






            </div>
        </div>
    </div>




    {{-- Banner section 1 --}}
    {{-- @if (get_setting('home_banner1_images') != null)
    <div class="">
        <div class="container">
            <div class="row gutters-10">
                @php $banner_1_imags = json_decode(get_setting('home_banner1_images')); @endphp
                @foreach ($banner_1_imags as $key => $value)
                    <div class="col-xl col-md-6">
                        <div class="mb-3 mb-lg-0">
                            <a href="{{ json_decode(get_setting('home_banner1_links'), true)[$key] }}" class="d-block text-reset">
                                <img class="img-fluid" src="{{ static_asset('assets/img/placeholder-rect.jpg') }}" data-src="{{ uploaded_asset($banner_1_imags[$key]) }}" alt="{{ env('APP_NAME') }} promo" class="img-fluid lazyload">
                            </a>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
    @endif --}}
    <style>

        .prescription-message {
    font-size: 14px;
    padding: 10px;
    border: none;
    background-color: #ebebeb;
    margin: 30px auto 5px;
    width: 275px;
}

.prescription {
    width: 250px;
    font-size: 200px;
    cursor: pointer;
}
</style>
        {{-- Banner Section 3 for desktop --}}
        @if (get_setting('home_banner3_images') != null)
    <div class="d-none d-lg-block d-md-block">
        <div class="mt-4">
            <div class="container">
                <div class="row mb-4 gutters-10">
                    @php $banner_3_imags = json_decode(get_setting('home_banner3_images')); @endphp
                    @foreach ($banner_3_imags as $key => $value)
                        <div class="col-md-12">
                            <div class="mb-3 mb-lg-0">
                                <a href="{{ json_decode(get_setting('home_banner3_links'), true)[$key] }}" class="d-block text-reset">
                                    @auth
                                    <img data-toggle="modal" data-target="#prescriptionAdd" src="{{ uploaded_asset($banner_3_imags[$key]) }}" alt="{{ env('APP_NAME') }} promo" class="img-fluid lazyload">
                                    @endauth
                                    @guest
                                    <img data-toggle="modal" data-target="#login_modals" id="show_login" onclick="show_login()" src="{{ uploaded_asset($banner_3_imags[$key]) }}" alt="{{ env('APP_NAME') }} promo" class="img-fluid lazyload">
                                    @endguest

                                </a>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
        @endif

        <div class="d-md-none d-lg-none">
   {{-- Banner Section 2 for mobile--}}
   @if (get_setting('home_banner2_images') != null)
   <div class="mt-4">
       <div class="container">
           <div class="row gutters-10">
               @php $banner_2_imags = json_decode(get_setting('home_banner2_images')); @endphp
               @foreach ($banner_2_imags as $key => $value)
                   <div class="col-xl col-md-6">
                       <div class="mb-3 mb-lg-0">
                           <a href="{{ json_decode(get_setting('home_banner2_links'), true)[$key] }}" class="d-block text-reset">
                               @auth
                               <img data-toggle="modal" data-target="#prescriptionAdd" src="{{ static_asset('assets/img/placeholder-rect.jpg') }}" data-src="{{ uploaded_asset($banner_2_imags[$key]) }}" alt="{{ env('APP_NAME') }} promo" class="img-fluid lazyload">
                               @endauth
                               @guest
                               <img data-toggle="modal" data-target="#login_modals" id="show_login" onclick="show_login()" src="{{ static_asset('assets/img/placeholder-rect.jpg') }}" data-src="{{ uploaded_asset($banner_2_imags[$key]) }}" alt="{{ env('APP_NAME') }} promo" class="img-fluid lazyload">
                               @endguest
                           </a>
                       </div>
                   </div>
               @endforeach
           </div>
       </div>
   </div>
   @endif
        </div>

    </div>
 </div>

  {{-- prescription add modal --}}


  <div class="modal fade" id="prescriptionAdd" tabindex="-1" role="dialog" aria-labelledby="prescriptionAddModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content border-info border-width-4">
            <div class="modal-header bg-info">
                <div class="prescription-new-header" style="text-align: center; width: 100%; font-size:16px;"> <b class="text-white">{{translate('Add Prescription for Order')}}</b> </div>
                <button type="button"  class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body text-align-center">


                <form class="form-horizontal" method="POST" action="{{ route('prescription.store') }}"  enctype="multipart/form-data">
                    @csrf



                <div style="padding-top: 20px; text-align: center;">
                    <div style="display: flex; align-items: center; justify-content: center;">

                        @if (\App\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->code == 'bd')
                        <img id="output" src="https://cdn.osudpotro.com/project_assets/addphoto.png" alt="Add prescriptions" style="width: inherit; position: relative;" class="img-fluid">
                        @else
                        <img id="output" src="{{ asset('assets/img/rx.png') }}" alt="Add prescriptions" style="width: inherit; position: relative;" class="img-fluid">
                        @endif

                        <input type="file"  onchange="loadFile(event)" name="prescription" class="prescription" style="opacity: 0; overflow: hidden; position: absolute;">



                        <script>
                          var loadFile = function(event) {
                            var output = document.getElementById('output');
                            output.src = URL.createObjectURL(event.target.files[0]);
                            output.onload = function() {
                              URL.revokeObjectURL(output.src) // free memory
                            }
                          };
                        </script>




                    </div>
                    <input type="text" name="message" class="prescription-message" placeholder="{{translate('Your Message')}}">
                    @error('prescription')
                            <div class="alert alert-danger">{{ $message }}</div>
                            <script>
                                alert($message)
                            </script>
                    @enderror
                </div>
            </div>
            <div class="guest-modal-footer modal-footer" style="justify-content: center;">
                <button type="submit" class="guest-modal-footer-button btn btn-info">Add Prescription</button>
            </div>
        </form>


        </div>
    </div>
  </div>


    <!--Login Modal -->
    <div class="modal fade" id="login_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-zoom" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title fw-600">{{ translate('Login')}}</h6>
                    <button type="button" onclick="off_chat_modal()" class="close" data-dismiss="modal">
                        <span aria-hidden="true"></span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="p-3">
                        <form class="form-default" role="form" action="{{ route('login') }}" method="POST">
                            @csrf
                            <div class="form-group">
                                @if (\App\Addon::where('unique_identifier', 'otp_system')->first() != null && \App\Addon::where('unique_identifier', 'otp_system')->first()->activated)
                                    <input type="text" class="form-control h-auto form-control-lg {{ $errors->has('email') ? ' is-invalid' : '' }}" value="{{ old('email') }}" placeholder="{{ translate('Email Or Phone')}}" name="email" id="email">
                                @else
                                    <input type="email" class="form-control h-auto form-control-lg {{ $errors->has('email') ? ' is-invalid' : '' }}" value="{{ old('email') }}" placeholder="{{  translate('Email') }}" name="email">
                                @endif
                                @if (\App\Addon::where('unique_identifier', 'otp_system')->first() != null && \App\Addon::where('unique_identifier', 'otp_system')->first()->activated)
                                    <span class="opacity-60">{{  translate('Use country code before number') }}</span>
                                @endif
                            </div>

                            <div class="form-group">
                                <input type="password" name="password" class="form-control h-auto form-control-lg" placeholder="{{ translate('Password')}}">
                            </div>

                            <div class="row mb-2">
                                <div class="col-6">
                                    <label class="aiz-checkbox">
                                        <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}>
                                        <span class=opacity-60>{{  translate('Remember Me') }}</span>
                                        <span class="aiz-square-check"></span>
                                    </label>
                                </div>
                                <div class="col-6 text-right">
                                    <a href="{{ route('password.request') }}" class="text-reset opacity-60 fs-14">{{ translate('Forgot password?')}}</a>
                                </div>
                            </div>

                            <div class="mb-5">
                                <button type="submit" class="btn btn-primary btn-block fw-600">{{  translate('Login') }}</button>
                            </div>
                        </form>

                        <div class="text-center mb-3">
                            <p class="text-muted mb-0">{{ translate('Dont have an account?')}}</p>
                            <a href="{{ route('user.registration') }}">{{ translate('Register Now')}}</a>
                        </div>
                        @if(get_setting('google_login') == 1 ||
                            get_setting('facebook_login') == 1 ||
                            get_setting('twitter_login') == 1)
                            <div class="separator mb-3">
                                <span class="bg-white px-3 opacity-60">{{ translate('Or Login With')}}</span>
                            </div>
                            <ul class="list-inline social colored text-center mb-5">
                                @if (get_setting('facebook_login') == 1)
                                    <li class="list-inline-item">
                                        <a href="{{ route('social.login', ['provider' => 'facebook']) }}" class="facebook">
                                            <i class="lab la-facebook-f"></i>
                                        </a>
                                    </li>
                                @endif
                                @if(get_setting('google_login') == 1)
                                    <li class="list-inline-item">
                                        <a href="{{ route('social.login', ['provider' => 'google']) }}" class="google">
                                            <i class="lab la-google"></i>
                                        </a>
                                    </li>
                                @endif
                                @if (get_setting('twitter_login') == 1)
                                    <li class="list-inline-item">
                                        <a href="{{ route('social.login', ['provider' => 'twitter']) }}" class="twitter">
                                            <i class="lab la-twitter"></i>
                                        </a>
                                    </li>
                                @endif
                            </ul>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
          function show_prescription_modal(){
            @if (Auth::check())
                $('#prescription_modal').modal('show');
            @else
                $('#login_modal').modal('show');
            @endif
        }
        function show_login(){
            $('#login_modal').modal('show');
        }
     function off_prescription_modal(){
            @if (Auth::check())
                $('#prescription_modal').modal('hide');
            @else
                $('#login_modal').modal('hide');
            @endif
        }

    </script>


    {{-- Flash Deal --}}
    @php
        $flash_deal = \App\FlashDeal::where('status', 1)->where('featured', 1)->first();
    @endphp
    @if($flash_deal != null && strtotime(date('Y-m-d H:i:s')) >= $flash_deal->start_date && strtotime(date('Y-m-d H:i:s')) <= $flash_deal->end_date)
    <section class="mb-4">
        <div class="container">
            <div class="px-2 py-4 px-md-4 py-md-3 bg-white shadow-sm rounded">

                <div class="d-flex flex-wrap mb-3 align-items-baseline border-bottom">
                    <h3 class="h5 fw-700 mb-0">
                        <span class="border-bottom border-primary border-width-2 pb-3 d-inline-block">{{ translate('Flash Sale') }}</span>
                    </h3>
                    <div class="aiz-count-down ml-auto ml-lg-3 align-items-center" data-date="{{ date('Y/m/d H:i:s', $flash_deal->end_date) }}"></div>
                    <a href="{{ route('flash-deal-details', $flash_deal->slug) }}" class="ml-auto mr-0 btn btn-primary btn-sm shadow-md w-100 w-md-auto">{{ translate('View More') }}</a>
                </div>

                <div class="aiz-carousel gutters-10 half-outside-arrow" data-items="4" data-xl-items="4" data-lg-items="4"  data-md-items="3" data-sm-items="2" data-xs-items="2" data-arrows='true'>
                    @foreach ($flash_deal->flash_deal_products as $key => $flash_deal_product)
                        @php
                            $product = \App\Product::find($flash_deal_product->product_id);
                        @endphp
                        @if ($product != null && $product->published != 0)
                            <div class="carousel-box">
                                @include('frontend.partials.product_box_1',['product' => $product])
                            </div>
                        @endif
                    @endforeach
                </div>
            </div>
        </div>
    </section>
    @endif








    @if($num_todays_deal > 0)
    <div  class="col-lg-12 order-3 mt-3 mt-lg-0">
        <div class="container mb-3 rounded shadow-sm">
            <div class="todays-row-bg rounded-top p-3 mb-3 d-flex align-items-center justify-content-center">
                <span class="fw-600 fs-16 mr-2 text-truncate">
                    {{ translate('Todays Deal') }}
                </span>
                {{-- <img src="https://i.gifer.com/WME2.gif" alt=""> --}}
                <span class="badge badge-danger badge-inline">{{ translate('Hot') }}</span>

            </div>
            {{-- <div class="c-scrollbar-light overflow-auto h-lg-400px p-2  rounded-bottom">
                <div class="align-items-center justify-content-center  row"> --}}
                    <div class="aiz-carousel gutters-10 half-outside-arrow" data-autoplay="true" data-items="4" data-xl-items="4" data-lg-items="4"  data-md-items="3" data-sm-items="1" data-xs-items="1" data-arrows='true'>

                @foreach (filter_products(\App\Product::where('published', 1)->where('todays_deal', '1'))->get() as $key => $product)
                    @if ($product != null)

                    <div class="carousel-box">
                    {{-- <div class="col-md-2"> --}}


                        {{-- <a href="{{ route('product', $product->slug) }}" class="d-block p-2 text-reset bg-white h-100 rounded">
                            <div class="row gutters-5 align-items-center">
                                <div class="col-xxl">
                                    <div class="img">
                                        <img
                                            class="lazyload img-fit h-140px h-lg-80px"
                                            src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                            data-src="{{ uploaded_asset($product->thumbnail_img) }}"
                                            alt="{{ $product->getTranslation('name') }}"
                                            onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                        >
                                    </div>
                                </div>
                                <div class="col-xxl">
                                    <div class="fs-16">
                                        <span class="d-block text-primary fw-600">{{ home_discounted_base_price($product) }}</span>
                                        @if(home_base_price($product) != home_discounted_base_price($product))
                                            <del class="d-block opacity-70">{{ home_base_price($product) }}</del>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </a> --}}
                        @include('frontend.partials.product_box_1')
                    </div>
                    @endif
                @endforeach
                </div>
            </div>
        {{-- </div> --}}
    </div>
    @endif
<script>

</script>
    {{-- Featured Section --}}
    <div id="section_featured">

    </div>

    {{-- Best Selling  --}}
    <div id="section_best_selling">

    </div>




    {{-- Category wise Products --}}
    <div id="section_home_categories">

    </div>

    {{-- Classified Product --}}
    @if(get_setting('classified_product') == 1)
        @php
            $classified_products = \App\CustomerProduct::where('status', '1')->where('published', '1')->take(10)->get();
        @endphp
           @if (count($classified_products) > 0)
               <section class="mb-4">
                   <div class="container">
                       <div class="px-2 py-4 px-md-4 py-md-3 bg-white shadow-sm rounded">
                            <div class="d-flex mb-3 align-items-baseline border-bottom">
                                <h3 class="h5 fw-700 mb-0">
                                    <span class="border-bottom border-primary border-width-2 pb-3 d-inline-block">{{ translate('Classified Ads') }}</span>
                                </h3>
                                <a href="{{ route('customer.products') }}" class="ml-auto mr-0 btn btn-primary btn-sm shadow-md">{{ translate('View More') }}</a>
                            </div>
                           <div class="aiz-carousel gutters-10 half-outside-arrow" data-items="6" data-xl-items="5" data-lg-items="4"  data-md-items="3" data-sm-items="2" data-xs-items="2" data-arrows='true'>
                               @foreach ($classified_products as $key => $classified_product)
                                   <div class="carousel-box">
                                        <div class="aiz-card-box border border-light rounded hov-shadow-md my-2 has-transition">
                                            <div class="position-relative">
                                                <a href="{{ route('customer.product', $classified_product->slug) }}" class="d-block">
                                                    <img
                                                        class="img-fit lazyload mx-auto h-140px h-md-210px"
                                                        src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                        data-src="{{ uploaded_asset($classified_product->thumbnail_img) }}"
                                                        alt="{{ $classified_product->getTranslation('name') }}"
                                                        onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                                    >
                                                </a>
                                                <div class="absolute-top-left pt-2 pl-2">
                                                    @if($classified_product->conditon == 'new')
                                                       <span class="badge badge-inline badge-success">{{translate('new')}}</span>
                                                    @elseif($classified_product->conditon == 'used')
                                                       <span class="badge badge-inline badge-danger">{{translate('Used')}}</span>
                                                    @endif
                                                </div>
                                            </div>
                                            <div class="p-md-3 p-2 text-left">
                                                <div class="fs-15 mb-1">
                                                    <span class="fw-700 text-primary">{{ single_price($classified_product->unit_price) }}</span>
                                                </div>
                                                <h3 class="fw-600 fs-13 text-truncate-2 lh-1-4 mb-0 h-35px">
                                                    <a href="{{ route('customer.product', $classified_product->slug) }}" class="d-block text-reset">{{ $classified_product->getTranslation('name') }}</a>
                                                </h3>
                                            </div>
                                       </div>
                                   </div>
                               @endforeach
                           </div>
                       </div>
                   </div>
               </section>
           @endif
       @endif



    {{-- Best Seller --}}
    @if (get_setting('vendor_system_activation') == 1)
    <div id="section_best_sellers">

    </div>
    @endif

    {{-- Top 10 categories and Brands --}}
    @if (get_setting('top10_categories') != null && get_setting('top10_brands') != null)
    <section class="mb-4">
        <div class="container">
            <div class="row gutters-10">
                @if (get_setting('top10_categories') != null)
                    <div class="col-lg-6">
                        <div class="d-flex mb-3 align-items-baseline border-bottom">
                            <h3 class="h5 fw-700 mb-0">
                                <span class="border-bottom border-primary border-width-2 fs-16 pb-3 d-inline-block">{{ translate('Top 10 Categories') }}</span>
                            </h3>
                            <a href="{{ route('categories.all') }}" class="ml-auto mr-0 btn btn-primary btn-sm shadow-md">{{ translate('All Categories') }}</a>
                        </div>
                        <div class="row gutters-5">
                            @php $top10_categories = json_decode(get_setting('top10_categories')); @endphp
                            @foreach ($top10_categories as $key => $value)
                                @php $category = \App\Category::find($value); @endphp
                                @if ($category != null)
                                    <div class="col-sm-6">
                                        <a href="{{ route('products.category', $category->slug) }}" class="bg-white border d-block text-reset rounded p-2 hov-shadow-md mb-2">
                                            <div class="row align-items-center no-gutters">
                                                <div class="col-3 text-center">
                                                    <img
                                                        src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                        data-src="{{ uploaded_asset($category->banner) }}"
                                                        alt="{{ $category->getTranslation('name') }}"
                                                        class="img-fluid img lazyload h-60px"
                                                        onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                                    >
                                                </div>
                                                <div class="col-7">
                                                    <div class="text-truncat-2 pl-3 fs-14 fw-600 text-left">{{ $category->getTranslation('name') }}</div>
                                                </div>
                                                <div class="col-2 text-center">
                                                    <i class="la la-angle-right text-primary"></i>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                @endif
                            @endforeach
                        </div>
                    </div>
                @endif
                @if (get_setting('top10_brands') != null)
                    <div class="col-lg-6">
                        <div class="d-flex mb-3 align-items-baseline border-bottom">
                            <h3 class="h5 fw-700 mb-0">
                                <span class="border-bottom border-primary border-width-2 pb-3 fs-16 d-inline-block">{{ translate('Top 10 Brands') }}</span>
                            </h3>
                            <a href="{{ route('brands.all') }}" class="ml-auto mr-0 btn btn-primary  btn-sm shadow-md">{{ translate('All Brands') }}</a>
                        </div>
                        <div class="row gutters-5">
                            @php $top10_brands = json_decode(get_setting('top10_brands')); @endphp
                            @foreach ($top10_brands as $key => $value)
                                @php $brand = \App\Brand::find($value); @endphp
                                @if ($brand != null)
                                    <div class="col-sm-6">
                                        <a href="{{ route('products.brand', $brand->slug) }}" class="bg-white border d-block text-reset rounded p-2 hov-shadow-md mb-2">
                                            <div class="row align-items-center no-gutters">
                                                <div class="col-4 text-center">
                                                    <img
                                                        src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                        data-src="{{ uploaded_asset($brand->logo) }}"
                                                        alt="{{ $brand->getTranslation('name') }}"
                                                        class="img-fluid img lazyload h-60px"
                                                        onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                                    >
                                                </div>
                                                <div class="col-6">
                                                    <div class="text-truncate-2 pl-3 fs-14 fw-600 text-left">{{ $brand->getTranslation('name') }}</div>
                                                </div>
                                                <div class="col-2 text-center">
                                                    <i class="la la-angle-right text-primary"></i>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                @endif
                            @endforeach
                        </div>
                    </div>
                @endif
            </div>
        </div>
    </section>
    @endif

@endsection

@section('script')
    <script>
        $(document).ready(function(){
            $.post('{{ route('home.section.featured') }}', {_token:'{{ csrf_token() }}'}, function(data){
                $('#section_featured').html(data);
                AIZ.plugins.slickCarousel();
            });
            $.post('{{ route('home.section.best_selling') }}', {_token:'{{ csrf_token() }}'}, function(data){
                $('#section_best_selling').html(data);
                AIZ.plugins.slickCarousel();
            });
            $.post('{{ route('home.section.home_categories') }}', {_token:'{{ csrf_token() }}'}, function(data){
                $('#section_home_categories').html(data);
                AIZ.plugins.slickCarousel();
            });

            @if (get_setting('vendor_system_activation') == 1)
            $.post('{{ route('home.section.best_sellers') }}', {_token:'{{ csrf_token() }}'}, function(data){
                $('#section_best_sellers').html(data);
                AIZ.plugins.slickCarousel();
            });
            @endif
        });
    </script>
@endsection
