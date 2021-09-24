<style>
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
/* #genericProduct {

background: rgb(37 188 241 / 15%);

border: 1px solid gold;


} */
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
</style>

<div id="genericProduct" onchange="setProductList()" class="aiz-card-box bg-white border rounded hov-shadow-md mt-1 mb-2 has-transition">

    <div  class="position-relative">

        <div class="text-center float-right discount-percent  {{ $product->discount == null ? '':'discount-bg-on' }} {{ $product->discount != null ? 'discount-bg-on':'discount-bg' }}">
            @if ($product->discount != null)
            @if ($product->discount_type == 'percent')
            {{$product->discount}}%
            @endif

            @if ($product->discount_type == 'amount')
            &#2547;{{$product->discount}}
            @endif

        <br>Off</div>
            @else
                No<br>Off</div>
            @endif

       <a href="{{ route('product', $product->slug) }}" class="d-block">

           @if ($product->thumbnail_img)
                 <img
                 class=" lazyload mx-auto h-140px h-md-210px"
                 src="{{ static_asset('assets/img/placeholder.jpg') }}"
                 data-src="{{ uploaded_asset($product->thumbnail_img) }}"
                 alt="{{  $product->getTranslation('name')  }}"
                 onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
             >
             @else
             @if ($product->minor->id != 0)
             <span  class="avatar avatar-square avatar-xs">
                <img style="
               margin-left: 35px;
                margin-top: 30px;
                width: 46px;
    height: 30px;" src="{{ uploaded_asset($product->minor->icon) }}" alt="{{translate('icon')}}">
            </span>
             @endif

           @endif

         </a>










<div class=" d-md-none d-lg-block d-none d-sm-block">
<div class=" absolute-top-right mt-5 aiz-p-hov-icon">

<a style="margin-left: -14px;" href="javascript:void(0)" onclick="addToWishList({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to wishlist') }}" data-placement="left">
<i class="la la-heart-o"></i>
</a>
@if(get_setting('compare_option') == '1')
<a style="margin-left: -14px;"  href="javascript:void(0)" onclick="addToCompare({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to compare') }}" data-placement="left">
    <i class="las la-sync"></i>
</a>
@endif
<a style="margin-left: -14px;"  href="javascript:void(0)" onclick="showAddToCartModal({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to cart') }}" data-placement="left">
<i class="las la-shopping-cart"></i>
</a>
</div>
</div>

<div class="fon-block d-xl-none d-md-none d-lg-none float-right pb-2 pr-3">

<a class="fon" href="javascript:void(0)" onclick="addToWishList({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to wishlist') }}" data-placement="left">
<i class="fad fa-heart"></i>
</a>
@if(get_setting('compare_option') == '1')
<a   href="javascript:void(0)" onclick="addToCompare({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to compare') }}" data-placement="left">
    <i class="las la-sync"></i>
</a>
@endif
<a class="fon"  href="javascript:void(0)" onclick="showAddToCartModal({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to cart') }}" data-placement="left">
<i class="fal fa-cart-plus"></i>
</a>

</div>


<div style="margin-top: -11px;" class="p-md-3 p-2 text-left">

@if ($product->rating)
<div class="rating rating-sm mt-1">
{{ renderStarRating($product->rating) }}
</div>
@endif

<h3 class="fw-600 d-inline fs-13 text-truncate-2 lh-1-4 mb-0 h-20px">



<a href="{{ route('product', $product->slug) }}" class="d-block text-reset">

    @if ($product->minor->id != 0)
    @if ($product->thumbnail_img)
    <img class="img-fluid d-inline dosage-img" src="{{ uploaded_asset($product->minor->icon) }}" alt="{{translate('icon')}}">
    @endif
    @endif


    {{  $product->getTranslation('name')}} &nbsp;<sub><span style="font-size: 10px" class="opacity-90">{{ $product->item_strength }}</span></sub></a>
</h3> <span style="color: blue"> {{ $product->minor->name }} </span><br>


<a href=""><span style="color: blue"> {{ $product->generic->name }} </span></a><br>

<a href="{{url('/company').'/'.$product->brand->slug}}"><span style="color: blue"> {{ $product->brand->name }} </span></a>
@if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated)
<div class="rounded px-2 mt-2 bg-soft-primary border-soft-primary border">
{{ translate('Club Point') }}:
<span class="fw-700 float-right">{{ $product->earn_point }}</span>
</div>
@endif
<div class="fs-15">
@if(home_base_price($product) != home_discounted_base_price($product))
<del class="fw-600 opacity-50 mr-1">{{ home_base_price($product) }}</del>
@endif
<span class="fw-700 text-primary">{{ home_discounted_base_price($product) }} &#2547;  </span>
</div>
</div>



   </div>
   </div>


















{{--
<div class="aiz-card-box border border-light rounded hov-shadow-md mt-1 mb-2 has-transition bg-white border-info">

    <div class="position-relative">

        <a href="{{ route('product', $product->slug) }}" class="d-block">

          @if ($product->thumbnail_img)
                <img
                class="img-fit lazyload mx-auto h-140px h-md-210px"
                src="{{ static_asset('assets/img/placeholder.jpg') }}"
                data-src="{{ uploaded_asset($product->thumbnail_img) }}"
                alt="{{  $product->getTranslation('name')  }}"
                onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
            >
            @else
            <span  class="avatar avatar-square avatar-xs">
                <img style="
               margin-left: 35px;
                margin-top: 30px;
                width: 46px;
    height: 30px;" src="{{ uploaded_asset($product->minor->icon) }}" alt="{{translate('icon')}}">
            </span>

          @endif

        </a>
        <div class=" d-md-none d-lg-block d-none d-sm-block">
        <div class=" absolute-top-right aiz-p-hov-icon">

            <a href="javascript:void(0)" onclick="addToWishList({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to wishlist') }}" data-placement="left">
                <i class="la la-heart-o"></i>
            </a>
            @if(get_setting('compare_option') == '1')
            <a   href="javascript:void(0)" onclick="addToCompare({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to compare') }}" data-placement="left">
                <i class="las la-sync"></i>
            </a>
            @endif
            <a   href="javascript:void(0)" onclick="showAddToCartModal({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to cart') }}" data-placement="left">
                <i class="las la-shopping-cart"></i>
            </a>
        </div>
        </div>
        <style>









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
        </style>
        <div class="fon-block d-xl-none d-md-none d-lg-none">

            <a class="fon" href="javascript:void(0)" onclick="addToWishList({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to wishlist') }}" data-placement="left">
                <i class="fad fa-heart"></i>
            </a>
            <a class="fon"  href="javascript:void(0)" onclick="addToCompare({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to compare') }}" data-placement="left">
                <i class="fal fa-sync"></i>
            </a>
            <a class="fon"  href="javascript:void(0)" onclick="showAddToCartModal({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Add to cart') }}" data-placement="left">
                <i class="fal fa-cart-plus"></i>
            </a>

        </div>

    </div>
    <div style="margin-top: -11px;" class="p-md-3 p-2 text-left">
        <div class="fs-15">
            @if(home_base_price($product) != home_discounted_base_price($product))
                <del class="fw-600 opacity-50 mr-1">{{ home_base_price($product) }}</del>
            @endif
            <span class="fw-700 text-primary">{{ home_discounted_base_price($product) }}</span>
        </div>
        <div class="rating rating-sm mt-1">
            {{ renderStarRating($product->rating) }}
        </div>
        <h3 class="fw-600 fs-13 text-truncate-2 lh-1-4 mb-0 h-35px">
            <a href="{{ route('product', $product->slug) }}" class="d-block text-reset">{{  $product->getTranslation('name')}}/<sub><span style="font-size: 10px" class="opacity-70">{{ $product->product_strength }}</span></sub></a>
        </h3> <span style="color: blue"> {{ $product->minor->name }} </span>
        @if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated)
            <div class="rounded px-2 mt-2 bg-soft-primary border-soft-primary border">
                {{ translate('Club Point') }}:
                <span class="fw-700 float-right">{{ $product->earn_point }}</span>
            </div>
        @endif
    </div>

</div> --}}
