@extends('frontend.layouts.app')
@section('meta_title'){{ $jobs->meta_title }}@stop
@section('meta_description'){{ $jobs->meta_description }}@stop
@section('meta_keywords'){{ $jobs->meta_keywords }}@stop
@section('meta')
<!-- Schema.org markup for Google+ -->
<meta itemprop="name" content="{{ $jobs->meta_title }}">
<meta itemprop="description" content="{{ $jobs->meta_description }}">
<meta itemprop="image" content="{{ uploaded_asset($jobs->meta_img) }}">
<!-- Twitter Card data -->
<meta name="twitter:card" content="summary">
<meta name="twitter:site" content="@publisher_handle">
<meta name="twitter:title" content="{{ $jobs->meta_title }}">
<meta name="twitter:description" content="{{ $jobs->meta_description }}">
<meta name="twitter:creator" content="@author_handle">
<meta name="twitter:image" content="{{ uploaded_asset($jobs->meta_img) }}">
<!-- Open Graph data -->
<meta property="og:title" content="{{ $jobs->meta_title }}" />
<meta property="og:type" content="website" />
<meta property="og:url" content="{{ route('product', $jobs->slug) }}" />
<meta property="og:image" content="{{ uploaded_asset($jobs->meta_img) }}" />
<meta property="og:description" content="{{ $jobs->meta_description }}" />
<meta property="og:site_name" content="{{ env('APP_NAME') }}" />
<link rel="stylesheet" href="{{asset('public/assets/css/css/jobs.css')}}">


@endsection
@section('content')

<div class="container">
<section class="py-4">
	<div id="printableArea">
		<div class="container">
			<div class="mb-4">
			</div>
			<div class="row">
				<div class="col-lg-6 text-center text-lg-left">
					<h1 class="fw-600 h6">{{ translate('Circuler Information')}}</h1>
				</div>

				<div class="container job-details1">
					<div class="row">
						<div class="col-sm-12 card">
							<div id="job-preview" class="dddd cont-wrap ">
								<div class="center" id="main" style="">
									<div  role="main">
										<!--new design start-->
										<div class="row">
											<div class="col-sm-12 d-none d-sm-block mt-3">
												<div class="pull-right text-muted category-wrapper">
													<strong>Category: {{ $jobs->category->category_name }}</strong>
												</div>
											</div>
										</div>
										<div class="row" style="margin-right: -30px !important;">
											<div class="col-sm-8">
												<div class="">
													<div class="left">
														<div class="row  ptjwrap">

															<div class="col-sm-9 my-3 ">
																<h2 class="job-title fw-700 h5">{{ $jobs->job_title }}</h2>
																<strong class="text-primary fw-500 fs-108" > {{ $jobs->company }}</strong>
															</div>
                                                            <div class="col-sm-2">
																<div class="com-logo">
																	<img style="height: 35px !important" class="img-fluid float-right" alt="" title="company logo" src="{{ uploaded_asset($jobs->banner) }}">
																</div>
															</div>
														</div>

														<div class="vac">

														</div>
														<div class="job_des text-justify">
															<h6 class="fw-700">Job Description</h6>
															<div class="mb-6 overflow-hidden">
																{!! $jobs->job_description !!}
															</div>
														</div>
														<div class="job_nat">
															<h6>Employment Status</h6>
															<p>
															<ul>
																<li>{{$jobs->employment_status}}</li>
															</ul>
															</p>
														</div>
														<!--Work From Home-->

														<!-- EDUCATIONAL REQUIREMENTS: -->
														<div class="edu_req">
															<h6>Educational Requirements</h6>
															<ul class="">
																<li style="padding-bottom:5px"> {{$jobs->education}}</li>
															</ul>
														</div>
														<!--NUMBER OF PUBLICATION: -->
														<div class="edu_req">
															<h6>Experience Requirements</h6>
															<ul>
																<li>{{$jobs->experience}}</li>
															</ul>
														</div>

														<div class="job_loc " style="line-height: 24px;">
															<h6>Job Location</h6>
															<ul>
																<li>{{ $jobs->location->location }}</li>
															</ul>
														</div>

													</div>
												</div>
											</div>
                                            <style>

                                            </style>
											<div class="col-sm-4">
												<div class="right action-section">
													<div class="m-view">
														<div class="right job-summary">
															<div class="panel panel-default">
																<div class="card-header header-bg" role="heading">Job Summary</div>
																<div class="panel-body card-body ">
																	<h6 id="jobSide">
																		<strong ><i class="fad fa-upload"></i>&nbsp;Published on:</strong>&nbsp;{{$jobs->created_at->format('D d M Y')}}
																	</h6>
																	<h6 id="jobSide">
																		<strong ><i class="fad fa-user-friends"></i>&nbsp;Vacancy:</strong>&nbsp;
																		{{$jobs->vacancy}}
																	</h6>
																	<h6 id="jobSide">
																		<strong ><i class="far fa-user-clock"></i>&nbsp;Employment Status:</strong>&nbsp;{{$jobs->employment_status}}
																	</h6>
																	<h6 id="jobSide">
																		<strong  ><img style="height: 14px" src="https://image.flaticon.com/icons/png/512/2303/2303952.png" class="replaced-svg" alt="Experience">&nbsp;Experience:&nbsp;{{$jobs->experience}}</strong>
																	</h6>
																	<h6 id="jobSide" >
																		<strong ><i class="fas fa-map-marker-check"></i>&nbsp;Job Location:</strong>&nbsp;{{ $jobs->location->location }}
																	</h6>
																	<h6 style="line-height: 20px" id="jobSide" >
																		<strong ><i class="far fa-map-marked-alt"></i>Address:</strong>&nbsp;{{ $jobs->address }}
																	</h6>
																	<h6 id="jobSide"  >
																		<strong ><i class="far fa-venus-mars"></i>Gender:</strong> &nbsp;
																		@if ($jobs->gender == 1)
																		Only males are allowed to apply
																		@endif
																		@if ($jobs->gender == 2)
																		Only females are allowed to apply
																		@endif
																		@if ($jobs->gender == 3)
																		Males & Females both's are allowed to apply
																		@endif
																	</h6>
																	<h6 id="jobSide">
																		<strong ><img style="height: 14px" src="https://image.flaticon.com/icons/png/512/3787/3787928.png" class="replaced-svg" alt="Adult">&nbsp;Age:</strong>&nbsp;{{$jobs->age}}
																	</h6>
																	<h6 id="jobSide">
																		<strong  ><i class="fas fa-dollar-sign"></i>&nbsp;Salary: </strong>&nbsp; {{$jobs->salary}}
																	</h6>
																	<h6 id="jobSide">
																		<strong class="text-danger"><i class="fad fa-calendar-alt"></i>&nbsp;Deadline:</strong>&nbsp{{ Carbon\Carbon::parse($jobs->deadline)->format('D d M Y')}}
																	</h6>
																</div>
															</div>
														</div>


														<div class="right action-section">
															<div class="panel panel-default">
																<div class="card-header header-bg visuallyhidden" role="heading">Quick links for this job</div>
																<div class="panel-body">




																	<span id="ptjob">
																	<a href="#"id="printjob" onclick="printDiv('printableArea')">
																	<i aria-hidden="true" class="icon-printer"></i>&nbsp;<i class="fad fa-print"></i> Print this job
																	</a>
																	</span>

																	<span class="report">
																		<a href="mailto:complain@emed.com.bd?subject=Report About This Circuler {{$jobs->job_title}}!&amp;body=Please concern about the job url: {{url($jobs->slug)}}, Because ...." class="sub_window_new_update">
																		<i aria-hidden="true" class="icon-flag"></i><i class="fad fa-exclamation-circle" style="font-size: 20px;"></i>Report this Job / Company
																		</a>
																		<div class=" text-dark message">
																			বিজ্ঞাপন দাতা প্রতিষ্ঠান আপনার
																			কাছে এই চাকরির জন্য কোন আর্থিক লেনদেন, আনিয়ম বা প্রতারণামূলক কোনো কর্মকাণ্ডে আমাদেরকে
																			জানান অথবা বিজ্ঞাপনটি রিপোর্ট করুন। <br>

																			<i class="fad fa-envelope-open-text"></i><a href="mailto:complain@emed.com.bd?subject=Report About This Circuler {{$jobs->job_title}}!&amp;body=Please concern about the job url: {{url($jobs->slug)}}, Because ....">complain@emed.com.bd</a>
                                                                        </div>

																	</span>

																</div>
															</div>
														</div>
														<div class="right training">
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-12">
												<div class="guide text-center ">
													<div class="rba">
														<h5>
															Please Read Before Apply
														</h5>
														<div class="gra-padded gra-bordered gra-centered"></div>
														<div class="s-sug-txt fw-600 d-none d-md-block d-xl-block d-lg-block">
															Please read carefully the Job Responsibilities before you Apply for the position.<br>If you believe that you are suitable for the position and confident to work under pressure, self-motivated, dynamic &amp; energetic may Apply Online. After Online Application You Have to Send Your CV With Application ID via Mail.
														</div>
														<div class="s-sug-txt fw-600 d-md-none d-lg-none  text-justify">
															Please read carefully the Job Responsibilities before you Apply for the position.<br>If you believe that you are suitable for the position and confident to work under pressure, self-motivated, dynamic &amp; energetic may Apply Online. After Online Application You Have to Send Your CV With Application ID via Mail.
														</div>
													</div>
													<div class="pho-txt">

															<span class="text-danger fs-200 fw-700">*Photograph must be enclosed with the resume.</span>

													</div>
													<div class="apto">
														<h5>Apply Procedure</h5>
													</div>
													<div class=" text-center">

														<button class="btn btn-success mb-2" href="#oappm" data-toggle="modal" data-target="#appliTermsModal" type="button"><i class="fal fa-globe-asia"></i> Apply Online</button>
														@auth
														@if(isAdmin())
														<a href="mailto:{{$jobs->email}}?subject=I would like to Apply as {{$jobs->job_title}}!&amp;body=Write Your Application , Attach a CV for more attractive application and sent it to the Author ``{{$jobs->company }}``" class="btn mb-2 btn-outline-primary"><i class="fad fa-paper-plane"></i>{{translate(' Send CV')}}</a>
														@else
														<a href="mailto:{{$jobs->email}}?subject=I would like to Apply as {{$jobs->job_title}}!&amp;body=Write Your Application , Attach a CV for more attractive application and sent it to the Author ``{{$jobs->company}}``" class="btn mb-2 btn-outline-primary"><i class="fad fa-paper-plane"></i>{{translate(' Send CV')}}</a>
														@endif

														@else
														<a href="{{url('/users/login')}}" class="btn mb-2 btn-outline-primary">{{translate('Send CV')}}</a>
														@endauth
													</div>
													<div class="gra-padded gra-bordered gra-centered"></div>
													<br>
													<h3>Email</h3>
													<div class="text-center">
														@auth
														@if(isAdmin())
														<li class="list-inline-item mr-3">
															<a href="mailto:{{$jobs->email}}?subject=I would like to Apply as {{$jobs->job_title}}!&amp;body=Write Your Application , Attach a CV for more attractive application and sent it to the Author ``{{$jobs->company}}``" class="text-reset py-2 d-inline-block opacity-80"> Send your CV to <strong> {{$jobs->email}} </strong></a>
														</li>
														@else
														<li class="list-inline-item mr-3">
															<a href="mailto:{{$jobs->email}}?subject=I would like to Apply as {{$jobs->job_title}}!&amp;body=Write Your Application , Attach a CV for more attractive application and sent it to the Author ``{{$jobs->company}}``"class="text-reset py-2 d-inline-block opacity-80"> Send your CV to <strong> {{$jobs->email}} </strong></a>
														</li>
														@endif

														@else
														<li class="list-inline-item mr-3">
															<a href="{{ route('user.login') }}" class="text-reset py-2 d-inline-block opacity-80">Log In</a>
															<strong>
															to see Application Email. Don't have an account? Click Here to
															</strong>
															<a href="{{ route('user.registration') }}" class="text-reset py-2 d-inline-block opacity-80">Register Now</a>
														</li>
														@endauth
													</div>
													<script>

													</script>
													<!--end online apply limit warning.-->

													<div>
														<span class="date text-danger fw-800">
														Application Deadline : {{Carbon\Carbon::parse($jobs->deadline)->format('D d M Y')}}
														</span>
													</div>
												</div>
												<!--company information start-->
												<script type="text/javascript"></script>
												<div class="company-info">
                                                                <div class="pt-3">




                                                                            <div class="row ">
                                                                                <div class="col-md-8">
                                                                                    <h6><strong>Published On:</strong></h6>
                                                                                    <span>{{$jobs->created_at->format('D d M Y')}} </span>
                                                                                    <br>
                                                                                    <h6><strong>Company Information:</strong></h6>
                                                                                    <span class="text-primary"><b>{{$jobs->company}}</b></span>
                                                                                    <span>Category: {{ $jobs->category->category_name }}</span>
                                                                                    <span class="text-justify">Address: {{$jobs->address}} </span>
                                                                                    <span>Email: <a href="mailto:{{$jobs->email}}">{{$jobs->email}}</a></span>
                                                                                    <span>Phone: <a href="callto:{{$jobs->phone}}">{{$jobs->phone}}</a></span>

                                                                                </div>



                                                                                <div style="padding-left: 0px !important; margin-left: -10px;" class="mt-2 col-md-4 d-none d-md-block calendar-bd">
                                                                                    <div class="calendar">
                                                                                        <div class="card-header calendar__body text-center">
                                                                                            <span class=" fs-18 fw-600 text-danger">Application Deadline</span>

                                                                                        </div>
                                                                                        <div class="calendar__opts">
                                                                                        <select name="calendar__month" id="calendar__month">

                                                                                            <option selected>{{ Carbon\Carbon::parse($jobs->deadline)->format('M')}}</option>

                                                                                        </select>

                                                                                        <select name="calendar__year" id="calendar__year">

                                                                                            <option selected>{{ Carbon\Carbon::parse($jobs->deadline)->format('Y')}}</option>
                                                                                        </select>
                                                                                        </div>

                                                                                        <div class="calendar__body">
                                                                                        <div class="calendar__days">
                                                                                            <div>M</div>
                                                                                            <div>T</div>
                                                                                            <div>W</div>
                                                                                            <div>T</div>
                                                                                            <div>F</div>
                                                                                            <div>S</div>
                                                                                            <div>S</div>
                                                                                        </div>

                                                                                        <div class="calendar__dates">
                                                                                            <div class="calendar__date calendar__date--grey"><span>27</span></div>
                                                                                            <div class="calendar__date calendar__date--grey"><span>28</span></div>
                                                                                            <div class="calendar__date calendar__date--grey"><span>29</span></div>
                                                                                            <div class="calendar__date calendar__date--grey"><span>30</span></div>
                                                                                        @for ($i = 1; $i <= 30; $i++)
                                                                                        <div class="calendar__date {{ Carbon\Carbon::parse($jobs->deadline)->format('d') == $i ? 'calendar__date--selected calendar__date--last-date calendar__date--range-end':'' }}"><span>  {{$i}}  </span></div>
                                                                                        @endfor

                                                                                        @if (Carbon\Carbon::parse($jobs->deadline)->format('d') == 31)
                                                                                        <div class=" calendar__date {{ Carbon\Carbon::parse($jobs->deadline)->format('d') == $i ? 'calendar__date--selected calendar__date--last-date calendar__date--range-end':'' }}"><span>31</span></div>
                                                                                        @endif




                                                                                        </div>
                                                                                        </div>

                                                                                        <div class="calendar__buttons">

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
								<!--from desktop version start-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<div id="appliTermsModal" class="modal fade bangla" style="z-index: 2147483647 !important; padding-right: 18px;" role="dialog" aria-hidden="false">
		<div class="modal-dialog ">
			<div style="    width: 340px !important;
            margin-right: 12px !important;" class="modal-content">
				<div class="modal-header">
					<h6 class="modal-title"><span class="bn" style=" font-weight: bold;">সতর্কবার্তা</span></h6>

					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<div style="text-align: justify ;text-justify: inter-word;" class=" modal-body">
					<p style="margin-bottom: 20px;"><span class="bn" style="font-size: 18px;">
						{{env('APP_NAME')}} চাকরিদাতা এবং চাকরিপ্রার্থীদের মধ্যে যোগাযোগের মাধ্যম
						হিসেবে কাজ করে থাকে। emed.com.bd ওয়েবসাইটের মাধ্যমে চাকরিতে
						আবেদন করা এবং এর পরবর্তি কোনো কার্যক্রম emed.com.bd দ্বারা নিয়ন্ত্রিত নয়। তাই বিজ্ঞাপনদাতা কোম্পানি যদি চাকরিপ্রার্থীদের সাথে কোনো আর্থিক লেনদেন, অনিয়ম বা প্রতারণা করে তার জন্য
						emed.com.bd দায়ী থাকবে না। </span>

					</p>
		<div class="checkbox term-agree"><label><input onclick="applyEnable()" type="checkbox" style="" id="chkApplybtn" value=""><span class="bn" style="font-size: 18px;"> উপরোক্ত সতর্ক বার্তাটি আমি পড়েছি </span>
		<span class="en" style="font-size: 16px !important;"> I have read the above warning message.	</span></label>
		</div>
					<div class="apply-btn text-center" style="margin-top: 25px;">
						@auth
						@if(isAdmin())
						<button id="applyenable" onclick="" data-dismiss="modal" onclick="applyEnable()" class="applyenable btn acptCondition disabled" data-dismiss="modal">
                            <span class="bn">আবেদন</span>

                        </button>
						@else
						<button id="applyenable"  data-dismiss="modal" onclick="applyEnable()"  class="applyenable btn acptCondition disabled" data-dismiss="modal">
                            <span class="bn">আবেদন</span>

                        </button>
						@endif
						@else
						<button  data-toggle="modal" data-target="#login" onclick="show_login()" class="btn acptCondition disabled" data-dismiss="modal"><span class="bn">আবেদন</span><span class="en">Apply</span></button>
						@endauth
					</div>
				</div>

			</div>
		</div>
	</div>
	</div>
	</div>

</section>
</div>


 <!--Login Modal -->
 <div class="modal fade" id="login_modal" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="true">
    <div class="modal-dialog modal-dialog-zoom" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title fw-600">{{ translate('Login')}}</h6>
                <button type="button" onclick="off_chat_modal()" class="close" data-dismiss="modal">
                    <span aria-hidden="true"></span>
                </button>
            </div>
            <div class="modal-body">
                <div class="p-3">
                    <form class="form-default" role="form" action="{{ route('job.login.submit') }}" method="POST">
                        @csrf
                        <div class="form-group">
                            @if (\App\Addon::where('unique_identifier', 'otp_system')->first() != null && \App\Addon::where('unique_identifier', 'otp_system')->first()->activated)
                                <input type="text" class="form-control h-auto form-control-lg {{ $errors->has('email') ? ' is-invalid' : '' }}" value="{{ old('email') }}" placeholder="{{ translate('Email Or Phone')}}" name="email" id="email">
                            @else
                                <input type="email" class="form-control h-auto form-control-lg {{ $errors->has('email') ? ' is-invalid' : '' }}" value="{{ old('email') }}" placeholder="{{  translate('Email') }}" name="email">
                            @endif
                            @if (\App\Addon::where('unique_identifier', 'otp_system')->first() != null && \App\Addon::where('unique_identifier', 'otp_system')->first()->activated)
                                <span class="opacity-60">{{  translate('Use country code before number') }}</span>
                            @endif
                        </div>

                        <div class="form-group">
                            <input type="password" name="password" class="form-control h-auto form-control-lg" placeholder="{{ translate('Password')}}">
                        </div>

                        <div class="row mb-2">
                            <div class="col-6">
                                <label class="aiz-checkbox">
                                    <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}>
                                    <span class=opacity-60>{{  translate('Remember Me') }}</span>
                                    <span class="aiz-square-check"></span>
                                </label>
                            </div>
                            <div class="col-6 text-right">
                                <a href="{{ route('password.request') }}" class="text-reset opacity-60 fs-14">{{ translate('Forgot password?')}}</a>
                            </div>
                        </div>

                        <div class="mb-5">
                            <button type="submit" class="btn btn-primary btn-block fw-600">{{  translate('Login') }}</button>
                        </div>
                    </form>

                    <div class="text-center mb-3">
                        <p class="text-muted mb-0">{{ translate('Dont have an account?')}}</p>
                        <a href="{{ route('user.registration') }}">{{ translate('Register Now')}}</a>
                    </div>
                    @if(get_setting('google_login') == 1 ||
                        get_setting('facebook_login') == 1 ||
                        get_setting('twitter_login') == 1)
                        <div class="separator mb-3">
                            <span class="bg-white px-3 opacity-60">{{ translate('Or Login With')}}</span>
                        </div>
                        <ul class="list-inline social colored text-center mb-5">
                            @if (get_setting('facebook_login') == 1)
                                <li class="list-inline-item">
                                    <a href="{{ route('social.login', ['provider' => 'facebook']) }}" class="facebook">
                                        <i class="lab la-facebook-f"></i>
                                    </a>
                                </li>
                            @endif
                            @if(get_setting('google_login') == 1)
                                <li class="list-inline-item">
                                    <a href="{{ route('social.login', ['provider' => 'google']) }}" class="google">
                                        <i class="lab la-google"></i>
                                    </a>
                                </li>
                            @endif
                            @if (get_setting('twitter_login') == 1)
                                <li class="list-inline-item">
                                    <a href="{{ route('social.login', ['provider' => 'twitter']) }}" class="twitter">
                                        <i class="lab la-twitter"></i>
                                    </a>
                                </li>
                            @endif
                        </ul>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
@section('script')

@if (get_setting('facebook_comment') == 1)
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v9.0&appId={{ env('FACEBOOK_APP_ID') }}&autoLogAppEvents=1" nonce="ji6tXwgZ"></script>
@endif
<script>

function show_chat_modal(){
            @if (Auth::check() == false)
                $('#login_modal').modal('show');
            @endif
        }
        function show_login(){
            $('#login_modal').modal('show');
        }
     function off_chat_modal(){
            @if (Auth::check())
                $('#chat_modal').modal('hide');
            @else
                $('#login_modal').modal('hide');
            @endif
        }


	function printDiv(divName) {
	var printContents = document.getElementById(divName).innerHTML;
	var originalContents = document.body.innerHTML;

	document.body.innerHTML = printContents;

	window.print();

	document.body.innerHTML = originalContents;
	}
//     function applyEnable() {
//   document.getElementById("applyenable").setAttribute("onclick", "location.href='{{env('APP_URL')}}/job/application/{{$jobs->id}}'");
//   document.getElementById("applyenable").removeAttribute("disabled");
// }

$(document).ready(function(){
        $('input[type="checkbox"]').click(function(){
          @auth

                     if($(this).is(":checked")){
                     $(".applyenable").attr("onclick", "location.href='{{env('APP_URL')}}/job/application/{{$jobs->id}}'").removeClass( "disabled" );
            }
                     else if($(this).is(":not(:checked)")){
                $(".applyenable").attr("onclick", "").addClass( "disabled" );
            }

          @endauth
          @guest

                         if($(this).is(":checked")){
                     $(".applyenable").attr("onclick", "location.href='{{url('/users/login')}}'").removeClass( "disabled" );
            }
                         else if($(this).is(":not(:checked)")){
                        $(".applyenable").attr("onclick", "").addClass( "disabled" );
            }
            @endguest
        });
    });
    	// $(document).on('click', '.apply ', function () {
														//     //CreateHTMLPopup_new('BSRM Group of Companies', 1, 924540)

														//     $("#appliTermsModal").modal('show');

														//     $('#appliTermsModal').on('shown.bs.modal', function () {
														//         trapTab("appliTermsModal");
														//     });

														//     $("#appliTermsModal").on('hide.bs.modal', function () {
														//         $(".job-preview .apply .btn").focus();
														//     });
														// })
</script>
@endsection
