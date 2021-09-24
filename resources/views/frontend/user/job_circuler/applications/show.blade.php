@extends('frontend.layouts.user_panel')
@push('css')
<link rel="stylesheet" href="{{asset('css/cv.css')}}">
@endpush
@section('panel_content')
@php
    $expe = \App\experience::where('user_id', $application->user_id)->where('set_default', 1)->first();
@endphp
@include('notify::messages')
<style>
    .tooltip {
      position: relative;
      display: inline-block;
    }

    .tooltip .tooltiptext {
      visibility: hidden;
      width: 140px;
      background-color: #555;
      color: #fff;
      text-align: center;
      border-radius: 6px;
      padding: 5px;
      position: absolute;
      z-index: 1;
      bottom: 150%;
      left: 50%;
      margin-left: -75px;
      opacity: 0;
      transition: opacity 0.3s;
    }

    .tooltip .tooltiptext::after {
      content: "";
      position: absolute;
      top: 100%;
      left: 50%;
      margin-left: -5px;
      border-width: 5px;
      border-style: solid;
      border-color: #555 transparent transparent transparent;
    }

    .tooltip:hover .tooltiptext {
      visibility: visible;
      opacity: 1;
    }
    .bold {
        font-size: 14px
    }
    .text-main{
        font-size: 11px;
    }
    .semi-bold{
        font-size: 11px;
    }
    .date{
        font-size: 12px !important;
    }
    td{
        padding: 0px !important;

    }
    </style>
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header bg-soft-info">
                <h5 class="mb-0 h6">{{translate('Application Information')}}</h5>
            </div>
            <div class="card-body">

                <span class="float-right">application status: @if ($application->status == '1')  <span style="width: auto !important;"  class="badge badge-warning">pending </span> <i class="fad fa-question-circle" aria-hidden="true" data-toggle="tooltip" data-html="true" title="<em>We are processing your application.</em><span> When approved we will mail you in your applicant mail, <b>Thanks</b></span> "></i> @endif @if($application->status == 2) <span style="width: auto !important;" class="badge badge-success">approved</span>@endif @if($application->status == 0) <span style="width: auto !important;" class="badge badge-danger">Canceled</span>@endif</span>
                <span class="btn text-dark bg-soft-danger"> Application ID: <input disabled type="text" class="" id="myInput" value="{{$application->id}}"></span>
               <button class="btn bg-soft-info" onclick="myFunction()" onmouseout="outFunc()"><span class="tooltiptext" id="myTooltip"><i class="fad fa-copy fa-1x"></i></span></button> <br><br>

               <span class="fw-600">Post: {{ $application->job_title }}</span> <br>
               <span class="fw-600">Category: {{ $application->categories->category_name }}</span> <br>
               <span class="fw-600">Location: {{ $application->location->location }}</span> <br>
               <span class="fw-600">Candidate: {{ $application->user_name }}</span> <br>
               <span class="fw-600">Application Placed: {{ $application->created_at->format('d M Y').' at '.$application->created_at->format('h:i a') }}</span> <br>
            </div>
            <div class="card-footer bg-soft-info">

                <strong class="fs-15 fw-600 text-primary">Application Detail:</strong>
            </div>

    <div class="container ">

         <div class="cv col-md-12">

            <div class="resume">
                <div class="resume_left d-none d-md-block">
                  <div class="resume_profile">
                    <img src="{{ env('APP_URL').'/'.($application->photo) }}" alt="profile_pic">
                  </div>
                  <div class="resume_content">
                    <div class="resume_item resume_info">
                      <div class="title">
                        <p class="bold">{{$application->name}}</p>



                     <p class="regular">{{ $expe->designation}}</p>


                      </div>
                      <div class="ul">
                        <div class="li">
                          <div class="icon">
                            <i class="fas fa-map-signs"></i>
                          </div>
                          <div class="data">
                            {{$application->permanent_division}}, {{$application->permanent_district}}, {{$application->permanent_thana}} <br /> {{$application->nationality}}
                          </div>
                        </div>
                        <div class="li">
                          <div class="icon">
                            <i class="fas fa-mobile-alt"></i>
                          </div>
                          <div class="data">
                            {{$application->mobile}}
                          </div>
                        </div>
                        <div class="li">
                          <div class="icon">
                            <i class="fas fa-envelope"></i>
                          </div>
                          <div class="data">
                            {{$application->email}}
                          </div>
                        </div>

                    </div>
                    </div>
                    <div class="resume_item resume_skills">
                      <div class="title">
                        <p class="bold">skill's</p>
                      </div>


                        <div class>
                          <div class="skill_name">
                          {{ $application->skill }}
                          </div>


                        </div>


                    </div>
                    <div class="resume_item resume_social">
                      <div class="title">
                        <p class="bold">Social</p>
                      </div>
                      <div class="ul">
                        <div class="li">
                          <div class="icon">
                            <i class="fab fa-facebook-square"></i>
                          </div>
                          <div class="data">

                            <a href="{{ $application->facebook }}" target="_blank" rel="noopener noreferrer"><p class="semi-bold">Facebook</p></a>
                          </div>
                        </div>


                        <div class="li">
                          <div class="icon">
                            <i class="fab fa-linkedin"></i>
                          </div>
                          <div class="data">

                            <a href="{{ $application->linkdin }}" target="_blank" rel="noopener noreferrer"><p class="semi-bold">Linkedin</p></a>
                          </div>
                        </div>
                    </div>
                    </div>
                  </div>
               </div>

               <div class="resume_right">
                 <div class="resume_item resume_about">
                     <div class="title">
                        <p class="bold">About</p>
                      </div>

                     <p class="text-justify">{{ $application->about}}</p>

                 </div>

                 <div class="resume_item resume_about fs-13 text-uppercase">
                     <div class="title">
                        <p class="bold">Personal Informations</p>
                      </div>
                            <div class="row semi-bold">
                             <div class="li">
                                    <div class="info col-12 col-md-12 ml-2">

                                <table class="table table-sm table-borderless">

                                    <tbody class=" opacity-80 fs-11">
                                      <tr class="fw-700">
                                        <td >candidate name:</td>
                                        <td>{{ $application->name }}</td>
                                      </tr>
                                      <tr >
                                        <td >father's name:</td>
                                        <td>{{ $application->father_name }}</td>
                                      </tr>
                                      <tr>
                                        <td>mother's name:</td>
                                        <td>{{ $application->mother_name }}</td>
                                      </tr>
                                      <tr>
                                        <td>nationality:</td>
                                        <td>{{ $application->nationality }}</td>
                                      </tr>
                                      <tr>
                                        <td>marital status:</td>
                                        <td>{{ $application->marital }}</td>
                                      </tr>
                                      <tr>
                                        <td>NID:</td>
                                        <td>{{ $application->nid }}</td>
                                      </tr>
                                      <tr>
                                        <td>BirthDay:</td>
                                        <td>{{ $application->date }}</td>
                                      </tr>
                                      <tr>
                                        <td>Permanent address:</td>
                                        <td>{{ $application->permanent_house }}/
                                            {{ $application->permanent_road }},
                                            {{ $application->permanent_area }},
                                            {{ $application->permanent_thana }},
                                            {{ $application->permanent_district }},
                                            {{ $application->permanent_division }}-
                                            {{ $application->permanent_postal_code }}</td>
                                      </tr>
                                      <tr>
                                        <td>Present address:</td>
                                        <td>@if ($application->present_division){{ $application->present_division }},@endif
                                            @if ($application->present_district){{ $application->present_district }},@endif
                                            @if ($application->present_thana){{ $application->present_thana }},@endif
                                            @if ($application->present_road){{ $application->present_road }},@endif
                                            @if ($application->present_area){{ $application->present_area }},@endif
                                            @if ($application->present_house){{ $application->present_house }}-@endif
                                            @if ($application->present_postal_code){{ $application->present_postal_code }}@endif</td>
                                      </tr>

                                    </tbody>
                                  </table>
                                    </div>
                                </div>

                            </div>

                 </div>
                 <div class="resume_item resume_work">
                     <div class="title">
                        <p class="bold">Work Experience</p>
                      </div>
                     <div class="ul">
                        @foreach ($experience as $key => $exp)
                         <div class="li">
                             <div class="date">{{ \Carbon\Carbon::parse($exp->employment_period_start)->format('d M Y') }} To {{\Carbon\Carbon::parse($exp->employment_period_end)->format('d M Y')}}</div>
                             <div class="info">
                                  <p class="semi-bold">{{ $exp->designation }} ({{ $exp->organization }})</p>
                               <p class="semi-bold">{{ $exp->degree }} </p>
                               <p class="semi-bold">{{ $exp->board }}</p>
                               <p class="semi-bold">{{ $exp->subject }}</p>
                               <p class="semi-bold">{{ $exp->result }}</p>


                             </div>
                            </div>
                         @endforeach
                        </div>
                 </div>
                 <div class="resume_item resume_education">
                   <div class="title">
                        <p class="bold">{{ translate('Education') }}</p>
                    </div>
                   <div class="text-uppercase semi-bold">
                    @foreach ($educations as $key => $edu)
                         <div class="li">

                             <div class="info col-12 col-md-12">
                                <table class="table table-sm table-borderless">

                                    <tbody class="opacity-80 fs-11">
                                      <tr class="fw-700">
                                        <td >degree:</td>
                                        <td>{{ $edu->degree.' ('.$edu->institute.')' }}</td>
                                      </tr>
                                      <tr>
                                        <td>subject:</td>
                                        <td>{{ $edu->subject }}</td>
                                      </tr>
                                      <tr>
                                        <td>roll:</td>
                                        <td>{{ $edu->roll }}</td>
                                      </tr>
                                      <tr>
                                        <td>board:</td>
                                        <td>{{ $edu->board }}</td>
                                      </tr>
                                      <tr>
                                        <td>result:</td>
                                        <td>{{ $edu->result }}</td>
                                      </tr>
                                      <tr>
                                        <td>passing year:</td>
                                        <td>{{ $edu->passing_year }}</td>
                                      </tr>

                                    </tbody>
                                  </table>


                             </div>
                            </div><hr>
                         @endforeach
                        </div>
                 </div>

               </div>
             </div>
            </div> <!-- cv end -->
         <div class="col-2">
            <div class="card-body text-center">

                <span class="fw-600 ">Options:</span>
                <hr>
                <button onclick="location.href='mailto:{{$application->jobs->email}}';"  class="btn p-1 btn-primary">Send CV</button>
            </div>
         </div>
    </div>
 </div>
</div>

</div>
@endsection

@section('script')
<script>

function myFunction() {
  var copyText = document.getElementById("myInput");
  copyText.select();
  copyText.setSelectionRange(0, 99999);
  navigator.clipboard.writeText(copyText.value);

  var tooltip = document.getElementById("myTooltip");
  tooltip.innerHTML = "Copied: " + copyText.value;
}

function outFunc() {
  var tooltip = document.getElementById("myTooltip");
  tooltip.innerHTML = "click to copy";
}

    function makeSlug(val) {
        let str = val;
        let output = str.replace(/\s+/g, '-').toLowerCase();
        $('#slug').val(output);
    }
</script>
@endsection
