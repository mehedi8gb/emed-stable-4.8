@extends('frontend.layouts.app')

@section('content')
{{-- <!-- Special version of Bootstrap that only affects content wrapped in .bootstrap-iso -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!--Font Awesome (added because you use icons in your prepend/append)-->
<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />

<!-- Inline CSS based on choices in "Settings" tab -->
<style>.bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p, .bootstrap-iso form{font-family: Arial, Helvetica, sans-serif; color: black}.bootstrap-iso form button, .bootstrap-iso form button:hover{color: white !important;} .asteriskField{color: red;}</style> --}}
<div class="container">
<div class="row">
    <div class="col-lg-10 mx-auto">
        <div class="card-body ">
            <div class="card-header">
                <h4 class="mb-0 h5" align="center">{!! translate('Job Application Form <br> Step 2') !!} </strong><h4>

            </div>
            <div class="card border-white">
                @if ($errors->any())
                @foreach ($errors->all() as $error)
                    <div class="alert alert-danger">{{$error}}</div>
                @endforeach
            @endif
            </div>
            <div style="padding: 0px !important" class="card-body fs-11 text-uppercase">


<hr>

<div class="card">
    <div class="card-header">
        <h5 class="mb-0 h6">{{ translate('Educational Status')}}</h5>
    </div>
    <div   class="card-body ">
        <div class="row justify-content-center gutters-10">
            @if ($education->count())
            @foreach ($education as $key => $address)
                <div class="col-lg-6 ">
                    <div class="border p-3 pr-5 rounded mb-3 card position-relative">
                        <div>
                            <span class=" fw-600">{{ translate('Degree') }}:</span>
                            <span class="ml-2"> {{ $address->degree }}</span>
                        </div>
                        <div>
                            <span class="w-50 fw-600">{{ translate('Institute') }}:</span>
                            <span class="ml-2">{{ $address->institute }}</span>
                        </div>
                        <div>
                            <span class="w-50 fw-600">{{ translate('Board') }}:</span>
                            <span class="ml-2">{{ $address->board }}</span>
                        </div>
                        <div>
                            <span class="w-50 fw-600">{{ translate('Roll') }}:</span>
                            <span class="ml-2">{{ $address->roll }}</span>
                        </div>
                        <div>
                            <span class="w-50 fw-600">{{ translate('Subject') }}:</span>
                            <span class="ml-2">{{ $address->subject }}</span>
                        </div>
                        <div>
                            <span class="w-50 fw-600">{{ translate('Passing Year') }}:</span>
                            <span class="ml-2">{{ $address->passing_year }}</span>
                        </div>
                        <div>
                            <span class="w-50 fw-600">{{ translate('Result') }}:</span>
                            <span class="ml-2">{{ $address->result }}</span>
                        </div>
                        @if ($address->set_default)
                            <div class="position-absolute right-0 bottom-0 pr-2 pb-3">
                                <span class="badge badge-inline fs-11 badge-lg badge-primary">{{ translate('Present') }}</span>
                            </div>
                        @endif
                        <div class="dropdown position-absolute right-0 top-0">
                            <button class="btn bg-gray px-2" type="button" data-toggle="dropdown">
                                <i class="la la-ellipsis-v"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                                {{-- <a class="dropdown-item" onclick="edit_address('{{$address->id}}')">
                                    {{ translate('Edit') }}
                                </a> --}}
                                {{-- <a class="dropdown-item" onclick="edit_address('{{$address->id}}')">
                                    {{ translate('Edit') }}
                                </a> --}}
                                @if (!$address->set_default)
                                    <a class="dropdown-item" href="{{ route('education.set_default', $address->id) }}">{{ translate('Make This Present') }}</a>
                                @endif
                                <a class="dropdown-item" href="{{ route('education.destroy', $address->id) }}">{{ translate('Delete') }}</a>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
            @else
            <div class="col-lg-10   text-center">
                <div class="border p-3 pr-5 rounded mb-3 card position-relative">
                You have to add educational status otherwise your application will not complete.
                </div>
            </div>
            @endif
            <div class="col-lg-6 mx-auto" onclick="add_new_address()">
                <div class="border p-3 rounded mb-3 c-pointer text-center bg-light">
                    <i class="la la-plus la-2x"></i>
                    <div class="alpha-7">{{ translate('Add educational Qualification ') }}</div>
                </div>
            </div>
        </div>
<hr>
    </div>

</div>

<div class="card">
<div class="card-header">
    <h5 class="mb-0 h6">{{ translate('Experience')}}</h5>
</div>
    <div class="card-body">
        <div class="row justify-content-center gutters-10">
            {{-- @foreach ($last as $itm )
            <input type="text" id="id" name="user_id" value="{{($itm->id+1)}}" class="form-control" >
            @break
            @endforeach --}}
        @if ($exp->count())
        @foreach ($exp as $key => $address)




        <div class="col-lg-6">
            <div class="border p-3 pr-5 fs-11 text-uppercase rounded mb-3 position-relative">
                <div>
                    <span class="w-50 fw-600">{{ translate('Organization') }}:</span>
                    <span class="ml-2">{{ $address->organization }}</span>

                </div>

                <div>
                    <span class="w-50 fw-600">{{ translate('Designation') }}:</span>
                    <span class="ml-2">{{ $address->designation }}</span>
                </div>

                <div>
                    <span class=" fw-600">{{ translate('Description') }}:</span>
                    {{-- <input type="text" class="form-control m-0" disabled value=""> --}}
                    <span class="ml-2">{{ $address->description }}</span>
                </div>
                <div>
                    <span class="w-50 fw-600">{{ translate('Employment period') }}:</span>
                    <span class="ml-2">{{ \carbon\carbon::parse($address->employment_period_end)->format('d M Y')  }} to {{ \carbon\carbon::parse($address->employment_period_end)->format('d M Y') }}</span>
                </div>

                @if ($address->set_default)
                    <div class="position-absolute right-0 bottom-0 pr-2 pb-3">
                        <span class="badge badge-inline badge-lg fs-11 badge-primary">{{ translate('Present') }}</span>
                    </div>
                @endif
                <div class="dropdown position-absolute right-0 top-0">
                    <button class="btn bg-gray px-2" type="button" data-toggle="dropdown">
                        <i class="la la-ellipsis-v"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">

                        @if (!$address->set_default)
                            <a class="dropdown-item" href="{{ route('experience.set_default', $address->id) }}">{{ translate('Make This Present') }}</a>
                        @endif
                        <a class="dropdown-item" href="{{ route('experience.destroy', $address->id) }}">{{ translate('Delete') }}</a>
                    </div>
                </div>
            </div>
        </div>

    @endforeach
        @else
        <div class="col-lg-11 text-center">
            <div class="border p-3 pr-5 rounded mb-3 position-relative">

            You have to add experience otherwise your application will not complete.
            </div>
        </div>

        @endif

            <div class="col-lg-6 mx-auto" onclick="add_new_exp()">
                <div class="border p-3 rounded mb-3 c-pointer text-center bg-light">
                    <i class="la la-plus la-2x"></i>
                    <div class="alpha-7">{{ translate('Add Experience Qualification ') }}</div>
                </div>
            </div>
        </div>
<hr>
    </div>
</div>

{{-- education modal  --}}

@section('modal')
    <div class="modal fade" id="new-address-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content fs-11 text-uppercase">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">{{ translate('Add educational Qualification') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <form class="form-default" role="form" action="{{ route('education.store') }}" method="POST">
                    @csrf
                    <div class="modal-body " >
                        <div class="p-3">
                            <div class="row">
                                <label class="col-md-12 col-form-label fw-700">{{ translate('Degree:') }}</label>
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <select class="form-control aiz-selectpicker" data-live-search="true" data-placeholder="{{translate('Select your Degree')}}" name="degree">
                                            <option value="" disabled selected>Select Degree</option>

                                                <option value="Secondary School Certificate">Secondary School Certificate</option>
                                                <option value="Higher Secondary School Certificate">Higher Secondary School Certificate</option>
                                                <option value="Diploma">Diploma</option>
                                                <option value="Honor’s">Honor’s</option>
                                                <option value="Degree">Degree</option>
                                                <option value="Master’s">Master’s</option>

                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-md-12 col-form-label fw-700">{{ translate('Institute:') }}</label>
                                <div class="col-md-12">
                                    <textarea class="form-control  mb-3" placeholder="{{ translate('Your Institute') }}" rows="1" name="institute"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-md-12 col-form-label  fw-700">{{ translate('Board:') }}</label>
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <select class="form-control aiz-selectpicker" data-live-search="true" data-placeholder="{{translate('Select your Board')}}" name="board">
                                            <option value="" disabled selected>Select Board</option>

                                                <option value="Barishal">Barishal</option>
                                                <option value="Comilla">Comilla</option>
                                                <option value="Chittagong">Chittagong</option>
                                                <option value="Dhaka ">Dhaka</option>
                                                <option value="Khulna">Khulna</option>
                                                <option value="Rajshahi">Rajshahi</option>
                                                <option value="Rangpur">Rangpur</option>
                                                <option value="Sylhet">Sylhet</option>

                                                <option value="Madrasha">Madrasha</option>

                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <label class=" fw-700">{{ translate('Roll:')}}</label>
                                </div>
                                <div class="col-md-12">
                                    <input type="text" class="form-control mb-3" placeholder="{{ translate('Type Your Roll')}}" name="roll" >
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label class=" fw-700">{{ translate('Subject:')}}</label>
                                </div>
                                <div class="col-md-12">
                                    <input type="text" class="form-control mb-3" placeholder="{{ translate('Type Your Subject')}}" name="subject" value="" >
                                </div>
                            </div>

                            <div class="row">
                                <label class="col-md-12 col-form-label fw-700">{{ translate('Passing Year:') }}</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control mb-3" placeholder="{{ translate('Type Your Passing Year')}}" name="passing_year" value="" >
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-md-12 col-form-label fw-700">{{ translate('Result:') }}</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control mb-3" placeholder="{{ translate('Enter Your Result')}}" name="result" value="" >
                                </div>
                            </div>
                            <div class="form-group text-right">
                                <button type="submit" class="btn btn-sm btn-primary">{{translate('Save')}}</button>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <div class="modal fade" id="edit-address-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">{{ translate('Educational Status') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body" id="edit_modal_body">


                </div>
            </div>
        </div>
    </div>




</div>
{{-- experience modal--}}

<div class="modal fade" id="new-exp-modal" tabindex="-1" role="dialog" aria-labelledby="expModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content fs-11 text-uppercase">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">{{ translate('Add Experience') }}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
            </div>
            <form class="form-default" role="form" action="{{ route('experience.store') }}" method="POST">
                @csrf
                <div class="modal-body " >
                    <div class="p-3">
                        <div class="row">
                            <label class="col-md-12 col-form-label fw-700">{{ translate('Organization:') }}</label>
                            <div class="col-md-12">
                                <div class="mb-3">
                                 <input class="form-control  mb-3" type="text" placeholder="{{ translate('Organization') }}" name="organization">
                                </div>
                            </div>
                        </div>



                        <div class="form-group row ">
                            <label class="col-sm-12 control-label  fw-700" for="start_date">{{translate('Employment Period')}}</label>
                            <div class="col-sm-5 col-5">
<input type="text" class="form-control " id="datepicker" name="employment_period_start" placeholder="Start Date" data-time-picker="true" data-format="DD-MM-Y" data-separator=" to " autocomplete="off">

                            </div>
                            <span class="mt-2  fw-700">To</span>
                            <div class="col-sm-5 col-5">
<input type="text" class="form-control " id="datepicker" name="employment_period_end" placeholder="End Date" data-time-picker="true" data-format="DD-MM-Y" data-separator=" to " autocomplete="off">

                            </div>

                        </div>

                        <div class="row">
                            <label class="col-md-12 col-form-label  fw-700">{{ translate('Designation:') }}</label>
                            <div class="col-md-12">
                                <input class="form-control  mb-3" type="text" placeholder="{{ translate('Your Designation') }}" name="designation">
                            </div>

                        </div>
                        <div class="row">
                            <label class="col-md-12  fw-700 col-form-label">{{ translate('Description:') }}</label>
                            <div class="col-md-12">
                               <textarea class="form-control" name="description" id="description" cols="30" rows="10" placeholder="Add short description"></textarea>
                               @error('description')
                               <div class="alert alert-danger">{{ $message }}</div>
                               @enderror
                            </div>

                        </div>

                        <div class="form-group text-right">
                            <button type="submit" class="btn btn-sm btn-primary">{{translate('Save')}}</button>
                        </div>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>


<div class="modal fade" id="edit-address-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">{{ translate('Educational Status') }}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body" id="edit_modal_body">


            </div>
        </div>
    </div>
</div>
@endsection
</div>
</div>
@section('script')

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<script>
$(document).ready(function(){
var date_input=$('input[id="datepicker"]'); //our date input has the name "date"
var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
date_input.datepicker({

format: 'yyyy-mm-dd',

container: container,
todayHighlight: true,
autoclose: true,
})
})

$(document).ready(function(){
$("#hide").click(function(){
$(".data").hide();
});
$("#show").click(function(){
$(".data").show();
});
});



tinymce.init({
selector: '.textarea',
plugins: 'advlist autolink lists link image charmap print preview hr anchor pagebreak',
toolbar_mode: 'floating',
});

function add_new_address(){
$('#new-address-modal').modal('show');
}

function add_new_exp(){
$('#new-exp-modal').modal('show');
}



function edit_address(address) {
var url = '{{ route("education.edit", ":id") }}';
url = url.replace(':id', address);

$.ajax({
headers: {
    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
},
url: url,
type: 'GET',
success: function (response) {
    $('#edit_modal_body').html(response);
    $('#edit-address-modal').modal('show');
    AIZ.plugins.bootstrapSelect('refresh');
    var country = $("#edit_country").val();
    get_city(country);
}
});
}

$(document).on('change', '[name=country]', function() {
var country = $(this).val();
get_city(country);
});

function get_city(country) {
$('[name="city"]').html("");
$.ajax({
headers: {
    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
},
url: "{{route('get-city')}}",
type: 'POST',
data: {
    country_name: country
},
success: function (response) {
    var obj = JSON.parse(response);
    if(obj != '') {
        $('[name="city"]').html(obj);
        AIZ.plugins.bootstrapSelect('refresh');
    }
}
});
}
</script>
@endsection







<script type="text/javascript">
    function add_new_address(){
        $('#new-address-modal').modal('show');
    }



    function edit_address(address) {
        var url = '{{ route("education.edit", ":id") }}';
        url = url.replace(':id', address);

        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url: url,
            type: 'GET',
            success: function (response) {
                $('#edit_modal_body').html(response);
                $('#edit-address-modal').modal('show');
                AIZ.plugins.bootstrapSelect('refresh');
                var country = $("#edit_country").val();
                get_city(country);
            }
        });
    }

    $(document).on('change', '[name=country]', function() {
        var country = $(this).val();
        get_city(country);
    });

    function get_city(country) {
        $('[name="city"]').html("");
        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url: "{{route('get-city')}}",
            type: 'POST',
            data: {
                country_name: country
            },
            success: function (response) {
                var obj = JSON.parse(response);
                if(obj != '') {
                    $('[name="city"]').html(obj);
                    AIZ.plugins.bootstrapSelect('refresh');
                }
            }
        });
    }
</script>

                    <div class="form-group mb-0 text-right">
                      {{-- @if (Auth::user()->id == $education->user_id) --}}

                        @php $item = App\JobApplication::where('user_id', Auth::user()->id)->latest()->first(); @endphp

                        <form action="{{route('mail.application')}}" method="post">
                            @csrf
                            <input type="hidden" name="job_title" value="{{$item->job_title}}">
                            <input type="hidden" name="id" value="{{$item->id}}">
                            <input type="hidden" name="circuler_id" value="{{$item->circuler_id}}">
                            <input type="hidden" name="email" value="{{$item->email}}">
                           <div class="col-12 col-md-3  float-right my-4">
                            <button type="submit"  class="btn mb-3 btn-block btn-primary">
                                {{translate('Finish')}}
                            </button>
                           </div>
                        </form>

                    </div>
                </div>
</div>
            {{-- </div>
        </div>
    </div>
</div> --}}
@endsection
