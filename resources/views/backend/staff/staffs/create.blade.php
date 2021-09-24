@extends('backend.layouts.app')

@section('content')
<script src="https://cdn.tiny.cloud/1/qa89kfyojc6mam94pyc8rmg1wfitpjdabx5dd7pd14hwwmap/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<div class="row">
    <div class="col-lg-12 mx-auto">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0 h6">{{translate('Staff Information')}}</h5>
            </div>
<div class="m-2">
    <button id="show" class=" btn btn-primary">Doctor</button> &nbsp;
    <button id="hide"  class="btn btn-primary">Staff</button>
</div>
            <form class="form-horizontal" action="{{ route('staffs.store') }}" method="POST" enctype="multipart/form-data">
            	@csrf
                <div class="card-body">
                    {{-- @error('employment_period')
                    <div class="alert alert-danger">{{ $message }}</div>
                @enderror --}}
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="name">{{translate('Name')}}</label>
                        <div class="col-sm-9">
                            <input type="text" placeholder="{{translate('Name')}}" id="name" name="name" class="form-control" >
                        </div>
                    </div>


                    <div class="form-group row">
                        <label class="col-md-3 col-form-label" for="signinSrEmail">{{translate('Avatar')}} <small>(90x90)</small></label>
                        <div class="col-md-9">
                            <div class="input-group" data-toggle="aizuploader" data-type="image">
                                <div class="input-group-prepend">
                                    <div class="input-group-text bg-soft-secondary font-weight-medium">{{ translate('Browse')}}</div>
                                </div>
                                <div class="form-control file-amount">{{ translate('Choose File') }}</div>
                                <input type="hidden" name="avatar" class="selected-files" value="{{ Auth::user()->avatar_original }}">
                            </div>
                            <div class="file-preview box sm">
                            </div>
                        </div>
                    </div>


                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="email">{{translate('Email')}}</label>
                        <div class="col-sm-9">
                            <input type="text" placeholder="{{translate('Email')}}" id="email" name="email" class="form-control" >
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="mobile">{{translate('Phone')}}</label>
                        <div class="col-sm-9">
                            <input type="text" placeholder="{{translate('Phone')}}" id="mobile" name="mobile" class="form-control" >
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="mobile">{{translate('Gender')}}</label>
                        <div class="col-sm-9">
                            <select name="gender"  class="form-control aiz-selectpicker">

                                    <option value="0">Male</option>
                                    <option value="1">Female</option>
                           </select>
                        </div>
                    </div>

<div class="data">

    <div class="form-group row">
        <label class="col-sm-3 col-from-label" for="name">{{translate('Consultution Fee')}}</label>
        <div class="col-sm-3">
            <input type="text" placeholder="{{translate('')}}" id="name" name="consultution_fee" class="form-control" >
        </div>

        <label class="col-sm-2 col-from-label" for="name">{{translate('BMDC Number')}}</label>
        <div class="col-sm-3">
            <input type="text" placeholder="{{translate('')}}" id="name" name="bmdc_number" class="form-control" >
        </div>
    </div>


    <div class="form-group row">
        <label class="col-sm-3 col-from-label" for="name">{{translate('Qualifications')}}</label>
        <div class="col-sm-9">
            <input type="text" placeholder="{{translate('')}}" id="name" name="qualifications" class="form-control" >
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-3 col-from-label" for="name">{{translate('Depertment')}}</label>
        <div class="col-sm-9">
            <input type="text" placeholder="{{translate('')}}" id="name" name="depertment" class="form-control" >
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-3 col-from-label" for="name">{{translate('Working in')}}</label>
        <div class="col-sm-9">
            <input type="text" placeholder="{{translate('')}}" id="name" name="working_id" class="form-control" >
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-3 col-from-label" for="name">{{translate('Experience')}}</label>
        <div class="col-sm-9">
            <input type="text" placeholder="{{translate('')}}" id="name" name="experience" class="form-control" >
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-3 col-from-label" for="name">{{translate('Availvility')}}</label>
        <div class="col-sm-9">
            <input type="text" placeholder="{{translate('')}}" id="name" name="availvility" class="form-control" >
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-3 col-from-label" for="name">{{translate('Follow up fee')}}</label>
        <div class="col-sm-9">
            <input type="text" placeholder="{{translate('')}}" id="name" name="follow_up_fee" class="form-control" >
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-3 col-from-label" for="name">{{translate('Consulttion Time ')}}</label>
        <div class="col-sm-9">
            <input type="text" placeholder="{{translate('')}}" id="name" name="consultation_time" class="form-control" >
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-3 col-from-label" for="name">{{translate('Doctor Code')}}</label>
        <div class="col-sm-9">
            <input type="text" placeholder="{{translate('')}}" id="name" name="doctor_code" class="form-control" >
        </div>
    </div>

    <div class="form-group row">
        <label class="col-md-3 col-from-label">
            {{translate('Doctor Description:')}}
            <span class="text-danger">*</span>
        </label>
        <div class="col-md-9">
            <textarea class="textarea" name="doctor_description" >{{old('doctor_description')}}</textarea>
            {{-- @error('description')
     <div class="alert alert-danger">{{ $message }}</div>
                @enderror --}}
        </div>
    </div>


    {{-- <div class="form-group row">
        <label class="col-sm-3 col-from-label" for="name">{{translate('Availvility')}}</label>
        <div class="col-sm-9">
            <input type="text" placeholder="{{translate('Name')}}" id="name" name="availvility" class="form-control" >
        </div>
    </div>
 --}}




</div>




{{--
                    <p id="show">doctor</p>
                    <p >Click me away!</p>
                    <p class="data">Click me too!</p> --}}

                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="password">{{translate('Password')}}</label>
                        <div class="col-sm-9">
                            <input type="password" placeholder="{{translate('Password')}}" id="password" name="password" class="form-control" >
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="name">{{translate('Role')}}</label>
                        <div class="col-sm-9">
                            <select name="role_id"  class="form-control aiz-selectpicker">
                                @foreach($roles as $role)
                                    <option id="{{ $role->id == 3 ? "show":"hide" }}" value="{{$role->id}}">{{$role->getTranslation('name')}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group mb-0 text-right">
                        <button type="submit" class="btn btn-sm btn-primary">{{translate('Save')}}</button>
                    </div>
                </div>
            </form>




        </div>
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0 h6">{{ translate('Educational Status')}}</h5>
            </div>
            <div class="card-body">
                <div class="row gutters-10">
                    {{-- @foreach ($last as $itm )
                    <input type="text" id="id" name="user_id" value="{{($itm->id+1)}}" class="form-control" >
                    @break
                    @endforeach --}}
                    @foreach ($edu as $key => $address)

                    {{-- @if ($address->user->id == $edu->id) --}}


                        <div class="col-lg-6">
                            <div class="border p-3 pr-5 rounded mb-3 position-relative">
                                <div>
                                    <span class="w-50 fw-600">{{ translate('Degree') }}:</span>
                                    <span class="ml-2">{{ $address->degree }}</span>
                                </div>
                                <div>
                                    <span class="w-50 fw-600">{{ translate('Institute') }}:</span>
                                    <span class="ml-2">{{ $address->institute }}</span>
                                </div>

                                @if ($address->set_default)
                                    <div class="position-absolute right-0 bottom-0 pr-2 pb-3">
                                        <span class="badge badge-inline badge-primary">{{ translate('Default') }}</span>
                                    </div>
                                @endif
                                <div class="dropdown position-absolute right-0 top-0">
                                    <button class="btn bg-gray px-2" type="button" data-toggle="dropdown">
                                        <i class="la la-ellipsis-v"></i>
                                    </button>
                                    {{-- <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">

                                        @if (!$address->set_default)
                                            <a class="dropdown-item" href="{{ route('education.set_default', $address->id) }}">{{ translate('Make This Default') }}</a>
                                        @endif
                                        <a class="dropdown-item" href="{{ route('education.destroy', $address->id) }}">{{ translate('Delete') }}</a>
                                    </div> --}}
                                </div>
                            </div>
                        </div>
                        {{-- @endif --}}
                    @endforeach

                    <div class="col-lg-6 mx-auto" onclick="add_new_address()">
                        <div class="border p-3 rounded mb-3 c-pointer text-center bg-light">
                            <i class="la la-plus la-2x"></i>
                            <div class="alpha-7">{{ translate('Add educational Qualification ') }}</div>
                        </div>
                    </div>
                </div>
        <hr>
            </div>




            {{-- experience  --}}


             <div class="card-body">
                <div class="row gutters-10">
                    {{-- @foreach ($last as $itm )
                    <input type="text" id="id" name="user_id" value="{{($itm->id+1)}}" class="form-control" >
                    @break
                    @endforeach --}}
                    @foreach ($exp as $key => $address)

                    {{-- @if ($address->user->id == $edu->id) --}}


                        <div class="col-lg-6">
                            <div class="border p-3 pr-5 rounded mb-3 position-relative">
                                <div>
                                    <span class="w-50 fw-600">{{ translate('hospital') }}:</span>
                                    <span class="ml-2">{{ $address->hospital }}</span>
                                </div>
                                <div>
                                    <span class="w-50 fw-600">{{ translate('designation') }}:</span>
                                    <span class="ml-2">{{ $address->designation }}</span>
                                </div>

                                <div>
                                    <span class="w-50 fw-600">{{ translate('department') }}:</span>
                                    <span class="ml-2">{{ $address->department }}</span>
                                </div>
                                <div>
                                    <span class="w-50 fw-600">{{ translate('employment period') }}:</span>
                                    <span class="ml-2">{{ $address->employment_period_start }}</span>
                                </div>

                                @if ($address->set_default)
                                    <div class="position-absolute right-0 bottom-0 pr-2 pb-3">
                                        <span class="badge badge-inline badge-primary">{{ translate('Default') }}</span>
                                    </div>
                                @endif
                                <div class="dropdown position-absolute right-0 top-0">
                                    <button class="btn bg-gray px-2" type="button" data-toggle="dropdown">
                                        <i class="la la-ellipsis-v"></i>
                                    </button>
                                    {{-- <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">

                                        @if (!$address->set_default)
                                            <a class="dropdown-item" href="{{ route('education.set_default', $address->id) }}">{{ translate('Make This Default') }}</a>
                                        @endif
                                        <a class="dropdown-item" href="{{ route('education.destroy', $address->id) }}">{{ translate('Delete') }}</a>
                                    </div> --}}
                                </div>
                            </div>
                        </div>
                        {{-- @endif --}}
                    @endforeach

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



        @section('modal')
            <div class="modal fade" id="new-address-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">{{ translate('Add educational Qualification') }}</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form class="form-default" role="form" action="{{ route('doctor.edu.add') }}" method="POST">
                            @csrf
                            <div class="modal-body " >
                                <div class="p-3">
                                    <div class="row">
                                        <label class="col-md-3 col-form-label">{{ translate('Degree:') }}</label>
                                        <div class="col-md-8">
                                            <div class="mb-3">
                                             <input class="form-control  mb-3" type="text" placeholder="{{ translate('Your Institute') }}" name="degree">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="col-md-3 col-form-label">{{ translate('Institute:') }}</label>
                                        <div class="col-md-8">
                                            <input class="form-control  mb-3" type="text" placeholder="{{ translate('Your Institute') }}" name="institute">
                                        </div>
                                        @foreach ($last as $itm )
                                        <input type="text" id="id" name="user_id" value="{{($itm->id+1)}}" class="form-control" >
                                        @break
                                        @endforeach
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


{{-- experience --}}

<div class="modal fade" id="new-exp-modal" tabindex="-1" role="dialog" aria-labelledby="expModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">{{ translate('Add Experience') }}</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form class="form-default" role="form" action="{{ route('doctor.exp.add') }}" method="POST">
                            @csrf
                            <div class="modal-body " >
                                <div class="p-3">
                                    <div class="row">
                                        <label class="col-md-3 col-form-label">{{ translate('Hospital:') }}</label>
                                        <div class="col-md-8">
                                            <div class="mb-3">
                                             <input class="form-control  mb-3" type="text" placeholder="{{ translate('Hospital') }}" name="hospital">
                                            </div>
                                        </div>
                                    </div>



                                    <div class="form-group row">
                                        <label class="col-sm-3 control-label" for="start_date">{{translate('Employment Period')}}</label>
                                        <div class="col-sm-4">
 <input type="text" class="form-control " id="datepicker" name="employment_period_start" placeholder="Select Date" data-time-picker="true" data-format="DD-MM-Y" data-separator=" to " autocomplete="off">

                                        </div>
                                        <span class="mt-2">TO</span>
                                        <div class="col-sm-4">
 <input type="text" class="form-control " id="datepicker" name="employment_period_end" placeholder="Select Date" data-time-picker="true" data-format="DD-MM-Y" data-separator=" to " autocomplete="off">

                                        </div>

                                    </div>

                                    <div class="row">
                                        <label class="col-md-3 col-form-label">{{ translate('Department:') }}</label>
                                        <div class="col-md-8">
                                            <div class="mb-3">
                                             <input class="form-control  mb-3" type="text" placeholder="{{ translate('Department') }}" name="department">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-md-3 col-form-label">{{ translate('Designation:') }}</label>
                                        <div class="col-md-8">
                                            <input class="form-control  mb-3" type="text" placeholder="{{ translate('Your Designation') }}" name="designation">
                                        </div>
                                        @foreach ($last as $itm )
                                        <input type="text" id="id" name="user_id" value="{{($itm->id+1)}}" class="form-control" >
                                        @break
                                        @endforeach
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
@endsection
