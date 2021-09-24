@extends('backend.layouts.app')

@section('content')
<div class="aiz-titlebar text-left mt-2 mb-3">
    <h5 class="mb-0 h6">{{translate('Add New Product')}}</h5>
</div>
<div class="">
    <form class="form form-horizontal mar-top" action="{{route('products.store')}}" method="POST" enctype="multipart/form-data" id="choice_form">
        <div onclick="yesnoCheck()"  class="row gutters-5">
            <div class="col-lg-8">
                @csrf
                <input type="hidden" name="added_by" value="admin">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0 h6">{{translate('Product Information')}}</h5>


                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-md-3 col-from-label">{{translate('Product Name')}} <span class="text-danger">*</span></label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" name="name" placeholder="{{ translate('Product Name') }}" onchange="update_sku()">
                            </div>
                        </div>
                        <div class="form-group row" id="category">
                            <label class="col-md-3 col-from-label">{{translate('Mejor Group')}} <span class="text-danger">*</span></label>
                            <div class="col-md-8">
                                <select class="form-control aiz-selectpicker" name="category_id" id="category_id" data-live-search="true">
                                    @foreach ($categories as $category)
                                    <option value="{{ $category->id }}">{{ $category->getTranslation('name') }}</option>
                                    @foreach ($category->childrenCategories as $childCategory)
                                    @include('categories.child_category', ['child_category' => $childCategory])
                                    @endforeach
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="form-group row" id="category">
                            <label class="col-md-3 col-from-label">{{translate('Minor Group')}} <span class="text-danger">*</span></label>
                            <div class="col-md-8">
                                <select class="form-control aiz-selectpicker" name="minor_group_id" id="minor_group_id" data-live-search="true">
                                    @foreach ($minor_group as $category)
                                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="form-group row" id="brand">
                            <label class="col-md-3 col-from-label">{{translate('Company')}}</label>
                            <div class="col-md-8">
                                <select class="form-control aiz-selectpicker" name="brand_id" id="brand_id" data-live-search="true">
                                    <option value="">{{ translate('Select Company') }}</option>
                                    @foreach (\App\Brand::all() as $brand)
                                    <option value="{{ $brand->id }}">{{ $brand->getTranslation('name') }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="form-group row" id="category">
                            <label class="col-md-3 col-from-label">{{translate('Generic')}} <span class="text-danger">*</span></label>
                            <div class="col-md-8">
                                <select class="form-control aiz-selectpicker" name="generic_id" id="generic_id" data-live-search="true">
                                    @foreach ($generic as $category)
                                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        {{-- <div class="form-group row">
                            <label class="col-md-3 col-from-label">{{translate('Indications')}}</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" name="indicate" placeholder="{{ translate(' (e.g. Feaver, Pain etc)') }}">
                            </div>
                        </div> --}}

                        <div class="form-group row">
                            <label class="col-md-3 col-from-label">{{translate('Indications')}} </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control aiz-tag-input" name="indicates[]" placeholder="{{ translate('Type and hit enter to add a indicate') }}">
                                <small class="text-muted">{{translate('This is used for search. Input those words by which cutomer can find this product.')}}</small>
                            </div>
                        </div>







                        <div class="form-group row" id="category">
                            <label class="col-md-3 col-from-label">{{translate('Item Strength')}} <span class="text-danger">*</span></label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" name="item_strength" placeholder="{{ translate('item_strength (e.g. KG, Pc etc)') }}">
                            </div>
                        </div>
                        {{-- <div class="form-group row">
                            <label class="col-md-3 col-from-label">{{translate('Pack Size')}}</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="ps" name="pack_size" placeholder="{{ translate('pack size (e.g. KG, Pc etc)') }}">
                            </div>
                        </div> --}}
                        {{-- <div class="form-group row">
                            <label class="col-md-3 col-from-label">{{translate('Unit')}}</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" name="unit" placeholder="{{ translate('Unit (e.g. KG, Pc etc)') }}">
                            </div>
                        </div> --}}
                        {{-- <div class="form-group row">
                            <label class="col-md-3 col-from-label">{{translate('Selling Unit')}}</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" name="selling_unit" id="su" placeholder="{{ translate('Selling Unit (e.g. pieces per pata)') }}">
                            </div>
                        </div> --}}
                        <div class="form-group row">
                            <label class="col-md-3 col-from-label">{{translate('Minimum Purchase Qty')}} <span class="text-danger">*</span></label>
                            <div class="col-md-8">
                                <input type="number" lang="en" class="form-control" name="min_qty" value="1" min="1">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-3 col-from-label">{{translate('Tags')}} <span class="text-danger">*</span></label>
                            <div class="col-md-8">
                                <input type="text" class="form-control aiz-tag-input" name="tags[]" placeholder="{{ translate('Type and hit enter to add a tag') }}">
                                <small class="text-muted">{{translate('This is used for search. Input those words by which cutomer can find this product.')}}</small>
                            </div>
                        </div>

                        @php
                        $pos_addon = \App\Addon::where('unique_identifier', 'pos_system')->first();
                        @endphp
                        @if ($pos_addon != null && $pos_addon->activated == 1)
                        <div class="form-group row">
                            <label class="col-md-3 col-from-label">{{translate('Barcode')}}</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" name="barcode" placeholder="{{ translate('Barcode') }}">
                            </div>
                        </div>
                        @endif

                        @php
                        $refund_request_addon = \App\Addon::where('unique_identifier', 'refund_request')->first();
                        @endphp
                        @if ($refund_request_addon != null && $refund_request_addon->activated == 1)
                        <div class="form-group row">
                            <label class="col-md-3 col-from-label">{{translate('Refundable')}}</label>
                            <div class="col-md-8">
                                <label class="aiz-switch aiz-switch-success mb-0">
                                    <input type="checkbox" name="refundable" checked>
                                    <span></span>
                                </label>
                            </div>
                        </div>
                        @endif
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0 h6">{{translate('Product Images')}}</h5>
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-md-3 col-form-label" for="signinSrEmail">{{translate('Gallery Images')}} <small>(600x600)</small></label>
                            <div class="col-md-8">
                                <div class="input-group" data-toggle="aizuploader" data-type="image" data-multiple="true">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text bg-soft-secondary font-weight-medium">{{ translate('Browse')}}</div>
                                    </div>
                                    <div class="form-control file-amount">{{ translate('Choose File') }}</div>
                                    <input type="hidden" name="photos" class="selected-files">
                                </div>
                                <div class="file-preview box sm">
                               </div>
                                <small class="text-muted">{{translate('These images are visible in product details page gallery. Use 600x600 sizes images.')}}</small>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-3 col-form-label" for="signinSrEmail">{{translate('Thumbnail Image')}} <small>(300x300)</small></label>
                            <div class="col-md-8">
                                <div class="input-group" data-toggle="aizuploader" data-type="image">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text bg-soft-secondary font-weight-medium">{{ translate('Browse')}}</div>
                                    </div>
                                    <div class="form-control file-amount">{{ translate('Choose File') }}</div>
                                    <input type="hidden" name="thumbnail_img" class="selected-files">
                                </div>
                                <div class="file-preview box sm">
                                </div>
                                <small class="text-muted">{{translate('This image is visible in all product box. Use 300x300 sizes image. Keep some blank space around main object of your image as we had to crop some edge in different devices to make it responsive.')}}</small>
                            </div>
                        </div>
                    </div>
                </div>






                <script type="text/javascript">
                    window.onload = function() {
                       document.getElementById('ifYes').style.display = 'block';
                       document.getElementById('ifNo').style.display = 'none';
                   }
                   function yesnoCheck() {
                       if (document.getElementById('yesCheck').checked) {
                           document.getElementById('ifYes').style.display = 'block';
                           document.getElementById('ifNo').style.display = 'none';

                       }
                       else if(document.getElementById('noCheck').checked) {
                           document.getElementById('ifNo').style.display = 'block';
                           document.getElementById('ifYes').style.display = 'none';

                      }
                   }
                   </script>

<div class="card">
    <div class="card-header">
                 <h5 class="mb-0 h6">{{translate('Special Section')}}</h5>
    </div>
        <div class="card-body">



                          <h5 class="mb-0 h6">{{translate('Select Pricing :')}}</h5><br>

                          <div class="custom-control custom-radio custom-control-inline">
                            <input checked type="radio" class="custom-control-input" onclick="javascript:yesnoCheck();" id="yesCheck" name="yesno">
                            <label class="custom-control-label" for="yesCheck">{{translate('Company Rate')}}</label>
                            <div class="invalid-feedback">Please check one option</div>
                          </div>
                          <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" onclick="javascript:yesnoCheck();" id="noCheck" value="2" name="yesno" >
                            <label class="custom-control-label" for="noCheck">{{translate('Flat Rate')}}</label>
                            <div class="invalid-feedback">Please check one option</div>
                          </div>


                          {{-- <input type="radio" onclick="javascript:yesnoCheck();" name="yesno" id="yesCheck"/> --}}
{{--
                                        <label for="yesCheck" class="col-md-3 col-from-label">{{translate('Company Rate')}}</label>

                                        <label for="noCheck" class="col-md-2 col-from-label">{{translate('Flat Rate')}}</label> --}}

                                        <br><br><br><br>
                                        <div id="ifYes" style="display: block">

                                     <div class="form-group row">
                                         <label class="col-md-3 col-from-label">{{translate('Trade Price')}}</label>
                                         <div class="col-md-7">
                                         <div class="input-group">
                                             <input oninput="calc()" name="trade_price" type="number" lang="en" min="0" value="" class="form-control" id="tp" placeholder="{{ translate('Trade Price') }}">
                                             <div class="input-group-prepend">
                                                 <span class="input-group-text" id="inputGroupPrepend">TK</span>
                                             </div>
                                         </div>
                                         </div>
                                     </div>
                                     <div class="form-group row">
                                         <label class="col-md-3 col-from-label">{{translate('Company Discount')}}</label>
                                         <div class="col-md-5">
                                         <div class="input-group">
                                             <input oninput="calc()" name="company_discount" type="number" lang="en" min="0" value="" class="form-control" id="cd" placeholder="{{ translate('Company Discount') }}">
                                             <div class="input-group-prepend">
                                                 <span class="input-group-text" id="inputGroupPrepend">%</span>
                                             </div>
                                             </div>
                                         </div>
                                     </div>
                                     <div class="form-group row">
                                         <label class="col-md-3 col-from-label">{{translate('Other Discount')}}</label>
                                         <div class="col-md-5">
                                             <div class="input-group">
                                             <input oninput="calc()" onclick="calc();" name="other_discount" type="number" lang="en" min="0" value="" class="form-control" id="od" placeholder="{{ translate('Other Discount') }}">
                                             <div class="input-group-prepend">
                                                 <span class="input-group-text" id="inputGroupPrepend">%</span>
                                             </div>
                                             </div>
                                         </div>
                                     </div>




                                     <div class="form-group row">
                                         <label class="col-md-3 col-from-label">{{translate('vat')}}</label>
                                         <div class="col-md-5">
                                             <div class="input-group">
                                             <input oninput="calc()" onclick="calc();" name="vat" type="number" lang="en" min="0" value="" class="form-control" id="vat" placeholder="{{ translate('vat') }}">
                                             <div class="input-group-prepend">
                                                 <span class="input-group-text" id="inputGroupPrepend">TK</span>
                                             </div>
                                             </div>
                                         </div>
                                     </div>


                                     <div class="form-group row">
                                        <label class="col-md-3 col-from-label">{{translate('Buying Price')}}</label>
                                        <div class="col-md-5">
                                            <form action="#">

                                            <div class="input-group">
                                            <input onvolumechange="calc()" name="buying_price" onclick="calc();" type="text" class="form-control" id="bp" >
                                            <div class="input-group-prepend">
                                                <button class="input-group-text" id="inputGroupPrepend" type="button" oninput="calc()">TK</button>
                                            </div>
                                            </div>
                                        </div>

                                    </div>

                                     <div class="form-group row">
                                        <label class="col-md-3 col-from-label">{{translate('Pack Price')}}</label>
                                        <div class="col-md-5">
                                            <form action="#">

                                            <div class="input-group">
                                            <input oninput="calc()"  name="pack_price" onclick="calc();" type="text" class="form-control" id="pp" >
                                            <div class="input-group-prepend">
                                                <button class="input-group-text" id="inputGroupPrepend" type="button" oninput="calc()">TK</button>
                                            </div>
                                            </div>
                                        </div>

                                    </div>

                                     <div class="form-group row">
                                        <label class="col-md-3 col-from-label">{{translate('Box Size in Unit')}}</label>
                                        <div class="col-md-5">
                                            <form action="#">

                                            <div class="input-group">
                                            <input oninput="calc()"  name="pack_size" onclick="calc();" type="text" class="form-control" id="ps" >
                                            <div class="input-group-prepend">
                                                <button class="input-group-text" id="inputGroupPrepend" type="button" oninput="calc()">Units</button>
                                            </div>
                                            </div>
                                        </div>

                                    </div>

                                     <div class="form-group row">
                                        <label class="col-md-3 col-from-label">{{translate('Box Size in Strip')}}</label>
                                        <div class="col-md-5">
                                            <form action="#">

                                            <div class="input-group">
                                            <input oninput="calc()"  name="box_size_strip" onclick="calc();" type="text" class="form-control" id="bss" >
                                            <div class="input-group-prepend">
                                                <button class="input-group-text" id="inputGroupPrepend" type="button" oninput="calc()">Strips</button>
                                            </div>
                                            </div>
                                        </div>

                                    </div>

                                     <div class="form-group row">
                                        <label class="col-md-3 col-from-label">{{translate('Strip Size in Unit')}}</label>
                                        <div class="col-md-5">
                                            <form action="#">

                                            <div class="input-group">
                                            <input oninput="calc()"  name="strip_size" onclick="calc();" type="text" class="form-control" id="ssResult" >
                                            <div class="input-group-prepend">
                                                <button class="input-group-text" id="inputGroupPrepend" type="button" oninput="calc()">Units</button>
                                            </div>
                                            </div>
                                        </div>

                                    </div>
                                     <div class="form-group row">
                                        <label class="col-md-3 col-from-label">{{translate('Selling Unit Price')}}</label>
                                        <div class="col-md-5">
                                            <form action="#">

                                            <div class="input-group">
                                            <input oninput="calc()" name="selling_unit_price"  onclick="calc();" type="text" class="form-control" id="sup" >
                                            <div class="input-group-prepend">
                                                <button class="input-group-text" id="inputGroupPrepend" type="button" oninput="calc()">TK</button>
                                            </div>
                                            </div>
                                        </div>

                                    </div>
                                     <div class="form-group row">
                                        <label class="col-md-3 col-from-label">{{translate('Selling Unit Buying Price')}}</label>
                                        <div class="col-md-5">
                                            <form action="#">

                                            <div class="input-group">
                                            <input onvolumechange="calc()" name="selling_unit_buying_price" onclick="calc();"  type="text" class="form-control" id="subp" >
                                            <div class="input-group-prepend">
                                                <button class="input-group-text" id="inputGroupPrepend" type="button" oninput="calc()">TK</button>
                                            </div>
                                            </div>
                                        </div>

                                    </div>
                                        </div>



                             <div id="ifNo" style="display:none">


                                <div class="form-group row">
                                    <label class="col-md-3 col-from-label">{{translate('Pack Size')}}</label>
                                    <div class="col-md-5">
                                        <form action="#">

                                        <div class="input-group">
                                        <input  name="flat_pack_size" type="text" class="form-control" id="ps" >
                                        <div class="input-group-prepend">
                                            <button class="input-group-text" id="inputGroupPrepend" type="button" oninput="calc()">Unit</button>
                                        </div>
                                        </div>
                                    </div>

                                </div>

                                      <div class="form-group row">
                                         <label class="col-md-3 col-from-label">{{translate('Pack Price')}}</label>
                                         <div class="col-md-5">
                                             <form action="#">

                                             <div class="input-group">
                                             <input onvolumechange="calc()" onclick="calc();" name="flat_pack_price" type="text" name="flat_pack_price" class="form-control" id="result" >
                                             <div class="input-group-prepend">
                                                 <button class="input-group-text" id="inputGroupPrepend" type="number" oninput="calc()">TK</button>
                                             </div>
                                             </div>
                                         </div>

                                     </div>

                                      <div class="form-group row">
                                         <label class="col-md-3 col-from-label">{{translate('Unit Price')}}</label>
                                         <div class="col-md-5">
                                             <form action="#">

                                             <div class="input-group">
                                             <input onvolumechange="calc()" onclick="calc();" name="flat_unit_price" type="text" class="form-control" id="unit_price" >
                                             <div class="input-group-prepend">
                                                 <button class="input-group-text" id="inputGroupPrepend" type="button" oninput="calc()">TK</button>
                                             </div>
                                             </div>
                                         </div>

                                     </div>
                                      <div class="form-group row">
                                         <label class="col-md-3 col-from-label">{{translate('Selling Unit Buying Price')}}</label>
                                         <div class="col-md-5">
                                             <form action="#">

                                             <div class="input-group">
                                             <input onvolumechange="calc()" onclick="calc();"  name="flat_selling_unit_buying_price" type="text" class="form-control" id="subp" >
                                             <div class="input-group-prepend">
                                                 <button class="input-group-text" id="inputGroupPrepend" type="button" oninput="calc()">TK</button>
                                             </div>
                                             </div>
                                         </div>

                                     </div>

                </div>






         </div>

      </div>


      <div class="card">
        <div class="card-header">
            <h5 class="mb-0 h6">{{translate('Product price + stock')}}</h5>
        </div>
        <div class="card-body">
            <div class="form-group row">
                <label class="col-md-3 col-from-label">{{translate('Unit price')}} <span class="text-danger">*</span></label>
                <div class="col-md-6">
                    <input oninput="calc()" onclick="calc()" id="sup"  type="number" lang="en" min="0" step="0.01"  name="unit_price" class="form-control">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-3 control-label" for="start_date">{{translate('Discount Date Range')}}</label>
                <div class="col-sm-9">
                  <input type="text" class="form-control aiz-date-range" name="date_range" placeholder="Select Date" data-time-picker="true" data-format="DD-MM-Y HH:mm:ss" data-separator=" to " autocomplete="off">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-md-3 col-from-label">{{translate('Discount')}} <span class="text-danger">*</span></label>
                <div class="col-md-6">
                    <input type="number" lang="en" min="0" value="0" step="0.01" placeholder="{{ translate('Discount') }}" name="discount" class="form-control">
                </div>
                <div class="col-md-3">
                    <select class="form-control aiz-selectpicker" name="discount_type">
                        <option value="amount">{{translate('Flat')}}</option>
                        <option value="percent">{{translate('Percent')}}</option>
                    </select>
                </div>
            </div>

            @if(\App\Addon::where('unique_identifier', 'club_point')->first() != null &&
                \App\Addon::where('unique_identifier', 'club_point')->first()->activated)
                <div class="form-group row">
                    <label class="col-md-3 col-from-label">
                        {{translate('Set Point')}}
                    </label>
                    <div class="col-md-6">
                        <input type="number" lang="en" min="0" value="0" step="1" placeholder="{{ translate('1') }}" name="earn_point" class="form-control">
                    </div>
                </div>
            @endif

            <div id="show-hide-div">
                <div class="form-group row">
                    <label class="col-md-3 col-from-label">{{translate('Quantity')}} <span class="text-danger">*</span></label>
                    <div class="col-md-6">
                        <input type="number" lang="en" min="0" value="0" step="1" placeholder="{{ translate('Quantity') }}" name="current_stock" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-3 col-from-label">
                        {{translate('SKU')}}
                    </label>
                    <div class="col-md-6">
                        <input type="text" placeholder="{{ translate('SKU') }}" name="sku" class="form-control">
                    </div>
                </div>
            </div>
            <br>
            <div class="sku_combination" id="sku_combination">

            </div>
        </div>
    </div>


                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0 h6">{{translate('Product Videos')}}</h5>
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-md-3 col-from-label">{{translate('Video Provider')}}</label>
                            <div class="col-md-8">
                                <select class="form-control aiz-selectpicker" name="video_provider" id="video_provider">
                                    <option value="youtube">{{translate('Youtube')}}</option>
                                    <option value="dailymotion">{{translate('Dailymotion')}}</option>
                                    <option value="vimeo">{{translate('Vimeo')}}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-3 col-from-label">{{translate('Video Link')}}</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" name="video_link" placeholder="{{ translate('Video Link') }}">
                                <small class="text-muted">{{translate("Use proper link without extra parameter. Don't use short share link/embeded iframe code.")}}</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0 h6">{{translate('Product Variation')}}</h5>
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <div class="col-md-3">
                                <input type="text" class="form-control" value="{{translate('Colors')}}" disabled>
                            </div>
                            <div class="col-md-8">
                                <select class="form-control aiz-selectpicker" data-live-search="true" data-selected-text-format="count" name="colors[]" id="colors" multiple disabled>
                                    @foreach (\App\Color::orderBy('name', 'asc')->get() as $key => $color)
                                    <option  value="{{ $color->code }}" data-content="<span><span class='size-15px d-inline-block mr-2 rounded border' style='background:{{ $color->code }}'></span><span>{{ $color->name }}</span></span>"></option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-1">
                                <label class="aiz-switch aiz-switch-success mb-0">
                                    <input value="1" type="checkbox" name="colors_active">
                                    <span></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-3">
                                <input type="text" class="form-control" value="{{translate('Attributes')}}" disabled>
                            </div>
                            <div class="col-md-8">
                                <select name="choice_attributes[]" id="choice_attributes" class="form-control aiz-selectpicker" data-selected-text-format="count" data-live-search="true" multiple data-placeholder="{{ translate('Choose Attributes') }}">
                                    @foreach (\App\Attribute::all() as $key => $attribute)
                                    <option value="{{ $attribute->id }}">{{ $attribute->getTranslation('name') }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div>
                            <p>{{ translate('Choose the attributes of this product and then input values of each attribute') }}</p>
                            <br>
                        </div>

                        <div class="customer_choice_options" id="customer_choice_options">

                        </div>
                    </div>
                </div>

                {{-- <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0 h6">{{translate('Product Description')}}</h5>
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-md-3 col-from-label">{{translate('Description')}}</label>
                            <div class="col-md-8">
                                <textarea class="aiz-text-editor" name="description"></textarea>
                            </div>
                        </div>
                    </div>
                </div> --}}

<!--                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0 h6">{{translate('Product Shipping Cost')}}</h5>
                    </div>
                    <div class="card-body">

                    </div>
                </div>-->

                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0 h6">{{translate('PDF Specification')}}</h5>
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-md-3 col-form-label" for="signinSrEmail">{{translate('PDF Specification')}}</label>
                            <div class="col-md-8">
                                <div class="input-group" data-toggle="aizuploader" data-type="document">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text bg-soft-secondary font-weight-medium">{{ translate('Browse')}}</div>
                                    </div>
                                    <div class="form-control file-amount">{{ translate('Choose File') }}</div>
                                    <input type="hidden" name="pdf" class="selected-files">
                                </div>
                                <div class="file-preview box sm">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0 h6">{{translate('SEO Meta Tags')}}</h5>
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-md-3 col-from-label">{{translate('Meta Title')}}</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" name="meta_title" placeholder="{{ translate('Meta Title') }}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-3 col-from-label">{{translate('Description')}}</label>
                            <div class="col-md-8">
                                <textarea name="meta_description" rows="8" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-3 col-form-label" for="signinSrEmail">{{ translate('Meta Image') }}</label>
                            <div class="col-md-8">
                                <div class="input-group" data-toggle="aizuploader" data-type="image">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text bg-soft-secondary font-weight-medium">{{ translate('Browse')}}</div>
                                    </div>
                                    <div class="form-control file-amount">{{ translate('Choose File') }}</div>
                                    <input type="hidden" name="meta_img" class="selected-files">
                                </div>
                                <div class="file-preview box sm">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="col-lg-4">

                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0 h6">
                            {{translate('Shipping Configuration')}}
                        </h5>
                    </div>

                    <div class="card-body">
                        @if (get_setting('shipping_type') == 'product_wise_shipping')
                        <div class="form-group row">
                            <label class="col-md-6 col-from-label">{{translate('Free Shipping')}}</label>
                            <div class="col-md-6">
                                <label class="aiz-switch aiz-switch-success mb-0">
                                    <input type="radio" name="shipping_type" value="free" checked>
                                    <span></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-6 col-from-label">{{translate('Flat Rate')}}</label>
                            <div class="col-md-6">
                                <label class="aiz-switch aiz-switch-success mb-0">
                                    <input type="radio" name="shipping_type" value="flat_rate">
                                    <span></span>
                                </label>
                            </div>
                        </div>

                        <div class="flat_rate_shipping_div" style="display: none">
                            <div class="form-group row">
                                <label class="col-md-6 col-from-label">{{translate('Shipping cost')}}</label>
                                <div class="col-md-6">
                                    <input type="number" lang="en" min="0" value="0" step="0.01" placeholder="{{ translate('Shipping cost') }}" name="flat_shipping_cost" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-6 col-from-label">{{translate('Is Product Quantity Mulitiply')}}</label>
                            <div class="col-md-6">
                                <label class="aiz-switch aiz-switch-success mb-0">
                                    <input type="checkbox" name="is_quantity_multiplied" value="1">
                                    <span></span>
                                </label>
                            </div>
                        </div>
                        @else
                        <p>
                            {{ translate('Product wise shipping cost is disable. Shipping cost is configured from here') }}
                            <a href="{{route('shipping_configuration.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['shipping_configuration.index','shipping_configuration.edit','shipping_configuration.update'])}}">
                                <span class="aiz-side-nav-text">{{translate('Shipping Configuration')}}</span>
                            </a>
                        </p>
                        @endif
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0 h6">{{translate('Low Stock Quantity Warning')}}</h5>
                    </div>
                    <div class="card-body">
                        <div class="form-group mb-3">
                            <label for="name">
                                {{translate('Quantity')}}
                            </label>
                            <input type="number" name="low_stock_quantity" value="1" min="0" step="1" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0 h6">
                            {{translate('Stock Visibility State')}}
                        </h5>
                    </div>

                    <div class="card-body">

                        <div class="form-group row">
                            <label class="col-md-6 col-from-label">{{translate('Show Stock Quantity')}}</label>
                            <div class="col-md-6">
                                <label class="aiz-switch aiz-switch-success mb-0">
                                    <input type="radio" name="stock_visibility_state" value="quantity" checked>
                                    <span></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-6 col-from-label">{{translate('Show Stock With Text Only')}}</label>
                            <div class="col-md-6">
                                <label class="aiz-switch aiz-switch-success mb-0">
                                    <input type="radio" name="stock_visibility_state" value="text">
                                    <span></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-6 col-from-label">{{translate('Hide Stock')}}</label>
                            <div class="col-md-6">
                                <label class="aiz-switch aiz-switch-success mb-0">
                                    <input type="radio" name="stock_visibility_state" value="hide">
                                    <span></span>
                                </label>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0 h6">{{translate('Cash On Delivery')}}</h5>
                    </div>
                    <div class="card-body">
                        @if (get_setting('cash_payment') == '1')
                            <div class="form-group row">
                                <label class="col-md-6 col-from-label">{{translate('Status')}}</label>
                                <div class="col-md-6">
                                    <label class="aiz-switch aiz-switch-success mb-0">
                                        <input type="checkbox" name="cash_on_delivery" value="1" checked="">
                                        <span></span>
                                    </label>
                                </div>
                            </div>
                        @else
                            <p>
                                {{ translate('Cash On Delivery option is disabled. Activate this feature from here') }}
                                <a href="{{route('activation.index')}}" class="aiz-side-nav-link {{ areActiveRoutes(['shipping_configuration.index','shipping_configuration.edit','shipping_configuration.update'])}}">
                                    <span class="aiz-side-nav-text">{{translate('Cash Payment Activation')}}</span>
                                </a>
                            </p>
                        @endif
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0 h6">{{translate('Featured')}}</h5>
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-md-6 col-from-label">{{translate('Status')}}</label>
                            <div class="col-md-6">
                                <label class="aiz-switch aiz-switch-success mb-0">
                                    <input type="checkbox" name="featured" value="1">
                                    <span></span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0 h6">{{translate('Todays Deal')}}</h5>
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-md-6 col-from-label">{{translate('Status')}}</label>
                            <div class="col-md-6">
                                <label class="aiz-switch aiz-switch-success mb-0">
                                    <input type="checkbox" name="todays_deal" value="1">
                                    <span></span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0 h6">{{translate('Flash Deal')}}</h5>
                    </div>
                    <div class="card-body">
                        <div class="form-group mb-3">
                            <label for="name">
                                {{translate('Add To Flash')}}
                            </label>
                            <select class="form-control aiz-selectpicker" name="flash_deal_id" id="flash_deal">
                                <option value="">Choose Flash Title</option>
                                @foreach(\App\FlashDeal::where("status", 1)->get() as $flash_deal)
                                    <option value="{{ $flash_deal->id}}">
                                        {{ $flash_deal->title }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group mb-3">
                            <label for="name">
                                {{translate('Discount')}}
                            </label>
                            <input type="number" name="flash_discount" value="0" min="0" step="1" class="form-control">
                        </div>
                        <div class="form-group mb-3">
                            <label for="name">
                                {{translate('Discount Type')}}
                            </label>
                            <select class="form-control aiz-selectpicker" name="flash_discount_type" id="flash_discount_type">
                                <option value="">Choose Discount Type</option>
                                <option value="amount">{{translate('Flat')}}</option>
                                <option value="percent">{{translate('Percent')}}</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0 h6">{{translate('Estimate Shipping Time')}}</h5>
                    </div>
                    <div class="card-body">
                        <div class="form-group mb-3">
                            <label for="name">
                                {{translate('Shipping Days')}}
                            </label>
                            <div class="input-group">
                                <input type="number" class="form-control" name="est_shipping_days" min="1" step="1" placeholder="Shipping Days">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroupPrepend">Days</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0 h6">{{translate('VAT & Tax')}}</h5>
                    </div>
                    <div class="card-body">
                        @foreach(\App\Tax::where('tax_status', 1)->get() as $tax)
                        <label for="name">
                            {{$tax->name}}
                            <input type="hidden" value="{{$tax->id}}" name="tax_id[]">
                        </label>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <input type="number" lang="en" min="0" value="0" step="0.01" placeholder="{{ translate('Tax') }}" name="tax[]" class="form-control">
                            </div>
                            <div class="form-group col-md-6">
                                <select class="form-control aiz-selectpicker" name="tax_type[]">
                                    <option value="amount">{{translate('Flat')}}</option>
                                    <option value="percent">{{translate('Percent')}}</option>
                                </select>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>

            </div>
            <div class="col-12">
                <div class="btn-toolbar float-right mb-3" role="toolbar" aria-label="Toolbar with button groups">
                    <div class="btn-group mr-2" role="group" aria-label="First group">
                        <button type="submit" name="button" value="draft" class="btn btn-warning">{{ translate('Save As Draft') }}</button>
                    </div>
                    <div class="btn-group mr-2" role="group" aria-label="Third group">
                        <button type="submit" name="button" value="unpublish" class="btn btn-primary">{{ translate('Save & Unpublish') }}</button>
                    </div>
                    <div class="btn-group" role="group" aria-label="Second group">
                        <button type="submit" name="button" value="publish" class="btn btn-success">{{ translate('Save & Publish') }}</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

@endsection

@section('script')

<script type="text/javascript">
    $("[name=shipping_type]").on("change", function (){
        $(".flat_rate_shipping_div").hide();

        if($(this).val() == 'flat_rate'){
            $(".flat_rate_shipping_div").show();
        }

    });

    function add_more_customer_choice_option(i, name){
        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type:"POST",
            url:'{{ route('products.add-more-choice-option') }}',
            data:{
               attribute_id: i
            },
            success: function(data) {
                var obj = JSON.parse(data);
                $('#customer_choice_options').append('\
                <div class="form-group row">\
                    <div class="col-md-3">\
                        <input type="hidden" name="choice_no[]" value="'+i+'">\
                        <input type="text" class="form-control" name="choice[]" value="'+name+'" placeholder="{{ translate('Choice Title') }}" readonly>\
                    </div>\
                    <div class="col-md-8">\
                        <select class="form-control aiz-selectpicker attribute_choice" data-live-search="true" name="choice_options_'+ i +'[]" multiple>\
                            '+obj+'\
                        </select>\
                    </div>\
                </div>');
                AIZ.plugins.bootstrapSelect('refresh');
           }
       });


    }

    $('input[name="colors_active"]').on('change', function() {
        if(!$('input[name="colors_active"]').is(':checked')) {
            $('#colors').prop('disabled', true);
            AIZ.plugins.bootstrapSelect('refresh');
        }
        else {
            $('#colors').prop('disabled', false);
            AIZ.plugins.bootstrapSelect('refresh');
        }
        update_sku();
    });

    $(document).on("change", ".attribute_choice",function() {
        update_sku();
    });

    $('#colors').on('change', function() {
        update_sku();
    });

    $('input[name="unit_price"]').on('keyup', function() {
        update_sku();
    });

    $('input[name="name"]').on('keyup', function() {
        update_sku();
    });

    function delete_row(em){
        $(em).closest('.form-group row').remove();
        update_sku();
    }

    function delete_variant(em){
        $(em).closest('.variant').remove();
    }

    function update_sku(){
        $.ajax({
           type:"POST",
           url:'{{ route('products.sku_combination') }}',
           data:$('#choice_form').serialize(),
           success: function(data) {
                $('#sku_combination').html(data);
                AIZ.uploader.previewGenerate();
                AIZ.plugins.fooTable();
                if (data.length > 1) {
                   $('#show-hide-div').hide();
                }
                else {
                    $('#show-hide-div').show();
                }
           }
       });
    }

    $('#choice_attributes').on('change', function() {
        $('#customer_choice_options').html(null);
        $.each($("#choice_attributes option:selected"), function(){
            add_more_customer_choice_option($(this).val(), $(this).text());
        });

        update_sku();
    });

    function calc() {
        var tp = parseFloat(document.getElementById('tp').value);
        var cd = parseFloat(document.getElementById('cd').value);
        var od = parseFloat(document.getElementById('od').value);
        var vat = parseFloat(document.getElementById('vat').value);
        var pp = parseFloat(document.getElementById('pp').value);
        var ps = parseFloat(document.getElementById('ps').value);
        // Size calculation
        var bss = parseFloat(document.getElementById('bss').value);
        var ssResult = ps/bss;

        var cdP = tp * cd/100;
        var odP = tp * od/100;
        var solve = (tp-cdP)-odP;
        var bpS = solve+vat;
        var supR = pp/ps;
        var subpR = bpS/ps;
        // var unit_price = solve/ps;
        // var subp = unit_price*su;
        document.getElementById('bp').value = (bpS).toFixed(2);
        document.getElementById('sup').value = (supR).toFixed(2);
        // document.getElementById('result').value = (solve+vat).toFixed(2);
        // document.getElementById('unit_price').value = unit_price.toFixed(2);
        document.getElementById('subp').value = (subpR).toFixed(2);
        document.getElementById('ssResult').value = (ssResult).toFixed(0);
    }

    //function for displaying values
    // function dis(val)
    // {
    // document.getElementById("edu").value+=val
    //  }
    // //function for evaluation
    // function solve()
    // {
    // let x = document.getElementById("edu").value
    // let y = eval(x)
    // document.getElementById("edu").value = y
    // }
    // //function for clearing the display
    // function clr()
    // {
    // document.getElementById("edu").value = ""
    // }

    </script>



@endsection
