<style>
    .discount-percent {
    font-size: 12px;
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
    background: -webkit-gradient(linear,left top,left bottom,from(#45bdaa),to(transparent));
    background: -webkit-linear-gradient(#45bdaa,transparent);
    background: -moz-linear-gradient(#45bdaa,transparent);
    background: linear-gradient(#45bdaa,transparent);
    background-color: #006c7a;
    border-bottom-right-radius: 25px;
    border-bottom-left-radius: 25px;
    -webkit-box-shadow: -1px 1px 3px 0 rgb(0 0 0 / 35%);
    box-shadow: -1px 1px 3px 0 rgb(0 0 0 / 35%);
    left: 76%;
    width: 42px;
    z-index: 90;
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
</style>
<div id="genericProduc" onchange="setProductList()" class="aiz-card-box border rounded hov-shadow-md mt-1 mb-2 has-transition">

    <div  class="position-relative row">
        <div class="float-right discount-percent {{ $product->discount == null ? 'bg-danger':'' }}">
            @if ($product->discount != null)
            @if ($product->discount_type == 'percent')
            {{$product->discount}}%
            @endif

            @if ($product->discount_type == 'flat')
            {{$product->discount}}TK
            @endif

        <br>Off</div>
            @else
                No<br>Off</div>
            @endif

     <div class="col-md-2">
       <a href="{{ route('product', $item->slug) }}" class="d-block">

           @if ($item->thumbnail_img)
                 <img
                 class="img-fit lazyload mx-auto h-140px h-md-210px"
                 src="{{ static_asset('assets/img/placeholder.jpg') }}"
                 data-src="{{ uploaded_asset($item->thumbnail_img) }}"
                 alt="{{  $item->getTranslation('name')  }}"
                 onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
             >
             @else
             <span  class="avatar avatar-square avatar-xs">
                 <img style="
                margin-left: 35px;
                 margin-top: 30px;
                 width: 46px;
     height: 30px;" src="{{ uploaded_asset($item->minor->icon) }}" alt="{{translate('icon')}}">
             </span>

           @endif

         </a>
     </div>

<div class="col-md-10">



<div class=" d-md-none d-lg-block d-none d-sm-block">
<div class=" absolute-top-right aiz-p-hov-icon">

<a style="margin-left: -14px;" href="javascript:void(0)" onclick="addToWishList({{ $item->id }})" data-toggle="tooltip" data-title="{{ translate('Add to wishlist') }}" data-placement="left">
<i class="la la-heart-o"></i>
</a>
{{-- <a   href="javascript:void(0)" onclick="addToCompare({{ $item->id }})" data-toggle="tooltip" data-title="{{ translate('Add to compare') }}" data-placement="left">
<i class="las la-sync"></i>
</a> --}}
<a style="margin-left: -14px;"  href="javascript:void(0)" onclick="showAddToCartModal({{ $item->id }})" data-toggle="tooltip" data-title="{{ translate('Add to cart') }}" data-placement="left">
<i class="las la-shopping-cart"></i>
</a>
</div>
</div>

<div class="fon-block d-xl-none d-md-none d-lg-none float-right pb-2 pr-3">

<a class="fon" href="javascript:void(0)" onclick="addToWishList({{ $item->id }})" data-toggle="tooltip" data-title="{{ translate('Add to wishlist') }}" data-placement="left">
<i class="fad fa-heart"></i>
</a>
{{-- <a class="fon"  href="javascript:void(0)" onclick="addToCompare({{ $item->id }})" data-toggle="tooltip" data-title="{{ translate('Add to compare') }}" data-placement="left">
<i class="fal fa-sync"></i>
</a> --}}
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

<h3 class="fw-600 fs-13 text-truncate-2 lh-1-4 mb-0 h-20px">
<a href="{{ route('product', $item->slug) }}" class="d-block text-reset">{{  $item->getTranslation('name')}} &nbsp;<sub><span style="font-size: 10px" class="opacity-70">{{ $item->item_strength }}</span></sub></a>
</h3> <span style="color: blue"> {{ $item->minor->name }} </span><br>


<a href="{{$item->generic->slug}}"><span style="color: blue"> {{ $item->generic->name }} </span></a><br>

<a href="{{url('/company').'/'.$item->brand->slug}}"><span style="color: blue"> {{ $item->brand->name }} </span></a>
@if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated)
<div class="rounded px-2 mt-2 bg-soft-primary border-soft-primary border">
{{ translate('Club Point') }}:
<span class="fw-700 float-right">{{ $item->earn_point }}</span>
</div>
@endif
<div class="fs-15">
@if(home_base_price($product) != home_discounted_base_price($product))
<del class="fw-600 opacity-50 mr-1">{{ home_base_price($product) }}</del>
@endif
<span class="fw-700 text-primary">{{ home_discounted_base_price($product) }}</span>
</div>
</div>

</div>

   </div>
   </div>
















