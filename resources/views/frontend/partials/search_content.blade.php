{{-- <div class="">
    @if (sizeof($keywords) > 0)
        <div class="px-2 py-1 text-uppercase fs-10 text-right text-muted bg-soft-secondary">{{translate('Popular Suggestions')}}</div>
        <ul class="list-group list-group-raw">
            @foreach ($keywords as $key => $keyword)
                <li class="list-group-item py-1 text-dark">
                    <a class="text-reset hov-text-primary" href="{{ route('suggestion.search', $keyword) }}">{{ $keyword }}</a>
                </li>
            @endforeach
        </ul>
    @endif
</div> --}}
<div class="">
    @if (count($categories) > 0)
        <div class="px-2 py-1 text-uppercase fs-10 text-right text-muted bg-soft-secondary">{{translate('Category Suggestions')}}</div>
        <ul class="list-group list-group-raw">
            @foreach ($categories as $key => $category)
                <li class="list-group-item py-1 text-dark">
                    <a class="text-reset hov-text-primary" href="{{ route('products.category', $category->slug) }}">{{ $category->getTranslation('name') }}</a>
                </li>
            @endforeach
        </ul>
    @endif
</div>
<div class="">
    @if (count($products) > 0)
        <div class="px-2 py-1 text-uppercase fs-10 text-right text-muted bg-soft-secondary">{{translate('Products')}}</div>
        <ul class="list-group list-group-raw">
            @foreach ($products as $key => $product)
            <a class="text-reset " href="{{ route('product', $product->slug) }}">
                <li class="border-bottom border-soft-dark list-group-item text-dark hov-bg-soft-primary">

                        <div class="d-flex search-product align-items-center">
                            <div class="mr-3 d-none d-sm-block">
                                <img class="size-40px img-fit rounded" src="@if ($product->thumbnail_img != null)
                                    {{uploaded_asset($product->thumbnail_img)}}
                                    @else
                                    {{uploaded_asset($product->minor->icon)}}
                                @endif ">
                            </div>
                            <div class="flex-grow-1 overflow--hidden minw-0">


                                <div class="product-name text-truncate fs-14 ">
                                    <span class="text-primary"> {{$product->minor->name}}. </span> <span class="fw-700"> {{  $product->getTranslation('name')  }} </span> <sub> {{  $product->item_strength  }}</sub>
                                    @if ($product->brand != null)
                                    {{-- <div class="col-auto float-right">
                                        <a href="{{ route('products.brand',$product->brand->slug) }}">
                                            <img src="{{ uploaded_asset($product->brand->logo) }}" alt="{{ $product->brand->getTranslation('name') }}" height="30">
                                        </a>
                                    </div> --}}
                                    @endif



                                    <div class="float-right">
                                        @if(home_base_price($product) != home_discounted_base_price($product))
                                        <del class="opacity-60 fs-15">{{ home_base_price($product) }}</del>
                                    @endif
                                    <span class="fw-600 fs-13 text-primary d-block d-sm-none">  {{ home_discounted_base_price($product) }} <span class="h5">&#2547;</span> </span>
                                    <span class="fw-600 fs-13 text-primary d-none d-sm-block">Unit Price: {{ home_discounted_base_price($product) }} <span class="h5">&#2547;</span> </span>
                                    </div>

                                </div>





                                <div>
                                    <div class="fon-block float-right">


                                        <a class="text-danger" href="javascript:void(0)" onclick="showAddToCartModal({{ $product->id }})" data-toggle="tooltip" data-title="{{ translate('Click for Buy') }}" data-placement="bottom">
                                            ADD TO CART
                                        </a>

                                    </div>
                                    <a class="text-reset " href="{{ route('product', $product->slug) }}">

                                    @if ($product->generic->name)
                                    <div >

                                        <small style="font-size: 12px" class="mr-2 opacity-80">{{ translate('Generic Name')}}:</small><span class="h7 opacity-73 fw-700">{{ $product->generic->name }}</span>

                                    </div>
                                    @endif
                                </div>

                                <div class="text-primary">
                                    @if ($product->brand != null)

                                    {{ $product->brand->name}}
                                    @endif

                                </div>

                            </a>
                            </div>

                        </div>

                </li>

            </a>
            @endforeach
        </ul>
    @endif
</div>
{{-- @if(get_setting('vendor_system_activation') == 2) --}}
    <div class="">
        @if (count($generics) > 0)
            <div class="px-2 py-1 text-uppercase fs-10 text-right text-muted bg-soft-secondary">{{translate('Generics')}}</div>
            <ul class="list-group list-group-raw">
                @foreach ($generics as $key => $item)
                    <li class="list-group-item text-dark">
                        <a class="text-reset" href="{{ route('generic.show', ['slug'=>$item->slug, 'id'=>$item->id]) }}">
                            <div class="d-flex search-product align-items-center">
                                {{-- <div class="mr-3">
                                    <img class="size-40px img-fit rounded" src="{{ uploaded_asset($shop->logo) }}">
                                </div> --}}
                                <div class="flex-grow-1 overflow--hidden">
                                    <div class="product-name text-truncate fs-14 mb-5px">
                                        {{ $item->name }}
                                    </div>
                                    <div>

                                    </div>
                                </div>



                            </div>
                        </a>

                    </li>
                    <li class="list-group-item">
                        <span class=" float-right px-1 text-uppercase fs-10 text-right text-muted bg-soft-primary">{{translate('Drugs under this Generic')}}</span><br>
                        @foreach (\App\Product::where('published', 1)->where('generic_id', $item->id)->orderBy('name','asc')->get()->take(7) as $prod)
                           <a href="{{route('product', $prod->slug)}}" target="_blank" rel="noopener noreferrer"><span class=" float-right"> @br2nl($prod->name)</span></a><br>
                        @endforeach
                    </li>
                @endforeach

            </ul>
        @endif
    </div>
    <div class="">
        @if (count($indicates) > 0)
            <div class="px-2 py-1 text-uppercase fs-10 text-right text-muted bg-soft-secondary">{{translate('Search by Indicates')}}</div>
            <ul class="list-group list-group-raw">
                @foreach ($products as $key => $product)
                <li class="list-group-item">
                    <a class="text-reset" href="{{ route('product', $product->slug) }}">
                        <div class="d-flex search-product align-items-center">
                            <div class="mr-3">
                                <img class="size-40px img-fit rounded" src="@if ($product->thumbnail_img != null)
                                    {{uploaded_asset($product->thumbnail_img)}}
                                    @else
                                    {{uploaded_asset($product->minor->icon)}}
                                @endif ">
                            </div>
                            <div class="flex-grow-1 overflow--hidden minw-0">
                                <div class="product-name text-truncate fs-14 mb-5px">
                                    {{  $product->name  }}
                                    <input type="hidden" name="indicate" value="{{$product->indicate}}" id="">
                                </div>
                                <div class="">
                                    @if(home_base_price($product) != home_discounted_base_price($product))
                                        <del class="opacity-60 fs-15">{{ home_base_price($product) }}</del>
                                    @endif
                                    <span class="fw-600 fs-16 text-primary">{{ home_discounted_base_price($product) }}</span>
                                </div>
                            </div>
                        </div>
                    </a>
                </li>
            @endforeach
            </ul>
        @endif
    </div>
{{-- @endif --}}
