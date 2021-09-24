{{-- <section class="bg-white border-top mt-auto">
    <div class="container">
        <div class="row no-gutters">
            <div class="col-lg-3 col-md-6">
                <a class="text-reset border-left text-center p-4 d-block" href="{{ route('terms') }}">
                    <i class="la la-file-text la-3x text-primary mb-2"></i>
                    <h4 class="h6">{{ translate('Terms & conditions') }}</h4>
                </a>
            </div>
            <div class="col-lg-3 col-md-6">
                <a class="text-reset border-left text-center p-4 d-block" href="{{ route('returnpolicy') }}">
                    <i class="la la-mail-reply la-3x text-primary mb-2"></i>
                    <h4 class="h6">{{ translate('Return Policy') }}</h4>
                </a>
            </div>
            <div class="col-lg-3 col-md-6">
                <a class="text-reset border-left text-center p-4 d-block" href="{{ route('supportpolicy') }}">
                    <i class="la la-support la-3x text-primary mb-2"></i>
                    <h4 class="h6">{{ translate('Support Policy') }}</h4>
                </a>
            </div>
            <div class="col-lg-3 col-md-6">
                <a class="text-reset border-left border-right text-center p-4 d-block" href="{{ route('privacypolicy') }}">
                    <i class="las la-exclamation-circle la-3x text-primary mb-2"></i>
                    <h4 class="h6">{{ translate('Privacy Policy') }}</h4>
                </a>
            </div>
        </div>
    </div>
</section> --}}

<section style="background-color: #34495e" class=" pb-3  text-light footer-widget">
    <div class="container">
        <div class="row">
            <div style="    margin-top: -26px;" class="col-lg-5 col-xl-4 text-center text-md-left">
                <div class="mt-5">
                    <a href="{{ route('home') }}" class="d-block">
                        @if(get_setting('footer_logo') != null)
                            <img class="lazyload" src="{{ static_asset('assets/img/placeholder-rect.jpg') }}" data-src="{{ uploaded_asset(get_setting('footer_logo')) }}" alt="{{ env('APP_NAME') }}" height="44">
                        @else
                            <img class="lazyload" src="{{ static_asset('assets/img/placeholder-rect.jpg') }}" data-src="{{ static_asset('assets/img/logo.png') }}" alt="{{ env('APP_NAME') }}" height="44">
                        @endif
                    </a>
                    <div class="my-3 text-justify">
                        @php
                            echo get_setting('about_us_description');
                        @endphp
                    </div>
                    <div class="d-inline-block d-md-block mb-4">
                        <form class="form-inline" method="POST" action="{{ route('subscribers.store') }}">
                            @csrf
                            <div class="form-group mb-0">
                                <input type="email" class="form-control" placeholder="{{ translate('Your Email Address') }}" name="email" required>
                            </div>
                            <button type="submit" class="btn btn-primary">
                                {{ translate('Subscribe') }}
                            </button>
                        </form>
                    </div>
                    <div class="w-300px mw-100 mx-auto mx-md-0">
                        @if(get_setting('play_store_link') != null)
                            <a href="{{ get_setting('play_store_link') }}" target="_blank" class="d-inline-block mr-3 ml-0">
                                <img src="{{ static_asset('assets/img/play.png') }}" class="mx-100 h-40px">
                            </a>
                        @endif
                        @if(get_setting('app_store_link') != null)
                            <a href="{{ get_setting('app_store_link') }}" target="_blank" class="d-inline-block">
                                <img src="{{ static_asset('assets/img/app.png') }}" class="mx-100 h-40px">
                            </a>
                        @endif
                    </div>
                </div>
            </div>
<!-- <div class="d-none d-md-block d-lg-block d-xl-block"> -->

                    <div class="col-lg-3 ml-xl-auto col-md-4 mr-0">
                        <div class="text-center text-md-left mt-4">
                            <h4 class="fs-13 text-uppercase fw-600 border-bottom border-white-900 pb-2 mb-4">
                                {{ translate('Contact Info') }}
                            </h4>
                            <ul class="list-unstyled">
                                <li class="mb-2">
                                   <span class="d-block opacity-30">{{ translate('Address') }}:</span>
                                   <span class="d-block opacity-70">{{ get_setting('contact_address') }}</span>
                                </li>
                                <li class="mb-2">
                                   <span class="d-block opacity-30">{{translate('Phone')}}:</span>
                                   <a href="tel:{{ get_setting('contact_phone') }}" class="text-reset">
                                   <span class="d-block opacity-70"><i class="fad fa-phone-alt"></i> {{ get_setting('contact_phone') }}</span></a>
                                </li>
                                <li class="mb-2">
                                   <span class="d-block opacity-30">{{translate('Email')}}:</span>
                                   <span class="d-block opacity-70">
                                       <a href="mailto:{{ get_setting('contact_email') }}" class="text-reset"><i class="fad fa-envelope"></i> {{ get_setting('contact_email')  }}</a>
                                    </span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4">
                        <div class="text-center text-md-left mt-4">
                            <h4 class="fs-13 text-uppercase fw-600 border-bottom border-white-900 pb-2 mb-4">
                                {{ get_setting('widget_one') }}
                            </h4>
                            <ul class="list-unstyled">
                                @if ( get_setting('widget_one_labels') !=  null )
                                    @foreach (json_decode( get_setting('widget_one_labels'), true) as $key => $value)
                                    <li class="mb-2">
                                        <a href="{{ json_decode( get_setting('widget_one_links'), true)[$key] }}" class="opacity-50 hov-opacity-100 text-reset">
                                            {{ $value }}
                                        </a>
                                    </li>
                                    @endforeach
                                @endif
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-4 col-lg-2">
                        <div class="text-center text-md-left mt-4">
                            <h4 class="fs-13 text-uppercase fw-600 border-bottom border-white-900 pb-2 mb-4">
                                {{ translate('My Account') }}
                            </h4>
                            <ul class="list-unstyled">
                                @if (Auth::check())
                                    <li class="mb-2">
                                        <a class="opacity-50 hov-opacity-100 text-reset" href="{{ route('logout') }}">
                                            {{ translate('Logout') }}
                                        </a>
                                    </li>
                                @else
                                    <li class="mb-2">
                                        <a class="opacity-50 hov-opacity-100 text-reset" href="{{ route('user.login') }}">
                                            {{ translate('Login') }}
                                        </a>
                                    </li>
                                @endif


                                <li class="mb-2">
                                    <a class="opacity-50 hov-opacity-100 text-reset" href="{{ route('purchase_history.index') }}">
                                        {{ translate('Order History') }}
                                    </a>
                                </li>
                                <li class="mb-2">
                                    <a class="opacity-50 hov-opacity-100 text-reset" href="{{ route('wishlists.index') }}">
                                        {{ translate('My Wishlist') }}
                                    </a>
                                </li>
                                <li class="mb-2">
                                    <a class="opacity-50 hov-opacity-100 text-reset" href="{{ route('orders.track') }}">
                                        {{ translate('Track Order') }}
                                    </a>
                                </li>
                                @if (\App\Addon::where('unique_identifier', 'affiliate_system')->first() != null && \App\Addon::where('unique_identifier', 'affiliate_system')->first()->activated)
                                    <li class="mb-2">
                                        <a class="opacity-50 hov-opacity-100 text-light" href="{{ route('affiliate.apply') }}">{{ translate('Be an affiliate partner')}}</a>
                                    </li>
                                @endif

                        @if(get_setting('show_language_switcher') == 'on')
                        <li class=" list-inline-item dropdown" id="lang-change">
                            @php
                                if(Session::has('locale')){
                                    $locale = Session::get('locale', Config::get('app.locale'));
                                }
                                else{
                                    $locale = 'en';
                                }
                            @endphp
                            <a href="javascript:void(0)" class="dropdown-toggle text-reset py-2" data-toggle="dropdown" data-display="static">
                                <img src="{{ static_asset('assets/img/placeholder.jpg') }}" data-src="{{ static_asset('assets/img/flags/'.$locale.'.png') }}" class="mr-2 lazyload" alt="{{ \App\Language::where('code', $locale)->first()->name }}" height="11">
                                <span class="opacity-60">{{ \App\Language::where('code', $locale)->first()->name }}</span>
                            </a>
                            <ul style="margin-left: -80%" class="dropdown-menu dropdown-menu-left">
                                @foreach (\App\Language::all() as $key => $language)
                                    <li>
                                        <a href="javascript:void(0)" data-flag="{{ $language->code }}" class="dropdown-item @if($locale == $language) active @endif">
                                            <img src="{{ static_asset('assets/img/placeholder.jpg') }}" data-src="{{ static_asset('assets/img/flags/'.$language->code.'.png') }}" class="mr-1 lazyload" alt="{{ $language->name }}" height="11">
                                            <span class="language">{{ $language->name }}</span>
                                        </a>
                                    </li>
                                @endforeach
                            </ul>
                        </li>
                        @endif
                            </ul>
                        </div>








                        @if (get_setting('vendor_system_activation') == 1)
                            <div class="text-center text-md-left mt-4">
                                <h4 class="fs-13 text-uppercase fw-600 border-bottom border-white-900 pb-2 mb-4">
                                    {{ translate('Be a Seller') }}
                                </h4>
                                <a href="{{ route('lab.create') }}" class="btn btn-primary btn-sm shadow-md">
                                    {{ translate('Apply Now') }}
                                </a>
                            </div>
                        @endif
                    </div>

      <!-- </div> -->
{{--

 <div class="d-none d-sm-block float-right">
<button style="background-color: #356cde42" type="button" class="btn btn-sm btn-block" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          Info. About us <i class="fal fa-info-circle"></i>
          </button>
</div>


        <div class="d-none d-sm-block float-right" id="accordion">
                  <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                    <div class="col-lg-3 ml-xl-auto col-md-4 mr-0">
                        <div class="text-center text-md-left mt-4">
                            <h4 class="fs-13 text-uppercase fw-600 border-bottom border-gray-900 pb-2 mb-4">
                                {{ translate('Contact Info') }}
                            </h4>
                            <ul class="list-unstyled">
                                <li class="mb-2">
                                   <span class="d-block opacity-30">{{ translate('Address') }}:</span>
                                   <span class="d-block opacity-70">{{ get_setting('contact_address') }}</span>
                                </li>
                                <li class="mb-2">
                                   <span class="d-block opacity-30">{{translate('Phone')}}:</span>
                                   <span class="d-block opacity-70">{{ get_setting('contact_phone') }}</span>
                                </li>
                                <li class="mb-2">
                                   <span class="d-block opacity-30">{{translate('Email')}}:</span>
                                   <span class="d-block opacity-70">
                                       <a href="mailto:{{ get_setting('contact_email') }}" class="text-reset">{{ get_setting('contact_email')  }}</a>
                                    </span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4">
                        <div class="text-center text-md-left mt-4">
                            <h4 class="fs-13 text-uppercase fw-600 border-bottom border-gray-900 pb-2 mb-4">
                                {{ get_setting('widget_one') }}
                            </h4>
                            <ul class="list-unstyled">
                                @if ( get_setting('widget_one_labels') !=  null )
                                    @foreach (json_decode( get_setting('widget_one_labels'), true) as $key => $value)
                                    <li class="mb-2">
                                        <a href="{{ json_decode( get_setting('widget_one_links'), true)[$key] }}" class="opacity-50 hov-opacity-100 text-reset">
                                            {{ $value }}
                                        </a>
                                    </li>
                                    @endforeach
                                @endif
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-4 col-lg-2">
                        <div class="text-center text-md-left mt-4">
                            <h4 class="fs-13 text-uppercase fw-600 border-bottom border-gray-900 pb-2 mb-4">
                                {{ translate('My Account') }}
                            </h4>
                            <ul class="list-unstyled">
                                @if (Auth::check())
                                    <li class="mb-2">
                                        <a class="opacity-50 hov-opacity-100 text-reset" href="{{ route('logout') }}">
                                            {{ translate('Logout') }}
                                        </a>
                                    </li>
                                @else
                                    <li class="mb-2">
                                        <a class="opacity-50 hov-opacity-100 text-reset" href="{{ route('user.login') }}">
                                            {{ translate('Login') }}
                                        </a>
                                    </li>
                                @endif
                                <li class="mb-2">
                                    <a class="opacity-50 hov-opacity-100 text-reset" href="{{ route('purchase_history.index') }}">
                                        {{ translate('Order History') }}
                                    </a>
                                </li>
                                <li class="mb-2">
                                    <a class="opacity-50 hov-opacity-100 text-reset" href="{{ route('wishlists.index') }}">
                                        {{ translate('My Wishlist') }}
                                    </a>
                                </li>
                                <li class="mb-2">
                                    <a class="opacity-50 hov-opacity-100 text-reset" href="{{ route('orders.track') }}">
                                        {{ translate('Track Order') }}
                                    </a>
                                </li>
                                @if (\App\Addon::where('unique_identifier', 'affiliate_system')->first() != null && \App\Addon::where('unique_identifier', 'affiliate_system')->first()->activated)
                                    <li class="mb-2">
                                        <a class="opacity-50 hov-opacity-100 text-black" href="{{ route('affiliate.apply') }}">{{ translate('Be an affiliate partner')}}</a>
                                    </li>
                                @endif
                            </ul>
                        </div>
                        @if (get_setting('vendor_system_activation') == 1)
                            <div class="text-center text-md-left mt-4">
                                <h4 class="fs-13 text-uppercase fw-600 border-bottom border-gray-900 pb-2 mb-4">
                                    {{ translate('Be a Seller') }}
                                </h4>
                                <a href="{{ route('shops.create') }}" class="btn btn-primary btn-sm shadow-md">
                                    {{ translate('Apply Now') }}
                                </a>
                            </div>
                        @endif
                    </div>

                  </div>
                </div> --}}

        </div>
    </div>
    <a  onclick="scrollToTop()" class="btns btn-backtotop" ><i class="fad fa-arrow-up" ></i></a>
</section>
<style>
    .h7 {
        font-size: 12px
    }

.btns.btn-backtotop {
    box-shadow: 0 22px 26px 0 rgb(241 99 76 / 26%);
}
.btns.btn-backtotop{
    background-image: linear-gradient(
-90deg
,#d651fe93,#f77162ab);
}
.btns.btn-backtotop:hover {
    color: #f1634c;
    background: #fff;
}
.btns.btn-backtotop {
    width: 62px;
    text-decoration: none;
    height: 62px;
    text-align: center;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    margin: 0px auto 19px;
    cursor: pointer;
    color: #fff;
    padding: initial;
    transition: all .05s;
}
.btns:not(.btn--outline) {
    border: 0;
}
.btns {
    font-size: 1.5rem;
    padding: 13px 24px;
    display: inline-flex;
    line-height: 1;
    text-align: center;
    justify-content: center;
    align-items: center;
    transition: all .3s;
    border-radius: 4px;
    cursor: pointer;
}
</style>
{{-- <div style="background-color: #34495E" class="mt-10 "> --}}
{{-- </div> --}}

<!-- FOOTER -->

<footer style="background-color: #232f3e" class="text-light pt-2" >


    <div class="container">

        <div class="row align-items-center">

            <div class="col-lg-4">
                <div class="h7 text-center text-justify mt-1 text-md-left" current-verison="{{get_setting("current_version")}}">
                    @php
                        echo get_setting('frontend_copyright_text');
                    @endphp
                </div>
            </div>
            <div class="col-lg-4">
                <ul class="list-inline my-3 my-md-0 social colored text-center">
                    @if ( get_setting('facebook_link') !=  null )
                    <li class="list-inline-item">
                        <a href="{{ get_setting('facebook_link') }}" target="_blank" class="facebook"><i class="lab la-facebook-f"></i></a>
                    </li>
                    @endif
                    @if ( get_setting('twitter_link') !=  null )
                    <li class="list-inline-item">
                        <a href="{{ get_setting('twitter_link') }}" target="_blank" class="twitter"><i class="lab la-twitter"></i></a>
                    </li>
                    @endif
                    @if ( get_setting('instagram_link') !=  null )
                    <li class="list-inline-item">
                        <a href="{{ get_setting('instagram_link') }}" target="_blank" class="instagram"><i class="lab la-instagram"></i></a>
                    </li>
                    @endif
                    @if ( get_setting('youtube_link') !=  null )
                    <li class="list-inline-item">
                        <a href="{{ get_setting('youtube_link') }}" target="_blank" class="youtube"><i class="lab la-youtube"></i></a>
                    </li>
                    @endif
                    @if ( get_setting('linkedin_link') !=  null )
                    <li class="list-inline-item">
                        <a href="{{ get_setting('linkedin_link') }}" target="_blank" class="linkedin"><i class="lab la-linkedin-in"></i></a>
                    </li>
                    @endif
                </ul>
            </div>
            <div class="col-lg-4">
                <div class="text-center text-md-right">
                    <ul class="list-inline mb-0">
                        @if ( get_setting('payment_method_images') !=  null )
                            @foreach (explode(',', get_setting('payment_method_images')) as $key => $value)
                                <li class="list-inline-item">
                                    <img src="{{ uploaded_asset($value) }}" height="30" class="mw-100 h-auto" style="max-height: 30px">
                                </li>
                            @endforeach
                        @endif
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>
<script>
    // Scroll To Top

function scrollToTop() {

window.scrollTo({top: 0, behavior: 'smooth'});

}
</script>

{{--
<div class="aiz-mobile-bottom-nav d-xl-none fixed-bottom bg-white shadow-lg border-top">
    <div class="d-flex justify-content-around align-items-center">
        <a href="{{ route('home') }}" class="text-reset flex-grow-1 text-center py-3 border-right {{ areActiveRoutes(['home'],'bg-soft-primary')}}">
            <i class="las la-home la-2x"></i>
        </a>
        <a href="{{ route('categories.all') }}" class="text-reset flex-grow-1 text-center py-3 border-right {{ areActiveRoutes(['categories.all'],'bg-soft-primary')}}">
            <span class="d-inline-block position-relative px-2">
                <i class="las la-list-ul la-2x"></i>
            </span>
        </a>
        <a href="{{ route('cart') }}" class="text-reset flex-grow-1 text-center py-3 border-right {{ areActiveRoutes(['cart'],'bg-soft-primary')}}">
            <span class="d-inline-block position-relative px-2">
                <i class="las la-shopping-cart la-2x"></i>
                @if(Session::has('cart'))
                    <span class="badge badge-circle badge-primary position-absolute absolute-top-right" id="cart_items_sidenav">{{ count(Session::get('cart'))}}</span>
                @else
                    <span class="badge badge-circle badge-primary position-absolute absolute-top-right" id="cart_items_sidenav">0</span>
                @endif
            </span>
        </a>
        @if (Auth::check())
            @if(isAdmin())
                <a href="{{ route('admin.dashboard') }}" class="text-reset flex-grow-1 text-center py-2">
                    <span class="avatar avatar-sm d-block mx-auto">
                        @if(Auth::user()->photo != null)
                            <img src="{{ custom_asset(Auth::user()->avatar_original)}}">
                        @else
                            <img src="{{ static_asset('assets/img/avatar-place.png') }}">
                        @endif
                    </span>
                </a>
            @else
                <a href="javascript:void(0)" class="text-reset flex-grow-1 text-center py-2 mobile-side-nav-thumb" data-toggle="class-toggle" data-target=".aiz-mobile-side-nav">
                    <span class="avatar avatar-sm d-block mx-auto">
                        @if(Auth::user()->photo != null)
                            <img src="{{ custom_asset(Auth::user()->avatar_original)}}">
                        @else
                            <img src="{{ static_asset('assets/img/avatar-place.png') }}">
                        @endif
                    </span>
                </a>
            @endif
        @else
            <a href="{{ route('user.login') }}" class="text-reset flex-grow-1 text-center py-2">
                <span class="avatar avatar-sm d-block mx-auto">
                    <img src="{{ static_asset('assets/img/avatar-place.png') }}">
                </span>
            </a>
        @endif
    </div>
</div>
@if (Auth::check() && !isAdmin())
    <div class="aiz-mobile-side-nav collapse-sidebar-wrap sidebar-xl d-xl-none z-1035">
        <div class="overlay dark c-pointer overlay-fixed" data-toggle="class-toggle" data-target=".aiz-mobile-side-nav" data-same=".mobile-side-nav-thumb"></div>
        <div class="collapse-sidebar bg-white">
            @include('frontend.inc.user_side_nav')
        </div>
    </div>
@endif --}}



<style>

a.router-link-exact-active[data-v-3e184a48] {
	display: flex!important
}

.nav-b[data-v-3e184a48] {
	width: 100%;
	position: fixed;
	bottom: 0;
    margin-bottom: -8px;
	z-index: 99999;
	display: flex;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	background-color: #fff;

}

.bg-home-btn[data-v-3e184a48] {
	height: 46px;
	width: 46px;
	line-height: 46px;
	padding: 0;
	margin: -8px 5px 0;
	border-radius: 50%;
	box-shadow: 0 3px 7px rgba(0, 0, 0, .15);
	-webkit-box-shadow: 0 3px 7px rgba(0, 0, 0, .15);
	-moz-box-shadow: 0 3px 7px rgba(0, 0, 0, .15);
	-ms-box-shadow: 0 3px 7px rgba(0, 0, 0, .15);
	z-index: 9999999;
	background-color: var(--primary);
	border: none;
	border-color: var(--primary);
	color: var(--secondary)
}

.bg-home-btn i.bigBtn[data-v-3e184a48] {
	vertical-align: middle;
	display: inline-block;
	text-align: center;
	color: #fff;
	font-size: 1.375rem;
	line-height: 44px;
	margin-top: 12px
}

.bg-home-btn a[data-v-3e184a48] {
	display: block;
	text-align: center;
	font-weight: 600;
	text-transform: capitalize;
	line-height: 1;
	color: #fff;
	fill: #fff;
	font-size: 24px;
	padding: 0 12px
}

nav[data-v-3e184a48] {
	display: flex;
	background: #fff;
	padding: 5px;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	box-shadow: 0 1px 15px rgba(0, 0, 0, .1);
	width: 100%
}

a[data-v-3e184a48] {
	color: inherit;
	text-decoration: none;
	display: flex;
	align-items: center;
	padding: 7px 12px;
	border-radius: 30px;
	position: relative;
	--hover-bg: rgba(91, 55, 183, 0.13);
	--hover-c: #5b37b7;
	width: 100%
}

a svg[data-v-3e184a48] {
	width: 20px;
	height: 20px;
	pointer-events: none;
	transition: margin .2s ease-out
}

a span[data-v-3e184a48] {
	display: none;
	opacity: 0;
	visibility: hidden;
	font-size: 14px;
	margin-left: 5px
}

a[data-v-3e184a48]:before {
	position: absolute;
	content: "";
	top: 50%;
	left: 0;
	width: 70px;
	height: 70px;
	border-radius: 50%;
	transform: translateY(-50%) scale(0);
	visibility: visible;
	opacity: 1
}

a.router-link-exact-active[data-v-3e184a48] {
	background: var(--hover-bg);
	color: var(--hover-c);
	fill: #dc143c;
    height: 33px;
}

a.router-link-exact-active[data-v-3e184a48]:before {
	background: var(--hover-c);
	opacity: 0;
	visibility: hidden;
	transform: translateY(-50%) scale(2);
	transition: all .4s ease-out
}

a.router-link-exact-active svg[data-v-3e184a48] {
	margin-right: 0
}

a.router-link-exact-active span[data-v-3e184a48] {
	display: block;
	opacity: 1;
	visibility: visible;
	transition: all .2s ease-out
}



</style>


@php
    $order = \App\Order::get();
@endphp



<div class="aiz-mobile-bottom-nav d-xl-none fixed-bottom bg-white shadow-lg border-top">
    <div class="d-flex justify-content-around align-items-center">
<div data-v-3e184a48="" class="nav-b">
	<nav data-v-3e184a48="">
		<a data-v-3e184a48="" href="{{ route('home') }}" class="{{ areActiveRoutes(['home'],'router-link-exact-active')}}">

            <i class="fad fa-home la-2x"></i>
			<span data-v-3e184a48=""> Home </span>
		</a>

        <a data-v-3e184a48="" href="{{ route('categories.all') }}" class="{{ areActiveRoutes(['categories.all'],'router-link-exact-active')}}">

            <i class="fad fa-list-ul la-2x"></i>
                <span data-v-3e184a48="">category</span>

        </a>

	</nav>
	<div data-v-3e184a48="" class="bg-home-btn">

        <a  data-v-3e184a48="" href="{{ route('cart') }}" style="fill: rgb(255, 255, 255); background: none;" class=" {{ areActiveRoutes(['cart'],'router-link-exact-active')}}">

                <i data-v-3e184a48 style="    margin-top: 2px;" width="18" height="18" class="bigBtn las la-shopping-cart fa-2x"></i>
                @if(Session::has('cart'))
                    <span class="badge badge-circle badge-secondary position-absolute absolute-top-right" id="cart_items_sidenav">{{ count(Session::get('cart'))}}</span>
                @else
                    <span class="badge badge-circle badge-secondary position-absolute absolute-top-right" id="cart_items_sidenav">0</span>
                @endif

        </a>
	</div>
	<nav data-v-3e184a48="">
		<a data-v-3e184a48="" href="{{route('purchase_history.index')}}" class=" {{ areActiveRoutes(['purchase_history.index'],'router-link-exact-active')}}"  style="text-align: right; display: block;">

            <i class="fal fa-shopping-bag la-2x"></i>
        <span  data-v-3e184a48=""> orders </span>

        </a>


        @if (Auth::check())
        @if(isAdmin())
            <a  data-v-3e184a48="" href="{{ route('admin.dashboard') }}" class=" {{ areActiveRoutes(['admin.dashboard'],'router-link-exact-active')}}"  style="text-align: right; display: block;">

                @if (Auth::user()->avatar_original != null)
                <img style="
               border-radius: 50px;
                height: 32px;
                width: 31px;
                margin-top: -7px;
                margin-bottom: -12px;"
                class="image-fluid" src="{{ uploaded_asset(Auth::user()->avatar_original) }}">
                <span data-v-3e184a48=""> account </span>
                @else

                    <span data-v-3e184a48="">account</span>
                @endif

            </a>
        @else
            <a style="margin-left: 15px;" data-v-3e184a48="" href="javascript:void(0)" class=" {{ areActiveRoutes(['dashboard'],'router-link-exact-active')}}" data-toggle="class-toggle" data-target=".aiz-mobile-side-nav">

                @if (Auth::user()->avatar_original != null)
                <img  style="
                border-radius: 50px;
                height: 32px;
                width: 31px;
                margin-top: -7px;
                margin-bottom: -5px;"
                class="image-fluid avatar avatar-sm" src="{{ uploaded_asset(Auth::user()->avatar_original) }}" >

                <span data-v-3e184a48=""> account </span>
            @else
                    <i class="fad fa-user fa-2x"></i>
                    <span data-v-3e184a48=""> account </span>
                    @endif

                     </a>
                   @endif
             @else
                <a  data-v-3e184a48="" href="{{ route('user.login') }}" class=" {{ areActiveRoutes(['user.login'],'router-link-exact-active')}}"  style="text-align: right; display: block;">
            <i class="fad fa-user fa-2x"></i>
			<span data-v-3e184a48=""> account </span>
             </a>
              @endif
         </div>
         </div>
</div>
        @if (Auth::check() && !isAdmin())
            <div class="aiz-mobile-side-nav collapse-sidebar-wrap sidebar-xl d-xl-none z-1035">
          <div class="overlay dark c-pointer overlay-fixed" data-toggle="class-toggle" data-target=".aiz-mobile-side-nav" data-same=".mobile-side-nav-thumb"></div>
          <div class="collapse-sidebar bg-white">
        @include('frontend.inc.user_side_nav')
          </div>
        </div>
        @endif
</div>





	</nav>
</div>
