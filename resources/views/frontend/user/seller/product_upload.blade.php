
@extends('frontend.layouts.user_panel')

@section('panel_content')
<link rel="stylesheet" href="{{ asset('assets/css/update_product.css') }}">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">

<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-center p-2">
            @error('company_id')
            <div class="alert alert-danger alert-dismissible fade show p-1 py-3" role="alert">
                {{ $message }}.
               <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                 <span aria-hidden="true">&times;</span>
               </button>
             </div>
             @enderror
            @error('company_discount')
            <div class="alert alert-danger alert-dismissible fade show p-1 py-3" role="alert">
                {{ $message }}.
               <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                 <span aria-hidden="true">&times;</span>
               </button>
             </div>
             @enderror
            <div class="card px-2  mt-3 mb-3">

                <h2 class="mt-3 h5 bold" id="heading">Step 1</h2>
                <p>Select Company & Discount</p>
                <div id="msform">
                    <!-- progressbar -->
                    <ul style="padding: 0;
                    list-style-type: none;" id="progressbar">
                        <li class="active" id="account"><strong >Company</strong></li>
                        <li  id="personal"><strong >Product</strong></li>

                    </ul>
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                    </div> <br> <!-- fieldsets -->
                    <fieldset>
                        <form action="{{ route('company.store') }}" method="post">
                            @csrf
                        <div class="form-card">

                            </div>
                            {{-- \App\SellerProduct::where('company_id', $request->company_id)->first()->company_id --}}
                             <label class="col-md-3  col-from-label  text-left">{{translate('Company')}}</label>
                             <div class="col-md-12 mb-2">
                                 <select class="form-control  aiz-selectpicker" name="company_id" id="company_id"
                                     data-live-search="true" data-toggle="dropdown">
                                     <option value="">{{ translate('Select Company') }}</option>
                                     @foreach (\App\Brand::where('id','!=',0)->get() as $brand)
                                     <option value="{{ $brand->id }}">{{ $brand->getTranslation('name') }}</option>
                                     @endforeach
                                 </select>
                             </div>
                             <label class="col-md-12 col-from-label text-left">{{translate('Discount For Selected Company')}} <span class="text-danger">*</span></label>
                <div class="d-flex">

                <div class="col-md-4">
                    <input type="number" lang="en" min="0" value="0" step="0.01" placeholder="{{ translate('Discount') }}" name="company_discount" class="rounded border-primary form-control">
                </div>
                <div class="col-md-2">
                    <select class="form-control aiz-selectpicker" name="discount_type">
                        {{-- <option value="amount">{{translate('Flat Rate')}}</option> --}}
                        <option selected value="percent">{{translate('Percent')}}</option>
                    </select>
                </div>
                </div>


                        </div>
                        <button type="submit" class="next btn-primary btn-md action-button">Next</button>
                    </form>
                    </fieldset>

                </div>
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
