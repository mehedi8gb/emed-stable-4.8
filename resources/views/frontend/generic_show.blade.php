@extends('frontend.layouts.app')
{{--
@section('meta_title'){{ $doctor->meta_title }}@stop

@section('meta_description'){{ $doctor->meta_description }}@stop --}}

@section('meta')
    {{-- <!-- Schema.org markup for Google+ -->
    <meta itemprop="name" content="{{ $doctor->meta_title }}">
    <meta itemprop="description" content="{{ $doctor->meta_description }}">
    <meta itemprop="image" content="{{ uploaded_asset($doctor->logo) }}">

    <!-- Twitter Card data -->
    <meta name="twitter:card" content="website">
    <meta name="twitter:site" content="@publisher_handle">
    <meta name="twitter:title" content="{{ $doctor->meta_title }}">
    <meta name="twitter:description" content="{{ $doctor->meta_description }}">
    <meta name="twitter:creator" content="@author_handle">
    <meta name="twitter:image" content="{{ uploaded_asset($doctor->meta_img) }}"> --}}

    <!-- Open Graph data -->
    {{-- <meta property="og:title" content="{{ $doctor->meta_title }}" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="{{ route('doctor.visit', $doctor->id) }}" />
    <meta property="og:image" content="{{ uploaded_asset($doctor->user->avatar_original) }}" />
    <meta property="og:description" content="{{ $doctor->meta_description }}" />
    <meta property="og:site_name" content="{{ $doctor->user->name }}" /> --}}
@endsection

@section('content')
    <!-- <section>
        <img loading="lazy"  src="https://via.placeholder.com/2000x300.jpg" alt="" class="img-fluid">
    </section> -->

<style>
    @import url('https://fonts.googleapis.com/css2?family=Sora:wght@100;200;300;400;500;600;700;800&display=swap');
    body{
        font-family:  'Sora', sans-serif
        ;
        font-weight: 500;

    }

































    #genericProduct {

background: rgb(37 188 241 / 15%);

border: 1px solid gold;



}
.gene-bg {
	background: linear-gradient(-45deg, #52ee747c, #23a5d5af, #4423d533);
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

}

                                                    div.fon-block{
                                                        float: right;
                                                width: 55px;
                                                    }
                                                    a.fon{
                                                        display: block;
                                                height: 30px;
                                                width: 33px;
                                                line-height: 32px;
                                                border-radius: 50%;
                                                text-align: center;
                                                background: #fff;
                                                margin-top: 6px;
                                                margin-right: 0px;
                                                margin-left: 16px;
                                                color: #333;
                                                font-size: 15px;
                                                box-shadow: 0 1px 1px rgb(0 0 0 / 10%), 0 3px 8px rgb(0 0 0 / 12%);


                                                    }
                                                    .discount-percent {
    font-size: 13px;
    position: absolute;
    top: -8px;
    color: #fff;
    display: -moz-inline-box;
    display: inline-flex;
    font-weight: 600;
    padding: 6px;
    height: 60px;
    align-self: center;
    -moz-box-align: center;
    align-items: center;
    -moz-box-pack: center;
    justify-content: center;
    font-weight: 700;
    border-bottom-right-radius: 25px;
    border-bottom-left-radius: 25px;
    -webkit-box-shadow: -1px 1px 3px 0 rgb(0 0 0 / 35%);
    box-shadow: -1px 1px 3px 0 rgb(0 0 0 / 35%);
    left: 76%;
    width: 42px;
    z-index: 90;

}
.dosage-img{
    height: 16px;
    width: 16px;
}

.discount-bg-on {
    background: -webkit-gradient(linear,left top,left bottom,from(#f50000),to(transparent));
    background: -webkit-linear-gradient(#fa0202,transparent);
    background: -moz-linear-gradient(#f81100,transparent);
    background: linear-gradient(#f70404,transparent);
    background-color: #ff0000;
}
.discount-bg {
    background: linear-gradient(#fbde6e,#fbde6e);
    background-color: #f8dd74;
    color: #d441c5
}




</style>



    <section class="pt-5 mb-4 bg-white">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mx-auto">
                    <div class="d-flex justify-content-center">
                        {{-- <img
                            height="70"
                            class="lazyload"
                            src="{{ static_asset('assets/img/placeholder.jpg') }}"
                            data-src="@if ($doctor->user->avatar_original !== null) {{ uploaded_asset($doctor->user->avatar_original) }} @else {{ static_asset('assets/img/placeholder.jpg') }} @endif"
                            alt="{{ $doctor->user->name }}"
                        > --}}
                        <div class="text-left">

                            <div class="container">
                                <h1 class="fw-600 h4 mb-0 text-primary">{{ $generic->name }}

                                    {{-- @if ($doctor->user->seller->verification_status == 1) --}}
                                        <span class="ml-2"><i class="fa fa-check-circle" style="color:green"></i></span>
                                    {{-- @else
                                        <span class="ml-2"><i class="fa fa-times-circle" style="color:red"></i></span>
                                    @endif --}}
                                </h1>
                                <span style="font-size: 13px" class="d-sm-none btn btn-block btn-sm gene-bg "><a  class="text-dark" href="#products">Show this Generic's Products</a></span>
                                <div class="row gutters-10">

                                    <div class="col-xl-9 order-0 order-xl-1">

                                        <div class="bg-white mb-3 shadow-sm rounded">{!! $generic->description !!}</div>
                                    </div>
                                    <div class="col-xl-3 order-0 order-xl-1">



                                        <span id="products" class="gene-bg text-center p-2 card">Product of {{$generic->name}}</span>
                <div class="card">
<style>
    .filter-option-inner-inner{
        font-weight: bold;
    }
</style>

                <div class="form-group mt-1 ml-2 mr-2">
                    <label class="mb-1 ml-1 opacity-70">{{ translate('Filter by company')}}</label>
                    <select class="form-control form-control-sm aiz-selectpicker" data-live-search="true" name="brand" onchange="filterProducts()">
                        <option value="">{{ translate('Select Company')}}</option>
                        @foreach (\App\Brand::all() as $brand)
                            <option value="{{ $brand->id }}" @isset($brand_id) @if ($brand_id == $brand->id) selected @endif @endisset>{{ $brand->getTranslation('name') }}</option>
                        @endforeach
                    </select>
                </div>
                </div>

                                        @foreach ($generic->products as $key => $item )



                                        <div id="genericProduc" onchange="setProductList()" class="aiz-card-box bg-white border rounded hov-shadow-md mt-1 mb-2 has-transition">

                                            <div  class="position-relative">

                                                <div class="text-center float-right discount-percent  {{ $item->discount == null ? '':'discount-bg-on' }} {{ $item->discount != null ? 'discount-bg-on':'discount-bg' }}">
                                                    @if ($item->discount != null)
                                                    @if ($item->discount_type == 'percent')
                                                    {{$item->discount}}%
                                                    @endif

                                                    @if ($item->discount_type == 'amount')
                                                    &#2547;{{$item->discount}}
                                                    @endif

                                                <br>Off</div>
                                                    @else
                                                        No<br>Off</div>
                                                    @endif

                                               <a href="{{ route('product', $item->slug) }}" class="d-block">

                                                   @if ($item->thumbnail_img)
                                                         <img
                                                         class=" lazyload mx-auto h-140px h-md-210px"
                                                         src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                         data-src="{{ uploaded_asset($item->thumbnail_img) }}"
                                                         alt="{{  $item->getTranslation('name')  }}"
                                                         onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                                     >
                                                     @else
                                                     @if ($item->minor->id != 0)
                                                     <span  class="avatar avatar-square avatar-xs">
                                                        <img style="
                                                       margin-left: 35px;
                                                        margin-top: 30px;
                                                        width: 46px;
                                            height: 30px;" src="{{ uploaded_asset($item->minor->icon) }}" alt="{{translate('icon')}}">
                                                    </span>
                                                     @endif

                                                   @endif

                                                 </a>










                                        <div class=" d-md-none d-lg-block d-none d-sm-block">
                                        <div class=" absolute-top-right mt-5 aiz-p-hov-icon">

                                        <a style="margin-left: -14px;" href="javascript:void(0)" onclick="addToWishList({{ $item->id }})" data-toggle="tooltip" data-title="{{ translate('Add to wishlist') }}" data-placement="left">
                                        <i class="la la-heart-o"></i>
                                        </a>
                                        @if(get_setting('compare_option') == '1')
                                        <a style="margin-left: -14px;"  href="javascript:void(0)" onclick="addToCompare({{ $item->id }})" data-toggle="tooltip" data-title="{{ translate('Add to compare') }}" data-placement="left">
                                            <i class="las la-sync"></i>
                                        </a>
                                        @endif
                                        <a style="margin-left: -14px;"  href="javascript:void(0)" onclick="showAddToCartModal({{ $item->id }})" data-toggle="tooltip" data-title="{{ translate('Add to cart') }}" data-placement="left">
                                        <i class="las la-shopping-cart"></i>
                                        </a>
                                        </div>
                                        </div>

                                        <div class="fon-block d-xl-none d-md-none d-lg-none float-right pb-2 pr-3">

                                        <a class="fon" href="javascript:void(0)" onclick="addToWishList({{ $item->id }})" data-toggle="tooltip" data-title="{{ translate('Add to wishlist') }}" data-placement="left">
                                        <i class="fad fa-heart"></i>
                                        </a>
                                        @if(get_setting('compare_option') == '1')
                                        <a   href="javascript:void(0)" onclick="addToCompare({{ $item->id }})" data-toggle="tooltip" data-title="{{ translate('Add to compare') }}" data-placement="left">
                                            <i class="las la-sync"></i>
                                        </a>
                                        @endif
                                        <a class="fon"  href="javascript:void(0)" onclick="showAddToCartModal({{ $item->id }})" data-toggle="tooltip" data-title="{{ translate('Add to cart') }}" data-placement="left">
                                        <i class="fal fa-cart-plus"></i>
                                        </a>

                                        </div>


                                        <div style="margin-top: -11px;" class="p-md-3 p-2 text-left">

                                        @if ($item->rating)
                                        <div class="rating rating-sm mt-1">
                                        {{ renderStarRating($item->rating) }}
                                        </div>
                                        @endif

                                        <h3 class="fw-600 d-inline fs-13 text-truncate-2 lh-1-4 mb-0 h-20px">



                                        <a href="{{ route('product', $item->slug) }}" class="d-block text-reset">

                                            @if ($item->minor->id != 0)
                                            @if ($item->thumbnail_img)
                                            <img class="d-inline dosage-img"src="{{ uploaded_asset($item->minor->icon) }}" alt="{{translate('icon')}}">
                                            @endif
                                            @endif


                                            {{  $item->getTranslation('name')}} &nbsp;<sub><span style="font-size: 10px" class="opacity-90">{{ $item->item_strength }}</span></sub></a>
                                        </h3> <span style="color: blue"> {{ $item->minor->name }} </span><br>


                                        <a href=""><span style="color: blue"> {{ $item->generic->name }} </span></a><br>

                                        <a href="{{url('/company').'/'.$item->brand->slug}}"><span style="color: blue"> {{ $item->brand->name }} </span></a>
                                        @if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated)
                                        <div class="rounded px-2 mt-2 bg-soft-primary border-soft-primary border">
                                        {{ translate('Club Point') }}:
                                        <span class="fw-700 float-right">{{ $item->earn_point }}</span>
                                        </div>
                                        @endif
                                        <div class="fs-15">
                                        @if(home_base_price($item) != home_discounted_base_price($item))
                                        <del class="fw-600 opacity-50 mr-1">{{ home_base_price($item) }}</del>
                                        @endif
                                        <span class="fw-700 text-primary">{{ home_discounted_base_price($item) }} &#2547;  </span>
                                        </div>
                                        </div>



                                           </div>
                                           </div>


                                        @endforeach

                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
            <div class="border-bottom mt-5"></div>
            <div class="row align-items-center">
                {{-- <div class="col-lg-6 order-2 order-lg-0">
                    <ul class="list-inline mb-0 text-center text-lg-left">
                        <li class="list-inline-item ">
                            <a class="text-reset d-inline-block fw-600 fs-15 p-3 @if(!isset($type)) border-bottom border-primary border-width-2 @endif" href="{{ route('doctor.visit', $doctor->slug) }}">{{ translate('Store Home')}}</a>
                        </li>
                        <li class="list-inline-item ">
                            <a class="text-reset d-inline-block fw-600 fs-15 p-3 @if(isset($type) && $type == 'top_selling') border-bottom border-primary border-width-2 @endif" href="{{ route('doctor.visit.type', ['slug'=>$doctor->slug, 'type'=>'top_selling']) }}">{{ translate('Top Selling')}}</a>
                        </li>
                        <li class="list-inline-item ">
                            <a class="text-reset d-inline-block fw-600 fs-15 p-3 @if(isset($type) && $type == 'all_items') border-bottom border-primary border-width-2 @endif" href="{{ route('doctor.visit.type', ['slug'=>$doctor->slug, 'type'=>'all_items']) }}">{{ translate('All items')}}</a>
                        </li>
                    </ul>
                </div> --}}
                {{-- <div class="col-lg-6 order-1 order-lg-0">
                    <ul class="text-center text-lg-right mt-4 mt-lg-0 social colored list-inline mb-0">
                        @if ($doctor->facebook != null)
                            <li class="list-inline-item">
                                <a href="{{ $doctor->facebook }}" class="facebook" target="_blank">
                                    <i class="lab la-facebook-f"></i>
                                </a>
                            </li>
                        @endif
                        @if ($doctor->twitter != null)
                            <li class="list-inline-item">
                                <a href="{{ $doctor->twitter }}" class="twitter" target="_blank">
                                    <i class="lab la-twitter"></i>
                                </a>
                            </li>
                        @endif
                        @if ($doctor->google != null)
                            <li class="list-inline-item">
                                <a href="{{ $doctor->google }}" class="google-plus" target="_blank">
                                    <i class="lab la-google"></i>
                                </a>
                            </li>
                        @endif
                        @if ($doctor->youtube != null)
                            <li class="list-inline-item">
                                <a href="{{ $doctor->youtube }}" class="youtube" target="_blank">
                                    <i class="lab la-youtube"></i>
                                </a>
                            </li>
                        @endif
                    </ul>
                </div> --}}
            </div>











{{--
            @if (isset($category_id))
            @php
                $meta_title = \App\Category::find($category_id)->meta_title;
                $meta_description = \App\Category::find($category_id)->meta_description;
            @endphp
        @elseif (isset($brand_id))
            @php
                $meta_title = \App\Brand::find($brand_id)->meta_title;
                $meta_description = \App\Brand::find($brand_id)->meta_description;
            @endphp
        @else
            @php
                $meta_title         = get_setting('meta_title');
                $meta_description   = get_setting('meta_description');
            @endphp
        @endif --}}








            <script type="text/javascript">

                var products = null;

$(document).ready(function(){

    $('#genericProduc').on('click','.product-card',function(){
        var id = $(this).data('id');
        $.get('{{ route('variants') }}', {id:id}, function(data){
            if (data == 0) {
                addToCart(id, null, 1);
            }
            else {
                $('#variants').html(data);
                $('#product-variation').modal('show');
            }
        });
    });
    filterProducts();
    getShippingAddress();
});

function filterProducts(){

    var brand = $('select[name=brand]').val();
    $.get('{{ route('pos.search_product') }}',{brand:brand}, function(data){
        products = data;
        $('#genericProduc').html(null);
        setProductList(data);
    });
}
function setProductList(data){
            for (var i = 0; i < data.data.length; i++) {
                $('#genericProduc').append('<div class="col-3">' +
                    '<div class="card bg-light c-pointer mb-2 product-card" data-id="'+data.data[i].id+'" >'+
                        '<span class="absolute-top-left bg-dark text-white px-1">'+data.data[i].price +'</span>'+
                        '<img src="'+ data.data[i].minor->icon +'" class="card-img-top img-fit h-100px mw-100 mx-auto" >'+
                        '<div class="card-body p-2">'+
                            '<div class="text-truncate-2 small">'+ data.data[i].name +'</div>'+
                        '</div>'+
                    '</div>'+
                '</div>'


//                 <div  class="position-relative">

// <a href="{{ route('product', $item->slug) }}" class="d-block">

//   @if ($item->thumbnail_img)
//         <img
//         class="img-fit lazyload mx-auto h-140px h-md-210px"
//         src="{{ static_asset('assets/img/placeholder.jpg') }}"
//         data-src="{{ uploaded_asset($item->thumbnail_img) }}"
//         alt="{{  $item->getTranslation('name')  }}"
//         onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
//     >
//     @else
//     <span  class="avatar avatar-square avatar-xs">
//         <img style="
//        margin-left: 35px;
//         margin-top: 30px;
//         width: 46px;
// height: 30px;" src="{{ uploaded_asset($item->minor->icon) }}" alt="{{translate('icon')}}">
//     </span>

//   @endif

// </a>
// <div class=" d-md-none d-lg-block d-none d-sm-block">
// <div class=" absolute-top-right aiz-p-hov-icon">

//     <a href="javascript:void(0)" onclick="addToWishList({{ $item->id }})" data-toggle="tooltip" data-title="{{ translate('Add to wishlist') }}" data-placement="left">
//         <i class="la la-heart-o"></i>
//     </a>
//     <a   href="javascript:void(0)" onclick="addToCompare({{ $item->id }})" data-toggle="tooltip" data-title="{{ translate('Add to compare') }}" data-placement="left">
//         <i class="las la-sync"></i>
//     </a>
//     <a   href="javascript:void(0)" onclick="showAddToCartModal({{ $item->id }})" data-toggle="tooltip" data-title="{{ translate('Add to cart') }}" data-placement="left">
//         <i class="las la-shopping-cart"></i>
//     </a>
// </div>
// </div>

// <div class="fon-block d-xl-none d-md-none d-lg-none">

//     <a class="fon" href="javascript:void(0)" onclick="addToWishList({{ $item->id }})" data-toggle="tooltip" data-title="{{ translate('Add to wishlist') }}" data-placement="left">
//         <i class="fad fa-heart"></i>
//     </a>
//     <a class="fon"  href="javascript:void(0)" onclick="addToCompare({{ $item->id }})" data-toggle="tooltip" data-title="{{ translate('Add to compare') }}" data-placement="left">
//         <i class="fal fa-sync"></i>
//     </a>
//     <a class="fon"  href="javascript:void(0)" onclick="showAddToCartModal({{ $item->id }})" data-toggle="tooltip" data-title="{{ translate('Add to cart') }}" data-placement="left">
//         <i class="fal fa-cart-plus"></i>
//     </a>

// </div>


// <div style="margin-top: -11px;" class="p-md-3 p-2 text-left">

// @if ($item->rating)
// <div class="rating rating-sm mt-1">
//     {{ renderStarRating($item->rating) }}
// </div>
// @endif

// <h3 class="fw-600 fs-13 text-truncate-2 lh-1-4 mb-0 h-20px">
//     <a href="{{ route('product', $item->slug) }}" class="d-block text-reset">{{  $item->getTranslation('name')}} &nbsp;<sub><span style="font-size: 10px" class="opacity-70">{{ $item->item_strength }}</span></sub></a>
// </h3> <span style="color: blue"> {{ $item->minor->name }} </span><br>


// <a href="{{$item->generic->slug}}"><span style="color: blue"> {{ $item->generic->name }} </span></a><br>

// <a href="{{url('/company').'/'.$item->brand->slug}}"><span style="color: blue"> {{ $item->brand->name }} </span></a>
// @if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated)
//     <div class="rounded px-2 mt-2 bg-soft-primary border-soft-primary border">
//         {{ translate('Club Point') }}:
//         <span class="fw-700 float-right">{{ $item->earn_point }}</span>
//     </div>
// @endif
// <div class="fs-15">
//     @if(home_base_price($item) != home_discounted_base_price($item))
//         <del class="fw-600 opacity-50 mr-1">{{ home_base_price($item) }}</del>
//     @endif
//     <span class="fw-700 text-primary">{{ home_discounted_base_price($item) }}</span>
// </div>
// </div>
// </div>




                );
            }
            if (data.links.next != null) {
                $('#load-more').find('.text-center').html('Load More');
            }
            else {
                $('#load-more').find('.text-center').html('Nothing more found');
            }
            $('[data-toggle="tooltip"]').tooltip();
        }

function loadMoreProduct(){
    if(products != null && products.links.next != null){
        $.get(products.links.next,{}, function(data){
            products = data;
            setProductList(data);
        });
    }
}

            </script>

















        </div>
    </section>
<script>
       function filter(){
            $('#search-form').submit();
        }
</script>
    {{-- @if (!isset($type))
        <section class="mb-5">
            <div class="container">
                <div class="aiz-carousel dots-inside-bottom mobile-img-auto-height" data-arrows="true" data-dots="true" data-autoplay="true">
                    @if ($doctor->sliders != null)
                        @foreach (explode(',',$doctor->sliders) as $key => $slide)
                            <div class="carousel-box">
                                <img class="d-block w-100 lazyload rounded h-200px h-lg-380px img-fit" src="{{ static_asset('assets/img/placeholder-rect.jpg') }}" data-src="{{ uploaded_asset($slide) }}" alt="{{ $key }} offer">
                            </div>
                        @endforeach
                    @endif
                </div>
            </div>
        </section>
        <section class="mb-4">
            <div class="container">
                <div class="text-center mb-4">
                    <h3 class="h3 fw-600 border-bottom">
                        <span class="border-bottom border-primary border-width-2 pb-3 d-inline-block">{{ translate('Featured items')}}</span>
                    </h3>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="aiz-carousel gutters-10" data-items="6" data-xl-items="5" data-lg-items="4"  data-md-items="3" data-sm-items="2" data-xs-items="2" data-autoplay='true' data-infinute="true" data-dots="true">
                            @foreach ($doctor->user->items->where('published', 1)->where('seller_featured', 1) as $key => $item)
                                <div class="carousel-box">
                                    @include('frontend.partials.item_box_1',['item' => $item])
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endif --}}

    {{-- <section class="mb-4">
        <div class="container">
            <div class="mb-4">
                <h3 class="h3 fw-600 border-bottom">
                    <span class="border-bottom border-primary border-width-2 pb-3 d-inline-block">
                        @if (!isset($type))
                            {{ translate('New Arrival items')}}
                        @elseif ($type == 'top_selling')
                            {{ translate('Top Selling')}}
                        @elseif ($type == 'all_items')
                            {{ translate('All items')}}
                        @endif
                    </span>
                </h3>
            </div>
            <div class="row gutters-5 row-cols-xxl-5 row-cols-lg-4 row-cols-md-3 row-cols-2">
                @php
                    if (!isset($type)){
                        $items = \App\item::where('user_id', $doctor->user->id)->where('published', 1)->orderBy('created_at', 'desc')->paginate(24);
                    }
                    elseif ($type == 'top_selling'){
                        $items = \App\item::where('user_id', $doctor->user->id)->where('published', 1)->orderBy('num_of_sale', 'desc')->paginate(24);
                    }
                    elseif ($type == 'all_items'){
                        $items = \App\item::where('user_id', $doctor->user->id)->where('published', 1)->paginate(24);
                    }
                @endphp
                @foreach ($items as $key => $item)
                    <div class="col mb-3">
                        @include('frontend.partials.item_box_1',['item' => $item])
                    </div>
                @endforeach
            </div>
            <div class="aiz-pagination aiz-pagination-center mb-4">
                {{ $items->links() }}
            </div>
        </div>
    </section> --}}


@endsection
