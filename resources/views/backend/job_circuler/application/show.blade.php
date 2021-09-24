@extends('backend.layouts.app')
@section('css')
<link rel="stylesheet" href="{{asset('css/cv.css')}}">
<style>
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
@endsection
@section('content')
@php
$expe = \App\experience::where('user_id', $application->user_id)->where('set_default', 1)->first()
@endphp
<div class="card">
    <div class="card-header">
        <h1 class="h2 fs-16 mb-0">{{ translate('Application Details') }}</h1>
    </div>
    <div class="card-body">
        <div class="row gutters-2">
            <div class="cv col-md-8">

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

                                    {{-- <div class="col-md-4">
                                        <strong class="text-main">father's name: </strong><br>
                                        <strong class="text-main">mother's name: </strong><br>
                                <strong class="text-main">nationality: </strong><br>
                                <strong class="text-main">marital status: </strong><br>
                                <strong class="text-main">NID: </strong><br>
                                <strong class="text-main">BirthDay: </strong><br>
                                <strong class="text-main">Permanent address: <br></strong> <br>
                                <strong class="text-main">Present address:</strong><br><br>




                                    </div>


                                    <div class="col-md-8">
                                        <strong class="text-main">{{ $application->father_name }}</strong><br>
                                        <strong class="text-main">{{ $application->mother_name }}</strong><br>
                                <strong class="text-main">{{ $application->nationality }}</strong><br>
                                <strong class="text-main">{{ $application->marital }}</strong><br>
                                <strong class="text-main">{{ $application->nid }}</strong><br>
                                <strong class="text-main">{{ $application->date }}</strong><br>





                                <strong class="text-main">
                                    {{ $application->permanent_house }}/
                                    {{ $application->permanent_road }},
                                    {{ $application->permanent_area }},
                                    {{ $application->permanent_thana }},
                                    {{ $application->permanent_district }},
                                    {{ $application->permanent_division }}-
                                    {{ $application->permanent_postal_code }}
                            </strong> <br>


                                <strong class="text-main">
                                    @if ($application->present_division){{ $application->present_division }},@endif
                                    @if ($application->present_district){{ $application->present_district }},@endif
                                    @if ($application->present_thana){{ $application->present_thana }},@endif
                                    @if ($application->present_road){{ $application->present_road }},@endif
                                    @if ($application->present_area){{ $application->present_area }},@endif
                                    @if ($application->present_house){{ $application->present_house }}-@endif
                                    @if ($application->present_postal_code){{ $application->present_postal_code }}@endif

                                </strong>

                                    </div> --}}
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


                                  {{-- <div class="row">
                                   <div class="col-md-12"> <span class="fw-700">{{ $edu->degree }} ({{ $edu->institute }})</span></div>
                                      <div class="col-md-3">

                                        <span></span> <br>
                                        <span>roll: </span> <br>
                                        <span>: </span> <br>
                                        <span>passing year: </span>
                                      </div>
                                      <div class="col-md-8">
                                        <span>{{ $edu->board }}</span> <br>
                                        <span>{{ $edu->subject }}</span> <br>
                                        <span>{{ $edu->roll }}</span> <br>
                                        <span>{{ $edu->result }}</span> <br>
                                        <span>{{ $edu->passing_year }}</span>
                                      </div>
                                  </div> --}}
                                 </div>
                                </div><hr>
                             @endforeach
                            </div>
                     </div>

                   </div>
                 </div>
                </div> <!-- cv end -->


                <div style="height: 100px;" class="col-md-2 ml-auto">
                    <table>
                        <tbody>
                            <tr>
                                <td class="text-main text-bold">{{translate('Application ID:')}}</td>
                                <td class="text-right text-info text-bold">	{{ $application->id }}</td>
                            </tr>
                            <tr>
                                <td class="text-main text-bold">{{translate('Application Status')}}</td>

                                <td class="text-right">
                                   @if ($application->status == 0)
                                   <span class="badge badge-inline badge-danger">{{ translate('canceled') }}</span>
                                   @endif
                                   @if($application->status == 2)
                                   <span class="badge badge-inline badge-success">{{ translate('confirmed') }}</span>
                                   @endif
                                   @if($application->status == 1)
                                   <span class="badge badge-inline badge-info">{{ translate('pending') }}</span>
                                   @endif

                                </td>
                            </tr>
                            <tr>
                                <td class="text-main text-bold">{{translate('Application Date')}}	</td>
                                <td class="text-right">  {{ \Carbon\Carbon::parse($application->created_at)->format('D M d/m/Y')}}</td>
                            </tr>
                            <tr>
                                <td class="text-main text-bold">
                                    {{translate('Circuler ID')}}
                                </td>
                                <td class="text-right">
                                    {{ $application->circuler_id }}
                                </td>
                            </tr>
                            <tr>
                                <td class="text-main text-bold">{{translate('Category')}}</td>
                                <td class="text-right">{{ $application->categories->category_name }}</td>
                            </tr>
                            <tr>
                                <td class="text-main text-bold">{{translate('Agreement')}}</td>
                                <td class="text-right">{{ $application->agree == 1 ? 'agree':'not-agree'}}</td>
                            </tr>

                        </tbody>
                    </table>
                </div>


            <div style="height: 100px;" class="col-md-2 ml-auto">
                <label for="update_delivery_status">{{translate('Application Status')}}</label>
                <form name="myform" id="sort_sellers" action="{{route('application.update_status')}}" method="post">
                    @csrf
                    <input type="hidden" name="id" value="{{$application->id}}">


                    <select name="status"  onchange="sort_sellers()" class="form-control aiz-selectpicker"  data-minimum-results-for-search="Infinity" >
                        <option value="1" @if ($application->status == '1') selected @endif>{{translate('Pending')}}</option>
                        <option value="2" @if ($application->status == '2') selected @endif>{{translate('Confirmed')}}</option>

                        <option value="0" @if ($application->status == '0') selected @endif>{{translate('Cancel')}}</option>
                    </select>

                </form>
            </div>


        </div>
        <script>
function sort_sellers(el){
            $('#sort_sellers').submit();
        }
        </script>
        <div class="row gutters-5">
            {{-- <div class="col text-center text-md-left">
                <div class="card-header col-8">
                    Candidade details...
                </div>
             <address class="mt-2">
                    <strong class="text-main">candidade: {{ $application->user->name }}</strong><br>
                    <strong class="text-main">username: {{ $application->user_name }}</strong><br>
                   email: {{ $application->email }}<br>
                   mobile: {{ $application->mobile }}<br>
                    <strong class="text-main">nationality: {{ $application->nationality }}</strong><br>
                    <strong class="text-main">marital:  {{ $application->marital }}</strong><br>
                    <strong class="text-main">NID: {{ $application->nid }}</strong><br>
                    <strong class="text-main">BirthDay: {{ $application->date }}</strong><br>
                    <br><br>

                    <strong class="text-main">father's name:  {{ $application->father_name }}</strong><br>
                    <strong class="text-main">mother's name  {{ $application->mother_name }}</strong><br>
                <div class="row">
                    <div class="col-4">
                        <span>permanent division:</span> {{ $application->permanent_division }}<br>
                        <span>permanent district:</span> {{ $application->permanent_district }}<br>
                        <span>permanent thana:</span> {{ $application->permanent_thana }}<br>
                        <span>permanent road:</span> {{ $application->permanent_road }}<br>
                        <span>permanent area:</span> {{ $application->permanent_area }}<br>
                        <span>permanent house:</span> {{ $application->permanent_house }}<br>
                    </div>
                    <div class="col-4">
                        <span>present division:</span> {{ $application->present_division }}<br>
                        <span>present district:</span> {{ $application->present_district }}<br>
                        <span>present thana:</span> {{ $application->present_thana }}<br>
                        <span>present road:</span> {{ $application->present_road }}<br>
                        <span>present area:</span> {{ $application->present_area }}<br>
                        <span>present house:</span> {{ $application->present_house }}<br>
                    </div>
                </div>




                </address>

            </div> --}}

        </div>
        <hr class="new-section-sm bord-no">
        {{-- <div class="row">
            <div class="col-lg-12 table-responsive">
                <table class="table table-bordered aiz-table invoice-summary">
                    <thead>
                        <tr class="bg-trans-dark">
                            <th data-breakpoints="lg" class="min-col fs-15 fw-700 text-primary">{{ translate('Educational Qualifications') }}</th>

                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($educations as $key => $edu)
                        <tr>
                            <td>
                                <div class="card">




                                @if ($edu->set_default == 1)
                                <div class="card-header bg-soft-primary">
                       <span class="fs-15 fw-600 text-primary">  {{ translate('Present') }}</span>
                    </div>
                    @else
                    <div class="card-header bg-soft-info">
                        <span class="fs-15 fw-600 text-primary">  {{ translate('Previous') }}</span>
                     </div>
                                @endif

                    <div class="card-body">


                                <strong>{{ translate('Degree') }}:</strong>
                                @if ($edu->degree != null)
                               {{ $edu->degree }}
                                @else
                                <strong>{{ translate('N/A') }}</strong>
                                @endif
                                <br>

                                <strong>{{ translate('Institute') }}:</strong>
                                @if ($edu->institute != null)
                                 {{ $edu->institute }}
                                @else
                                <strong>{{ translate('N/A') }}</strong>
                                @endif
                                <br>

                                <strong>{{ translate('Board') }}:</strong>
                                @if ($edu->board != null)
                                 {{ $edu->board }}
                                @else
                                <strong>{{ translate('N/A') }}</strong>
                                @endif

                                <br>

                                <strong>{{ translate('Subject') }}:</strong>
                                @if ($edu->subject != null)
                                 {{ $edu->subject }}
                                @else
                                <strong>{{ translate('N/A') }}</strong>
                                @endif
                                <br>

                                <strong>{{ translate('Passing Year') }}:</strong>
                                @if ($edu->passing_year != null)
                                {{ $edu->passing_year }}
                                @else
                                <strong>{{ translate('N/A') }}</strong>
                                @endif
                                <br>


                                <strong>{{ translate('institute') }}:</strong>

                                @if ($edu->result != null)
                              {{ $edu->result }}
                                @else
                                <strong>{{ translate('N/A') }}</strong>
                                @endif

                            </div>


                            </div>

                            </td>

                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div> --}}
        <div class="clearfix float-right">

            <div class="text-right no-print">
                <a href="{{ route('cv.download', $application->id) }}" type="button" class="btn btn-icon btn-light"><i class="las la-print"></i></a>
            </div>
        </div>

    </div>
</div>
@endsection

@section('script')
     <script type="text/javascript">


        // $('#update_delivery_status').on('change', function(){

        //     var id = {{ $application->id }};
        //     var status = $('#update_delivery_status').val();
        //     $.post('{{ route('application.update_status') }}', {

        //         _token:'{{ @csrf_token() }}',
        //         id:id,
        //         status:status
        //     },




        //     function(data){


        //         if(data == 1){
        //         AIZ.plugins.notify('success', '{{ translate('Application status has been updated') }}');
        //         }
        //         else{
        //         AIZ.plugins.notify('danger', '{{ translate('Something went wrong') }}');
        //     }
        //     });
        // });


    </script>
@endsection
