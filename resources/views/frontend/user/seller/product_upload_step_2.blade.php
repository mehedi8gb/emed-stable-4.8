
@extends('frontend.layouts.user_panel')

@section('panel_content')
<link rel="stylesheet" href="{{ asset('assets/css/update_product.css') }}">

<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-center p-2">
            <div class="card px-2   mt-3 mb-3">
                <h2 id="heading">Step 1</h2>
                <p>Select Company</p>
                <div id="msform">
                    <!-- progressbar -->
                    <ul id="progressbar">
                        <li id="account"><strong>Account</strong></li>
                        <li class="active"  id="personal"><strong>Personal</strong></li>

                    </ul>
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 100%;" aria-valuemin="0" width="100%" aria-valuemax="100"></div>
                    </div> <br> <!-- fieldsets -->

                    <fieldset>







                        <div class="form-card">
                            <div class="row">
                                <div class="col-7">
                                    <h2 class="fs-title">Product Information:</h2>
                                </div>
                                <div class="col-5">
                                    <h2 class="steps">Step 2</h2>
                                </div>



<div class="container">
    <div class="aiz-titlebar mt-2 mb-4">
        <div class="row align-items-center">
            <div class="col-md-6">
                <h1 class="h3">{{ translate('Update Your Product list') }}</h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-lg-4">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0 h6">{{translate('Low Stock Quantity Warning')}}</h5>
                    </div>
                    <div class="card-body">
                        <div class="form-group mb-3">

                            <input type="number" name="low_stock_quantity" value="1" min="0" step="1" class="form-control">
                        </div>
                    </div>
                </div>
        </div>

        <div class="col-md-4 col-lg-4">

            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0 h6">{{translate('Cash On Delivery')}}</h5>
                </div>
                <div class="card-body">
                    @if (get_setting('cash_payment') == '1')
                    <div class="form-group row">
                        <label class="col-md-6 col-from-label">{{translate('Status')}}</label>
                        <div class="col-md-6 pb-3">
                            <label class="aiz-switch aiz-switch-success mb-0">
                                <input type="checkbox" name="cash_on_delivery" value="1" checked="">
                                <span></span>
                            </label>
                        </div>
                    </div>
                    @else
                    <p>
                        {{ translate('Cash On Delivery activation is maintained by Admin.') }}
                    </p>
                    @endif
                </div>
            </div>
        </div>

        <div class="col-md-4 col-lg-4">
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0 h6">{{translate('Estimate Shipping Time')}}</h5>
                </div>
                <div class="card-body">
                    <div class="form-group mb-3">

                        <div class="input-group">
                            <input type="number" class="form-control" name="est_shipping_days" min="1" step="1"
                                placeholder="Shipping Days">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroupPrepend">Days</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

        <div class="row gutters-5">
            <div class="col-lg-12">

                <input type="hidden" name="added_by" value="seller">
                <div class="card">

                    <div class="card-body">

                        <div class="form-group row">
                          <div class="card col-md-12">
                              <div class="card-body">



                                        <div class="card-body">
                                            <table class="fs-11 table aiz-table mb-0">
                                                <thead>
                                                    <tr>
                                                        <th data-breakpoints="lg">#</th>
                                                        <th>
                                                            <div class="form-group">
                                                                <div class="aiz-checkbox-inline">
                                                                    <label class="aiz-checkbox">
                                                                        <input type="checkbox" class="check-all">
                                                                        <span class="aiz-square-check"></span>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </th>

                                                        <th data-breakpoints="sm">{{translate('Name + Generic')}}</th>
                                                        <th data-breakpoints="sm">{{translate('Dosage Form')}}</th>
                                                        <th data-breakpoints="sm">{{translate('Num of Sale')}}</th>
                                                        <th data-breakpoints="md">{{translate('MRP')}}</th>
                                                        <th data-breakpoints="md">{{translate('Your Price')}}</th>
                                                        <th data-breakpoints="sm">{{translate('Stock Quantity')}}</th>
                                                        <th data-breakpoints="md">{{translate('Add Quantity')}}</th>


                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @php
                                                        $keys = 1;
                                                    @endphp
                                                    @foreach($products as $key => $product)
                                                    <tr>

                                                        <td id="count">{{$keys++}}</td>
                                                        <td id="checkbox">
                                                            <div class="form-group d-inline-block">
                                                                <label class="aiz-checkbox">
                                                                    <input type="checkbox" class="check-one" name="id[]" value="{{$product->id}}">
                                                                    <span class="aiz-square-check"></span>
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td id="Name Generic">

                                                                    <b class="text-truncate-2">{{ $product->getTranslation('name') }}</b><br>
                                                                    <a href="{{url('generic', $product->generic->slug).'/'.$product->generic->id}}" target="_blank" rel="noopener noreferrer"> {{ $product->generic->name }}</a>

                                                        </td>
                                                            <td id="Dosage Form">
                                                                <span >
                                                                    <img style="    height: 25px;
                                                                    width: 25px;" class="avatar avatar-square avatar-xs" src="{{ uploaded_asset($product->minor->icon) }}" alt="{{translate('icon')}}">&nbsp;
                                                                    {{$product->minor->name}}
                                                                </span>
                                                            </td>
                                                        <td id="Number Of Sale">
                                                            {{ $product->num_of_sale }} {{translate('times')}} <br>
                                                        </td>

                                                        <td id="MRP">

                                                             {{$product->selling_unit_price}}
                                                        </td>


                                                        <td id="your price">

                                                          @if ($company->discount_type == 'percent')
                                                          {{$product->selling_unit_price - ($company->company_discount/100)*$product->selling_unit_price}}
                                                          @else
                                                          {{$product->selling_unit_price - $company->company_discount}}
                                                          @endif
                                                        </td>

                                                        <td id="stock quantity">

                                                            @php
                                                            $qty = 0;
                                                            if($product->variant_product) {
                                                                foreach ($product->stocks as $key => $stock) {
                                                                    $qty += $stock->qty;
                                                                    echo $stock->variant.' - '.$stock->qty.'<br>';
                                                                }
                                                            }
                                                            else {
                                                                //$qty = $product->current_stock;
                                                                $qty = optional($product->stocks->first())->qty;
                                                                echo $qty;
                                                            }
                                                        @endphp
                                                        @if($qty <= $product->low_stock_quantity)
                                                            <span class="badge badge-inline badge-danger">Low</span>
                                                        @endif
                                                        </td>
    <td id="Add Quantity">

        <input style="width: 69px;" class="form-control form-control-sm" type="text" name="add_qty" onkeyup="makeSlug{{ $product->id }}(this.value)"  id="add_qty{{ $product->id }}">
    </td>


                                                    </tr>

                                                    @endforeach
                                                </tbody>
                                            </table>

                                        </div>


                              </div>
                          </div>
                        </div>

                    </div>
                </div>


            </div>



        </div>

    </div>
</div>




                        </div>
                        <form action="{{route('seller.products.add')}}" method="POST">
                            @csrf
                            <input  type="hidden" name="id" value="{{ $company->id }}" >
                            @foreach($products as $key => $product)
                            <input  type="hidden" name="product_id" value="{{ $product->id }}" >
                            <input  type="hidden" name="qty" id="qty{{ $product->id }}" >
                            <script>
                               function makeSlug{{ $product->id }}(val) {
                                    let str = val;
                                    let output = str.replace(/\s+/g, '-').toLowerCase();
                                    $('#qty{{ $product->id }}').val(output);
                                }
                            </script>
                            @endforeach
                            <input type="submit" name="next" class="next action-button" value="Finish" />
                        </form>


                    </fieldset>

                </form>
            </div>
        </div>
    </div>
</div>



@endsection

@section('script')

<script type="text/javascript">

    $(document).on("change", ".check-all", function() {
        if(this.checked) {
            // Iterate each checkbox
            $('.check-one:checkbox').each(function() {
                this.checked = true;
            });
        } else {
            $('.check-one:checkbox').each(function() {
                this.checked = false;
            });
        }

    });

    $(document).ready(function(){
        //$('#container').removeClass('mainnav-lg').addClass('mainnav-sm');
    });

    function update_todays_deal(el){
        if(el.checked){
            var status = 1;
        }
        else{
            var status = 0;
        }
        $.post('{{ route('products.todays_deal') }}', {_token:'{{ csrf_token() }}', id:el.value, status:status}, function(data){
            if(data == 1){
                AIZ.plugins.notify('success', '{{ translate('Todays Deal updated successfully') }}');
            }
            else{
                AIZ.plugins.notify('danger', '{{ translate('Something went wrong') }}');
            }
        });
    }

    function update_published(el){
        if(el.checked){
            var status = 1;
        }
        else{
            var status = 0;
        }
        $.post('{{ route('products.published') }}', {_token:'{{ csrf_token() }}', id:el.value, status:status}, function(data){
            if(data == 1){
                AIZ.plugins.notify('success', '{{ translate('Published products updated successfully') }}');
            }
            else{
                AIZ.plugins.notify('danger', '{{ translate('Something went wrong') }}');
            }
        });
    }

    function update_featured(el){
        if(el.checked){
            var status = 1;
        }
        else{
            var status = 0;
        }
        $.post('{{ route('products.featured') }}', {_token:'{{ csrf_token() }}', id:el.value, status:status}, function(data){
            if(data == 1){
                AIZ.plugins.notify('success', '{{ translate('Featured products updated successfully') }}');
            }
            else{
                AIZ.plugins.notify('danger', '{{ translate('Something went wrong') }}');
            }
        });
    }

    function sort_products(el){
        $('#sort_products').submit();
    }

    function bulk_delete() {
        var data = new FormData($('#sort_products')[0]);
        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url: "{{route('bulk-product-delete')}}",
            type: 'POST',
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            success: function (response) {
                if(response == 1) {
                    location.reload();
                }
            }
        });
    }


    $("[name=shipping_type]").on("change", function (){
            $(".product_wise_shipping_div").hide();
            $(".flat_rate_shipping_div").hide();
            if($(this).val() == 'product_wise'){
                $(".product_wise_shipping_div").show();
            }
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
            if(!$('input[name="colors_active"]').is(':checked')){
                $('#colors').prop('disabled', true);
                AIZ.plugins.bootstrapSelect('refresh');
            }
            else{
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
               success: function(data){
                   $('#sku_combination').html(data);
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










        $(document).ready(function(){

var current_fs, next_fs, previous_fs; //fieldsets
var opacity;
var current = 1;
var steps = $("fieldset").length;

setProgressBar(current);

$(".next").click(function(){

current_fs = $(this).parent();
next_fs = $(this).parent().next();

//Add Class Active
$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

//show the next fieldset
next_fs.show();
//hide the current fieldset with style
current_fs.animate({opacity: 0}, {
step: function(now) {
// for making fielset appear animation
opacity = 1 - now;

current_fs.css({
'display': 'none',
'position': 'relative'
});
next_fs.css({'opacity': opacity});
},
duration: 500
});
setProgressBar(++current);
});

$(".previous").click(function(){

current_fs = $(this).parent();
previous_fs = $(this).parent().prev();

//Remove class active
$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

//show the previous fieldset
previous_fs.show();

//hide the current fieldset with style
current_fs.animate({opacity: 0}, {
step: function(now) {
// for making fielset appear animation
opacity = 1 - now;

current_fs.css({
'display': 'none',
'position': 'relative'
});
previous_fs.css({'opacity': opacity});
},
duration: 500
});
setProgressBar(--current);
});

function setProgressBar(curStep){
var percent = parseFloat(100 / steps) * curStep;
percent = percent.toFixed();
$(".progress-bar")
.css("width",percent+"%")
}

$(".submit").click(function(){
return false;
})

});
</script>
@endsection
