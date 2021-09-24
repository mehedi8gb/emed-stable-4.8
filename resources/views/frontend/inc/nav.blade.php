
@if(get_setting('topbar_banner') != null)
<div  class="header-custom-color text-white position-relative top-banner removable-session z-1035 d-none" data-key="top-banner" data-value="removed">
    <a href="{{ get_setting('topbar_banner_link') }}" class="d-block text-reset">
        <img src="{{ uploaded_asset(get_setting('topbar_banner')) }}" class="w-100 mw-100 h-50px h-lg-auto img-fit">
    </a>
    <button class="btn text-white absolute-top-right set-session" data-key="top-banner" data-value="removed" data-toggle="remove-parent" data-parent=".top-banner">
        <i class="la la-close la-2x"></i>
    </button>
</div>
@endif
<style>

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #34495e;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 42px;
  text-decoration: none;
  font-size: 17px;
  color: #f1f1f1;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
<!-- Top Bar -->
<div style="  margin-top: 10px" class="text-white header-custom-color top-navbar bg-whitelist-inline-item mr-0 z-1035 fixed-top">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col">
                <ul  class="list-inline d-flex justify-content-between justify-content-lg-start mb-0">

                    <li class="list-inline-item">

                        <div style="max-width: unset !important;" class="col-auto col-xl-3">
                            <a class="d-block py-3px mr-3 ml-0" href="{{ route('home') }}">
                                @php
                                    $header_logo = get_setting('header_logo');
                                @endphp
                                @if($header_logo != null)
                                    <img src="{{ uploaded_asset($header_logo) }}" alt="{{ env('APP_NAME') }}" class="mw-100 h-30px h-md-40px" height="40">
                                @else
                                    <img src="{{ static_asset('assets/img/logo.png') }}" alt="{{ env('APP_NAME') }}" class="mw-100 h-30px h-md-40px" height="40">
                                @endif
                            </a>

                            <div id="mySidenav" class="sidenav">
                                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                                @foreach (json_decode( get_setting('header_menu_labels'), true) as $key => $value)
                                    <a href="{{ json_decode( get_setting('header_menu_links'), true)[$key] }}"
                                    class="fs-13 px-3 py-2 d-list fw-700 hov-opacity-100 text-reset">
                                        {{ translate($value) }}
                                    </a>
                                @endforeach
                            @auth
                            <a class="mt-3" href="{{ route('logout') }}" class="text-white py-2 d-inline-block"><i class="fad fa-sign-out-alt"></i>
                                <span class="mt-3">{{ translate('Logout')}}</span>
                            </a>
                            @endauth
                            @guest
                            <a class="mt-3" href="{{ route('user.login') }}" class="text-white text-reset py-2 d-inline-block"><i class="fad fa-sign-in-alt"></i>
                                <span class="mt-3">{{ translate('Login')}}</span>
                            </a>
                            @endguest
                              </div>





                        </div>


                    </li>


                    <li class="d-sm-none d-lg-none">
                        <span style="font-size:20px;cursor:pointer" onclick="openNav()" > <i class="fad fa-list"></i></span>
                    </li>


                    @if(get_setting('show_currency_switcher') == 'on')

                    <li class="list-inline-item dropdown" id="currency-change">
                        @php
                            if(Session::has('currency_code')){
                                $currency_code = Session::get('currency_code');
                            }
                            else{
                                $currency_code = \App\Currency::findOrFail(get_setting('system_default_currency'))->code;
                            }
                        @endphp
                        <a href="javascript:void(0)" class="dropdown-toggle text-reset py-2 opacity-60" data-toggle="dropdown" data-display="static">
                            {{ \App\Currency::where('code', $currency_code)->first()->name }} {{ (\App\Currency::where('code', $currency_code)->first()->symbol) }}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-right dropdown-menu-lg-left">
                            @foreach (\App\Currency::where('status', 1)->get() as $key => $currency)
                                <li>
                                    <a class="dropdown-item @if($currency_code == $currency->code) active @endif" href="javascript:void(0)" data-currency="{{ $currency->code }}">{{ $currency->name }} ({{ $currency->symbol }})</a>
                                </li>
                            @endforeach
                        </ul>
                    </li>
                    @endif
                </ul>
            </div>

            <div class="float-right col-8 text-right d-none d-lg-block">
                <ul class="list-inline mb-0">
                    <ul class="list-inline mb-0 pl-0 text-center">

                        @foreach (json_decode( get_setting('header_menu_labels'), true) as $key => $value)
                        <li class="list-inline-item mr-0 text-white">
                            <a href="{{ json_decode( get_setting('header_menu_links'), true)[$key] }}" class="opacity-60 fs-14 px-3 py-2 d-inline-block fw-600 hov-opacity-100 text-reset">
                                {{ translate($value) }}
                            </a>
                        </li>

                        @endforeach



                    </ul>

                </ul>
            </div>
        </div>
    </div>
</div>
<!-- END Top Bar -->
<header class="@if(get_setting('header_stikcy') == 'on') fixed-top @endif header-custom-color text-dark z-1020 pt-5 border-bottom shadow-sm">
    <div class=" logo-bar-area z-1 pt-2">
        <div class="container pb-1">


            <div class="d-flex align-items-center text-white">
                <div  class="flex-grow-1 d-flex align-items-center">
                    <div  style="background-color: #34495e !important; " class=" flex-grow-1">

                        <form action="{{ route('search') }}" method="GET" class="stop-propagation">
                            <div class="d-flex float-right position-relative col-md-9 align-items-right justify-content-end">

                                <div class="input-group">

                                    <input style="border-top-right-radius: 0%; border-bottom-right-radius: 0%;
                                    border-top-left-radius: 10px; border-bottom-left-radius: 10px;
                                    border: 1px solid #0000ff4d !important;" type="text" class="border-0 border-lg form-control" id="search" name="q" placeholder="{{translate('Search your medicine or generic name')}}" autocomplete="off">
                                    <div class="input-group-append">
                                        <button style="border-top-right-radius: 10%; border-bottom-right-radius: 10%" class="btn btn-circle btn-primary" type="submit">

                                            <i style="float: right" class="la la-search la-flip-horizontal fs-19"></i>
                                        </button>
                                    </div>

                                    <div class="typed-search-box overflow-auto d-none bg-white rounded shadow-lg position-absolute left-0 top-100 w-100">
                                        <div class="search-preloader absolute-top-center">
                                            <div class="dot-loader"><div></div><div></div><div></div></div>
                                        </div>
                                        <div class="search-nothing d-none p-3 text-center fs-16">

                                        </div>
                                        <div id="search-content" class="text-left">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>

                <div class="d-none d-lg-none ml-3 mr-0">
                    <div class="nav-search-box">
                        <a href="#" class="nav-box-link">
                            <i class="la la-search la-flip-horizontal d-inline-block nav-box-icon"></i>
                        </a>
                    </div>
                </div>
<style>
    @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');






    /* .dropbtn {
  padding: 5px;

} */

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
    display: none;

    line-height: 12px;
    position: absolute;
    left: -36%;
    height: 154%;
    top: 91%;
    z-index: 1;
}
.dropdown-content-guest {
    top: 113%;

}

.dropdown-content a {
  color: black;
  padding: 1px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {}






/* profile card start      */

/* .btn-pro{
    padding: 4px;
}

.profile-card-hide:hover .pro-card{
  display: block;

} */
.pro-card{
    display: block;
    margin: 0;
  box-sizing: border-box;
  font-family: 'Poppins',sans-serif;
  padding: 4px 56px 55px 8px;
  text-align: center;

}
.containe {
    border-radius: 4%;
    position: relative;
    width: 280px;
    color: black !important;
    margin: 0 auto;
    transition: all 0.3s ease-in-out;
    box-shadow: 0px 1px 5px 0px rgb(0 0 0 / 62%);
    background: linear-gradient(
358deg , #ffffff, #ffffff);
}
.guest-h{
    height: 220px !important;
}
/* .containe:hover{
  height: 470px;
  width: 350px;
  /* border-radius: 5px; */
  box-shadow: 0px 1px 35px 0px rgba(0,0,0,0.3);
} */
.containe .wrapper img{
  position: relative;
  z-index: 20;
  border-radius: 50%;
  display: block;
  height: 200px;
  width: 200px;
  border: 5px solid #fff;
  object-fit: cover;
  margin: 20px auto;
  transition: all 0.3s ease;
}
.containe:hover .wrapper img.active{
  height: 470px;
  width: 350px;
  margin: 0px auto;
  border: none;
  /* border-radius: 5px; */
}
.wrappe .title{
  color: rgb(0, 0, 0);
  font-size: 16px;
  font-weight: 500;
  padding: 14px 3px 3px 3px;
  line-height: 25px;
}
.wrappe .place{
  color: rgb(0, 0, 0);
  font-size: 17px;
  line-height: 0px;
  margin: 10px 0;
}
.content{
  color: rgb(0, 0, 0);
  font-size: 12px;
  margin-top: 10px;
  padding: 1px 20px 10px 20px!important;
}
.content .buttons{
  display: flex;
}
/* .buttons .btn{
  height: 40px;
  width: 150px;
  margin: 0 5px;
}
.buttons .btn button{
  height: 100%;
  width: 100%;
  background: #fff;
  border: none;
  outline: none;
  cursor: pointer;
  font-size: 17px;
  font-weight: 500;
  border-radius: 5px;
  transition: all 0.3s;
}
.btn button:hover{
  transform: scale(0.95);
} */
.containe .icons{
  position: relative;
  margin-top: -435px;
  margin-left: 10px;
  list-style: none;
}
.containe .icons.active{
  display: none;
}
.containe .icons li{
  height: 40px;
  width: 40px;
  margin: 5px 0;
  opacity: 0;
  margin-left: -100px;
  transition: all 0.5s ease;
}
.containe:hover .icons li{
  opacity: 1;
  margin-left: 7px;
}
.containe:hover .icons li:nth-child(2){
  transition-delay: 0.2s;
}
.containe:hover .icons li:nth-child(3){
  transition-delay: 0.4s;
}
.containe .icons li a{
  color: #7b00e0;
  height: 100%;
  width: 100%;
  border-radius: 50%;
  background: #fff;
  display: block;
  line-height: 40px;
  transition: all 0.3s;
}
.containe .icons li a:hover{
  transform: scale(0.9);
}

.content{
    line-height: 20px
}
.logout-clr:hover {
    color: #5346BA;
}
.bal{

}

/* profile card end  */
</style>
@auth
@php
$orders_count = count(Auth::user()->orders->where('delivery_viewed', 0));



@endphp
@endauth


<div class="d-none d-lg-block ml-3 mr-0">
    <div class="" id="compare">

    </div>
</div>




         <div style="padding: 8px;" class="dropdown d-none d-lg-block ml-3">
                    <div class="" id="">

             @auth

                    @if(isAdmin())
                    <a href="{{ route('admin.dashboard') }}">
                        @if (Auth::user()->avatar_original)

                        <span style="width: 30px; height: 30px;" class="avatar">
                        <img src="{{ uploaded_asset(Auth::user()->avatar_original) }}">
                        </span>

                        @else

                        <i class="fad fa-user la-2x"></i>
                        @endif
                                    <span class="mt-3 opacity-60">{{ translate('Dashboard')}}</span>
                                </a>

                    @else

                    <a href="{{ route('dashboard') }}" class="">
                    @if (Auth::user()->avatar_original != null)
                    <span style="width: 30px; height: 30px;" class="avatar">
                        <img src="{{ uploaded_asset(Auth::user()->avatar_original) }}">
                        </span>
                    @else
                    <span style="width: 30px; height: 30px;" class="avatar">
                    <img src="{{  static_asset('assets/img/avatar-place.png') }}">
                    </span>
                    @endif
                </a>
                    @if($orders_count > 0)
                    <div class="float-right">
                    <button onclick="window.location.href='{{route('purchase_history.index')}}'" data-toggle="tooltip" data-html="true" data-placement="top" title="You have {{ $orders_count }} New @choice('Order|Orders', $orders_count) <i class='fad fa-bell'></i>" style="height: 19px; width: 19px;border-radius: 50%;" class="badge btn-soft-primary btn-primary badge-pill">{{ $orders_count }}</button>

                    </div>
                    @endif



                        <a href="{{ route('dashboard') }}" class="text-reset ">



                        <a href="{{ route('dashboard') }}" class="text-reset">

                        <span class=" profile-card-hide dropbtn  opacity-80">&nbsp;{{ translate('Profile')}}</span></a>


                                <div class="dropdown-content">

                                    <div class="profile-card pro-card">
                                        <div class="containe">
                                           <div class="wrappe">
                                              <a href="{{route('profile')}}">
                                              @if (Auth::user()->avatar_original != null)
                                              <img class="mt-3 avatar avatar-circle" src="{{uploaded_asset(Auth::user()->avatar_original) }}">
                                              @else
                                              <img class="mt-3 avatar avatar-circle" src="{{  static_asset('assets/img/avatar-place.png') }}">
                                              @endif
                                              </a>
                                              <div class="title">

                                                {{Auth::user()->name}}


                                              </div>
                                              <div class="place">

                                              </div>
                                           </div>
                                           <div class="content">
                                              <p>
                                                 Welcome, {{Auth::user()->name}} <br>
                                                 happy shopping
                                              </p>

                                                    <button onclick="window.location.href='{{route('prescription')}}'" class="btn btn-primary hov-btn-info mb-1 btn-sm btn-block">Upload Prescription</button>


                                                    <button onclick="window.location.href='{{route('chat')}}'" class="btn btn-primary hov-btn-info btn-block btn-sm"  data-toggle="tooltip" data-html="true" data-placement="right" title="You have {{ $orders_count }} @choice("New <i class='fad fa-envelope'></i>Message|New <i class='fad fa-envelope'></i>Messages", $orders_count) " >Message</button>
                                                    <button onclick="window.location.href='{{route('prescription')}}'" class="btn btn-primary hov-btn-info mb-1 btn-sm btn-block">Upload Prescription</button>


                                                    <button onclick="window.location.href='{{route('chat')}}'" class="btn btn-primary hov-btn-info btn-block btn-sm"  data-toggle="tooltip" data-html="true" data-placement="right" title="You have {{ $orders_count }} @choice("New <i class='fad fa-envelope'></i>Message|New <i class='fad fa-envelope'></i>Messages", $orders_count) " >Message</button>


                                                 <a href="{{ route('logout') }}" class="mt-2 logout-clr opacity-100"><i class="fad fa-sign-out-alt"></i>
                                                    <span class="">{{ translate('Logout')}}</span>
                                                </a>

                                           </div>
                                           <div class="icons">

                                           </div>
                                        </div>
                                        <script>
                                           const img = document.querySelector("img");
                                           const icons = document.querySelector(".icons");
                                           img.onclick = function(){
                                             this.classList.toggle("active");
                                             icons.classList.toggle("active");
                                           }
                                        </script>
                                     </div>


                                    </div>


                    @endif


             @endauth
             @guest
             <div class="dropdown">
             <a class="" href="{{ route('user.login') }}" class="text-reset d-inline-block"><i class="far fa-user la-2x"></i>
            <span class=" profile-card-hide dropbtn">{{ translate('Login')}}</span>
        </a>
        <div class="bal">


        <div class="dropdown-content @guest dropdown-content-guest   @endguest">

            <div class="profile-card pro-card">
                <div class="@guest guest-h @endguest containe">
                   <div class="wrappe">

                      <div class="title">
                        Welcome Guest <br>
                      </div>
                      <div class="place">

                      </div>
                   </div>
                   <div class="content">
                      <p>
                         Create Your Account & keep connected!
                        <br><br>
                         <button onclick="window.location.href='{{route('user.login')}}'" class="btn btn-primary hov-btn-info btn-block btn-sm">Login</button>
                         <button onclick="window.location.href='{{route('user.registration')}}'" class="btn btn-primary hov-btn-info btn-block btn-sm">Register Now</button>
                      </p>



                   </div>

                </div>
                <script>
                   const img = document.querySelector("img");
                   const icons = document.querySelector(".icons");
                   img.onclick = function(){
                     this.classList.toggle("active");
                     icons.classList.toggle("active");
                   }
                </script>
             </div>
        </div>
    </div>
      </div>
             @endguest



                    </div>
                </div>

                <div class="d-none d-lg-block ml-3 mr-0">
                    <div class="" id="wishlist">
                        @include('frontend.partials.wishlist')
                    </div>
                </div>

                <div class="d-none d-lg-block  align-self-stretch ml-3 mr-0" data-hover="dropdown">
                    <div class="nav-cart-box dropdown h-100" id="cart_items">
                        @include('frontend.partials.cart')
                    </div>
                </div>

            </div>
        </div>




        <script>
            function openNav() {
              document.getElementById("mySidenav").style.width = "150px";
            }

            function closeNav() {
              document.getElementById("mySidenav").style.width = "0";
            }
            </script>





            {{-- <div class="row d-flex justify-content-end">


                <div class="col-sm-1 d-none	d-block d-sm-none">
                    <form action="{{ route('search') }}" method="GET" class="stop-propagation">
                        <div class="justify-content-end">

                            <div class="input-group">

                                <div class="input-group ">
                                    <input style="border: 1px solid #0000ff4d !important;" type="text" class="border-0 border-lg btn-circle form-control" id="search" name="q" placeholder="{{translate('Search your medicine or generic name')}}" autocomplete="off">
                                    <div class="input-group-prepend">

                                            <button style="border-top-right-radius: 45%; border-bottom-right-radius: 45%" class="btn btn-circle btn-primary" type="submit">
                                                <i  class="la la-search la-flip-horizontal fs-18"></i>
                                            </button>

                                    </div>
                                    </div>


                            </div>
                        </div>
                    </form>
                </div>

                <div  class="col-md-6 flex-grow-1 d-flex align-self-end bg-white">
                    <div class="flex-grow-1 d-none d-md-inline-block">
                        <form action="{{ route('search') }}" method="GET" class="stop-propagation">
                            <div class=" d-flex position-relative align-items-center">

                                <div class="input-group">

                                    <div class="input-group ">
                                        <input type="text" class="border-0 border-lg btn-circle form-control" id="search" name="q" placeholder="{{translate('Search your medicine or generic name')}}" autocomplete="off">
                                        <div class="input-group-prepend">

                                                <button style="border-top-right-radius: 45%; border-bottom-right-radius: 45%" class="btn btn-circle btn-primary" type="submit">
                                                    <i  class="la la-search la-flip-horizontal fs-18"></i>
                                                </button>

                                        </div>
                                        </div>


                                </div>
                            </div>
                        </form>
                        <div class="typed-search-box stop-propagation document-click-d-none d-none bg-white rounded shadow-lg position-absolute left-0 top-100 w-100" style="min-height: 200px">
                            <div class="search-preloader absolute-top-center">
                                <div class="dot-loader"><div></div><div></div><div></div></div>
                            </div>
                            <div class="search-nothing d-none p-3 text-center fs-16">

                            </div>
                            <div id="search-content" class="text-left">

                            </div>
                        </div>
                    </div>
                </div>

                <div class="d-none d-lg-none ml-3 mr-0">
                    <div class="nav-search-box">
                        <a href="#" class="nav-box-link">
                            <i class="la la-search la-flip-horizontal d-inline-block nav-box-icon"></i>
                        </a>
                    </div>
                </div>
<div class="col-md-4 d-inline-flex">
    <div class="d-none d-lg-block ml-3 mr-0">
        <div class="" id="compare">
            @include('frontend.partials.compare')
        </div>
    </div>

    <div class="d-none d-lg-block ml-3 mr-0">
        <div class="" id="wishlist">
            @include('frontend.partials.wishlist')
        </div>
    </div>

    <div class="d-none d-lg-block  align-self-stretch ml-3 mr-0" data-hover="dropdown">
        <div class="nav-cart-box dropdown h-100" id="cart_items">
            @include('frontend.partials.cart')
        </div>
    </div>
</div>


            </div>
        </div> --}}
        @if(Route::currentRouteName() != 'home')
        <div class="hover-category-menu position-absolute w-100 top-100 left-0 right-0 d-none z-3" id="hover-category-menu">
            <div class="container">
                <div class="row gutters-10 position-relative">
                    <div class="col-lg-3 position-static">
                        @include('frontend.partials.category_menu')
                    </div>
                </div>
            </div>
        </div>
        @endif
    </div>
    {{-- @if ( get_setting('header_menu_labels') !=  null )
        <div class="bg-white border-top border-gray-200 py-1">
            <div class="container">

                <ul class="list-inline mb-0 pl-0 mobile-hor-swipe text-center">

                    @foreach (json_decode( get_setting('header_menu_labels'), true) as $key => $value)
                    <li class="list-inline-item mr-0">
                        <a href="{{ json_decode( get_setting('header_menu_links'), true)[$key] }}" class="opacity-60 fs-14 px-3 py-2 d-inline-block fw-600 hov-opacity-100 text-reset">
                            {{ translate($value) }}
                        </a>
                    </li>
                    @endforeach
                </ul>
            </div>
        </div>
    @endif --}}
</header>
