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
        <div class="card-body">
            <div class="card-header">
                <h4 class="mb-0 h5 text-center">{!! translate('Job Application Form <br> Step 1') !!}</strong><h4>
                <h6>Post: {{$job->job_title}}</h6>
                <span>Company: <span class="text-primary fw-700">{{$job->company}}</span> </span>

            </div>
            <div class="card-body">
                <form id="add_form" class="form-horizontal" action="{{ route('store.application') }}" enctype="multipart/form-data" method="POST">
                    @csrf
                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">
                            {{translate('Name:')}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-9">
                            <input type="text" placeholder="{{translate('Enter Your Full Name')}}" value="{{old('name')}}"  id="name" name="name" class="form-control">
                            @error('name')
                    <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">
                            {{translate("Father's Name:")}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-3">
                            <input type="text" placeholder="{{translate("Enter Your Father's Name")}}" value="{{old('father_name')}}"  id="father_name" name="father_name" class="form-control">
                            @error('father_name')
                    <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>

                        <label class="col-md-2 col-form-label">
                            {{translate("Mother's Name:")}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-3">
                            <input type="text" placeholder="{{translate("Enter Your Mother's Name")}}" value="{{old('mother_name')}}" id="mother_name" name="mother_name" class="form-control">
                            @error('mother_name')
                    <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">
                            {{translate("Date of Birth:")}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-3">
                         <input class="form-control" id="datepicker" name="date" value="{{old('date')}}"  placeholder="DD-MM-YYYY" type="text"/>
                         @error('date')
                    <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>

                        <label class="col-md-2 col-form-label">
                            {{translate("NID:")}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-3">
                         <input class="form-control" id="nid" name="nid" value="{{old('nid')}}"  placeholder="Enter your NID number" type="text"/>
                         @error('nid')
                    <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>



                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">
                            {{translate("About Me:")}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-9">
                            <textarea placeholder="{{translate("write about yourself in 250 word")}}" id="about" name="about" class="form-control">{{old('about')}}</textarea>
                            @error('about')
                            <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>


                    </div>


                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">
                            {{translate("Skills:")}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-9">
                                <input type="text" class="form-control aiz-tag-input" name="skill[]" value="{{old('skill[]')}}" placeholder="{{ translate('Type and hit enter to add a indicate') }}">
                                <small class="text-muted">{{translate('Type your skills indivisually by separeting comma or enter')}}</small>
                            </div>


                            @error('skill[]')
                    <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>



                    <hr>

                    <h5 class="col-md-6 form-label ">Permanent Address</h5>
                    <hr>
                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">
                            {{translate("Division:")}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-3">
                            <select class="form-control aiz-selectpicker" data-live-search="true" name="permanent_division" id="permanent_division">
                                <option selected disabled value="">Division</option>
                                @php $division =\App\Division::all(); @endphp
                                @foreach($division as $row)
                                    <option value="{{$row->id}}" {{old('permanent_division') == $row->id ? 'selected' : ''}}>{{$row->name}}</option>
                                @endforeach
                            </select>

                            @error('permanent_division')
                            <div class="alert alert-danger">{{ $message }}</div>
                                @enderror

                        </div>
                        <label class="col-md-2 col-form-label">
                            {{translate("District:")}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-3">
                            <select class="form-control aiz-selectpicker" data-live-search="true" name="permanent_district" id="permanent_district">
                                <option selected disabled value="">District</option>
                                {{-- @php $district =\App\District::all(); @endphp
                                @foreach($district as $row)
                                    <option value="{{$row->id}}" {{old('permanent_district') == $row->id ? 'selected' : ''}}>{{$row->name}}</option>
                                @endforeach --}}
                            </select>
                            @error('permanent_district')
                            <div class="alert alert-danger">{{ $message }}</div>
                                @enderror

                        </div>

                    </div>
                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">
                            {{translate("Thana/Upazilla:")}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-3">
                            <select class="form-control aiz-selectpicker" data-live-search="true" name="permanent_thana" id="permanent_thana">
                                <option selected disabled value="">Upazilla</option>
                                {{-- @php $upazila =\App\Upazila::all(); @endphp
                                @foreach($upazila as $row)
                                    <option value="{{$row->name}}" {{old('permanent_thana') == $row->name ? 'selected' : ''}}>{{$row->name}}</option>
                                @endforeach --}}
                            </select>
                            @error('permanent_thana')
                            <div class="alert alert-danger">{{ $message }}</div>
                                @enderror

                        </div>

                        <label class="col-md-2 col-form-label">
                            {{translate("Area/ Village:")}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-3">
                            <input type="text" placeholder="{{translate("")}}" value="{{old('permanent_area')}}"  id="permanent_area" name="permanent_area" class="form-control">
                            @error('permanent_area')
                            <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">
                            {{translate("Road No:")}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-3">
                            <input type="text" placeholder="{{translate("")}}" value="{{old('permanent_road')}}"  id="permanent_road" name="permanent_road" class="form-control">
                            @error('permanent_road')
                            <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                        </div>

                        <label class="col-md-2 col-form-label">
                            {{translate("House No:")}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-3">
                            <input type="text" placeholder="{{translate("")}}" value="{{old('permanent_house')}}"  id="permanent_house" name="permanent_house" class="form-control">
                            @error('permanent_house')
                            <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                        </div>

                        <label class="col-md-3 mt-3 col-form-label">
                            {{translate("Postal Code:")}}
                        </label>
                        <div class="col-md-3 mt-3">
                            <input type="text" placeholder="{{translate("Your Permanent postal code")}}" id="permanent_postal_code" name="permanent_postal_code" value="{{old('permanent_postal_code')}}"  class="form-control">
                            @error('permanent_postal_code')
                            <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                        </div>
                    </div>
                    <hr>

                    <script type="text/javascript">
                        function ShowHideDiv(chkPassport) {
                            var dvPassport = document.getElementById("dvPassport");
                            dvPassport.style.display = chkPassport.checked ? "none" : "block";
                        }
                    </script>

                    <div class="card-body md-2">
                        <h5>Present Address</h5>

                        <div class="custom-control custom-checkbox my-1 mr-sm-2">
                            <input type="checkbox" class="custom-control-input" value="1" name="same_as_permanent" onclick="ShowHideDiv(this)" id="chkPassport">
                            <label class="custom-control-label" for="chkPassport" > {{translate('same as permanent')}}</label>
                          </div>
                    </div>



<div id="dvPassport" style="display: block">

         <hr>
                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">
                            {{translate("Division:")}}

                        </label>
                        <div class="col-md-3">
                            <select class="form-control aiz-selectpicker" data-live-search="true" name="present_division" id="division">
                                <option selected disabled value="">Division</option>
                                @php $division =\App\Division::all(); @endphp
                                @foreach($division as $row)
                                    <option value="{{$row->id}}" {{old('present_division') == $row->id ? 'selected' : ''}}>{{$row->name}}</option>
                                @endforeach
                            </select>

                        </div>
                        <label class="col-md-2 col-form-label">
                            {{translate("District:")}}

                        </label>
                        <div class="col-md-3">
  <select class="form-control aiz-selectpicker" data-live-search="true" name="present_district" id="present_district">
                                <option selected disabled value="">District</option>

                            </select>

                        </div>

                    </div>
                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">
                            {{translate("Thana/Upazilla:")}}

                        </label>
                        <div class="col-md-3">
                            <select class="form-control aiz-selectpicker" data-live-search="true" name="present_thana" id="division">
                                <option selected disabled value="">Upazilla</option>

                            </select>

                        </div>
                        {{-- <label class="col-md-2 col-form-label">
                            {{translate("Union:")}}
                        </label>
                        <div class="col-md-3">
                            <select class="form-control aiz-selectpicker" data-live-search="true" name="present_union" id="union">
                                <option selected disabled value="">Union</option>
                                @php $unions =\App\Union::get(); @endphp
                                @foreach($unions as $row)
                                    <option value="{{$row->name}}" {{old('present_union') == $row->name ? 'selected' : ''}} >{{$row->name}}</option>
                                @endforeach
                            </select>

                        </div> --}}
                        <label class="col-md-2 col-form-label">
                            {{translate("Area/ Village:")}}

                        </label>
                        <div class="col-md-3">
                            <input type="text" placeholder="{{translate("")}}" id="present_area" name="present_area" value="{{old('present_area')}}" class="form-control">
                        </div>

                    </div>
                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">
                            {{translate("Road No:")}}

                        </label>
                        <div class="col-md-3">
                            <input type="text" placeholder="{{translate("")}}" id="present_road" name="present_road" value="{{old('present_road')}}"  class="form-control">
                        </div>

                        <label class="col-md-2 col-form-label">
                            {{translate("House No:")}}

                        </label>
                        <div class="col-md-3">
                            <input type="text" placeholder="{{translate("")}}" id="present_house" name="present_house" value="{{old('present_house')}}"  class="form-control">
                        </div>
                        <label class="col-md-3 mt-3 col-form-label">
                            {{translate("Postal Code:")}}

                        </label>
                        <div class="col-md-3 mt-3">
                            <input type="text" placeholder="{{translate("Your present postal code")}}" id="present_postal_code" name="present_postal_code" value="{{old('present_postal_code')}}"  class="form-control">
                        </div>

                    </div>

</div>
         <hr>


                    <div class="form-group row">
                        {{-- <div class="col-md-3">
                            <input type="text" placeholder="{{translate('Your Nationality')}}" id="nationality" name="nationality" class="form-control">
                        </div> --}}
                        <label class="col-md-3 col-form-label">
                            {{translate('Nationality:')}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-3">
                            <select class="form-control aiz-selectpicker" data-live-search="true" name="nationality" id="division">

                                {{-- @php $countries =\App\Country::all(); @endphp
                                @foreach($countries as $row) --}}
                                    <option value="" disabled selected>{{ translate('Select Your Nationality') }}</option>
                                    <option value="Bangladeshi" {{old('nationality') == "Bangladeshi" ? 'selected' : ''}}>{{ translate('Bangladeshi') }}</option>
                                {{-- @endforeach --}}
                            </select>
                            @error('nationality')
                            <div class="alert alert-danger">{{ $message }}</div>
                                @enderror

                        </div>

                        <label class="p-3 col-md-2 col-from-label">
                            {{translate('Marital Status:')}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-4">
                            <select class="form-control aiz-selectpicker" name="marital" id="marital" data-live-search="true">
                                <option selected disabled value="">Select Your Marital Status</option>
                                <option {{old('marital') == 'Single' ? 'selected' : ''}} value="Single">Single</option>
                                <option {{old('marital') == 'Married' ? 'selected' : ''}} value="Married">Married</option>
                                <option {{old('marital') == 'In a Relationship' ? 'selected' : ''}} value="In a Relationship">In a Relationship</option>
                              <option {{old('marital') == 'Engaged' ? 'selected' : ''}} value="Engaged">Engaged</option>
                              <option {{old('marital') == 'Divorce' ? 'selected' : ''}} value="Divorce">Divorce</option>
                            </select>
                            @error('marital')
                            <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                        </div>
                    </div>



                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">
                            {{translate('Email:')}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-3">
                            <input type="text" placeholder="{{translate('Enter Your Email Address')}}" id="email" name="email" value="{{old('email')}}"  class="form-control">
                            @error('email')
                            <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                        </div>

                        <label class="p-3 col-md-2 col-from-label">
                            {{translate('Gender:')}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-4">
                            <select class="form-control aiz-selectpicker" name="gender" id="gender" data-live-search="true">
                                <option selected disabled value="">Select Your Gender</option>
                                <option {{old('gender') == '0' ? 'selected' : ''}} value="0">Male</option>
                                <option {{old('gender') == '1' ? 'selected' : ''}} value="1">Female</option>

                            </select>
                            @error('gender')
                            <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">
                            {{translate('Mobile:')}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-9">
                            <input type="number" placeholder="{{translate('Enter Your Mobile Number')}}" id="mobile" value="{{old('mobile')}}" name="mobile" class="form-control">
                            @error('mobile')
                            <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            <input type="hidden" value="{{$job->id}}" id="circuler_id" name="circuler_id">
                            <input type="hidden" value="{{$job->job_title}}" id="job_title" name="job_title">
                            <input type="hidden" value="{{$job->category_id}}" id="category_id" name="category_id">
                            <input type="hidden" value="{{$job->location_id}}" id="location_id" name="location_id">
                        </div>
                    </div>



                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">
                            {{translate('Facebook profile Link:')}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-9">
                            <input type="text" placeholder="{{translate('https://www.facebook.com/yourprofile')}}" id="facebook" name="facebook" value="{{old('facebook')}}"  class="form-control">
                            @error('facebook')
                            <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">
                            {{translate('Linkdin profile Link:')}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-9">
                            <input type="text" placeholder="{{translate('https://www.linkdin.com/yourprofile')}}" id="linkdin" name="linkdin" value="{{old('linkdin')}}"  class="form-control">
                            @error('linkdin')
                            <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-md-3 col-form-label" for="signinSrEmail">{{translate('Photo')}} <small>(600x600)</small></label>
                        <div class="col-md-9">
                            <div class="input-group" data-toggle="" data-type="image" data-multiple="true">


                                <input class="form-control file-amount" placeholder="{{ translate('Attach Your Passport Size Photo') }}" type="file" value="{{ old('photo') }}" name="photo" class="selected-files">
                            </div>
                            <div class="file-preview box sm">
                           </div>
                            <small class="text-muted">{{translate('These images are visible in your cv.')}}</small>
                            @error('photo')
                            <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                        </div>
                    </div>

                    {{-- <div class="row form-group">
                        <label for="inputName" class="col-sm-3 control-label">Division *</label>
                        <div class="col-sm-7">
                            <select class="form-control" name="Division" id="division">
                                <option>DIVISION</option>
                                @php $division =\App\Division::all(); @endphp
                                @foreach($division as $row)
                                    <option value="{{$row->name}}">{{$row->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div> --}}
                    {{-- <div class="row form-group">
                        <label for="inputName" class="col-sm-3 control-label">District *</label>
                        <div class="col-sm-7">
                            <select name="District" id="districtss" class="form-control opt-select">
                                <option>districtss</option>
                            </select>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label for="inputName" class="col-sm-3 control-label">Upazila *</label>
                        <div class="col-sm-7">
                            <select name="Upazila" id="upazila" class="form-control opt-select">
                                <option> Upazila </option>
                            </select>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label for="inputName" class="col-sm-3 control-label">PostOffice *</label>
                        <div class="col-sm-7">
                            <select name="PostOffice" id="PostOffice" class="form-control opt-select">
                                <option> Post Office </option>
                            </select>
                        </div>
                    </div> --}}





<hr>



                {{-- </form> --}}
    </div>

</div>
<div class="card">
    <label class="col-md-12 col-form-label">
        <input type="checkbox" name="agree" id="agree" value="1">&nbsp;
        {{translate('I am requesting to apply for the post of '.' ``'.$job->job_title.'``'.' of ``'.$job->company.'.`` I have
        read all the terms and Condition for the post. I believe that I would be sincere for all the job
        responsibilities. All the above given information are correct if any information are not correct then
        company have all rights to take any Decision about me.
        ')}}
        <span class="text-danger">*</span>
        @error('agree')
        <div class="alert alert-danger">{{ $message }}</div>
            @enderror
    </label>

</div>


                    <div class="form-group col-md-3 col-12 float-right pb-2 mb-0 text-right">
                        <button type="submit" class="btn btn-block btn-primary">
                            {{translate('Next')}}
                        </button>



                    </div>
                </form>
                {{-- <form action="{{route('mail.application')}}" method="post">
                    @csrf
                    <input type="hidden" name="job_title" value="{{$job->job_title}}">
                    <input type="hidden" name="id" value="{{$job->id}}">
                    {{ App\JobApplication::where('circuler_id', $job->id)->first()->id }}
                    <button type="submit"  class="btn btn-primary">
                        {{translate('Finish')}}
                    </button>
                </form> --}}
            </div>
        </div>
    </div>
</div>
</div>
@endsection

@section('script')
<!-- Extra JavaScript/CSS added manually in "Settings" tab -->
<!-- Include jQuery -->

<!-- Include Date Range Picker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
<script type="text/javascript" src="{{ asset('vendor/jsvalidation/js/jsvalidation.js')}}"></script>

{!! JsValidator::formRequest('App\Http\Requests\application') !!}
<script>
   $(document).ready(function(){
        var date_input=$('input[id="datepicker"]'); //our date input has the name "date"
        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
        date_input.datepicker({

            format: 'dd-mm-yyyy',

            container: container,
            todayHighlight: true,
            autoclose: true,
        })
    })



    function makeSlug(val) {
        let str = val;
        let output = str.replace(/\s+/g, '-').toLowerCase();
        $('#slug').val(output);
    }


$(document).ready(function() {

    // Disrict selector
        $('select[name="permanent_division"]').on('change', function(){

            var DivisionId = $(this).val();
            if(DivisionId) {
                $.ajax({
                    url: "{{  url('/get/permanent_district') }}/"+DivisionId,
                    type:"GET",
                    dataType:"json",
                    success:function(data) {
                    	$('select[name="permanent_district"]').html('');
                       var d ='<option value=""> select </option>';
                          $.each(data, function(key, value){
                              d += '<option value="'+ key +'">' + value + '</option>';
                               $('select[name="permanent_district"]').html(d);
                               AIZ.plugins.bootstrapSelect('refresh');
                          });

                    },
                });
            } else {
                alert('danger');
            }
        });

    // Thana Selector
        $('select[name="permanent_district"]').on('change', function(){

            var DistrictId = $(this).val();
            if(DistrictId) {
                $.ajax({
                    url: "{{  url('/get/permanent_thana') }}/"+DistrictId,
                    type:"GET",
                    dataType:"json",
                    success:function(data) {
                    	$('select[name="permanent_thana"]').html('');
                       var d ='<option value=""> select </option>';
                          $.each(data, function(key, value){
                              d += '<option value="'+ key +'">' + value + '</option>';
                               $('select[name="permanent_thana"]').html(d);
                               AIZ.plugins.bootstrapSelect('refresh');
                          });

                    },
                });
            } else {
                alert('danger');
            }
        });



 //Present Disrict selector
 $('select[name="present_division"]').on('change', function(){

var presentDivisionId = $(this).val();
if(presentDivisionId) {
    $.ajax({
        url: "{{  url('/get/permanent_district') }}/"+presentDivisionId,
        type:"GET",
        dataType:"json",
        success:function(data) {
            $('select[name="present_district"]').html('');
           var d ='<option value=""> select </option>';
              $.each(data, function(key, value){
                  d += '<option value="'+ key +'">' + value + '</option>';
                   $('select[name="present_district"]').html(d);
                   AIZ.plugins.bootstrapSelect('refresh');
              });

        },
    });
} else {
    alert('danger');
}
});

//Present Thana Selector
$('select[name="present_district"]').on('change', function(){

var DistrictId = $(this).val();
if(DistrictId) {
    $.ajax({
        url: "{{  url('/get/permanent_thana') }}/"+DistrictId,
        type:"GET",
        dataType:"json",
        success:function(data) {
            $('select[name="present_thana"]').html('');
           var d ='<option value=""> select </option>';
              $.each(data, function(key, value){
                  d += '<option value="'+ key +'">' + value + '</option>';
                   $('select[name="present_thana"]').html(d);
                   AIZ.plugins.bootstrapSelect('refresh');
              });

        },
    });
} else {
    alert('danger');
}
});







    });
</script>
@endsection
