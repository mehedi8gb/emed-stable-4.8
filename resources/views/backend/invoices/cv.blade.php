<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laravel</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="UTF-8">
    	<!-- Favicon -->
	<link rel="icon" href="{{ uploaded_asset(get_setting('site_icon')) }}">
	<title>{{ get_setting('website_name').' | '.get_setting('site_motto') }}</title>

	<!-- google font -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700">

       <!-- FontAwesome -->
       <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@0ac23ca/css/all.css" rel="stylesheet" type="text/css"/>

       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

<link rel="stylesheet" href="{{ asset('assets/css/vendors.css') }}">

	<style media="all">
        @page {
			margin: 0;
			padding:0;
		}
		body{
			font-size: 0.875rem;
            font-family: '<?php echo  $font_family ?>';
            font-weight: normal;
            direction: <?php echo  $direction ?>;
            text-align: <?php echo  $text_align ?>;
			padding:0;
			margin:0;
		}

        @import url("https://fonts.googleapis.com/css?family=Montserrat:400,500,700&display=swap");

div.cv {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  list-style: none;
  font-family: "Montserrat", sans-serif;
}

div.cv {
  background: #ffff;
  font-size: 14px;
  line-height: 22px;
  color: #555555;
}

.bold {
  font-weight: 700;
  font-size: 20px;
  text-transform: uppercase;
}

.semi-bold {
  font-weight: 500;
  font-size: 16px;
}

.resume {
  width: 800px;
  height: auto;
  display: flex;
  margin: 0px 10px auto;
}

.resume .resume_left {
  width: 340px;
  background: #0bb5f4;
}

.resume .resume_left .resume_profile {
  width: 100%;
  height: 280px;
}

.resume .resume_left .resume_profile img {
  width: 100%;
  height: 100%;
}

.resume .resume_left .resume_content {
  padding: 0 25px;
}

.resume .title {
  margin-bottom: 20px;
}

.resume .resume_left .bold {
  color: #fff;
}

.resume .resume_left .regular {
  color: #b1eaff;
}

.resume .resume_item {
  padding: 25px 0;
  border-bottom: 2px solid #b1eaff;
}

.resume .resume_left .resume_item:last-child,
.resume .resume_right .resume_item:last-child {
  border-bottom: 0px;
}

.resume .resume_left ul li {
  display: flex;
  margin-bottom: 10px;
  align-items: center;
}

.resume .resume_left ul li:last-child {
  margin-bottom: 0;
}

.resume .resume_left ul li .icon {
  width: 35px;
  height: 35px;
  background: #fff;
  color: #0bb5f4;
  border-radius: 50%;
  margin-right: 15px;
  font-size: 16px;
  position: relative;
}

.resume .icon i,
.resume .resume_right .resume_hobby ul li i {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.resume .resume_left ul li .data {
  color: #b1eaff;
}

.resume .resume_left .resume_skills ul li {
  display: flex;
  margin-bottom: 10px;
  color: #b1eaff;
  justify-content: space-between;
  align-items: center;
}

.resume .resume_left .resume_skills ul li .skill_name {
  width: 25%;
}

.resume .resume_left .resume_skills ul li .skill_progress {
  width: 60%;
  margin: 0 5px;
  height: 5px;
  background: #009fd9;
  position: relative;
}

.resume .resume_left .resume_skills ul li .skill_per {
  width: 15%;
}

.resume .resume_left .resume_skills ul li .skill_progress span {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  background: #fff;
}

.resume .resume_left .resume_social .semi-bold {
  color: #fff;
  margin-bottom: 3px;
}

.resume .resume_right {
  width: 520px;
  background: #fff;
  padding: 25px;
}

.resume .resume_right .bold {
  color: #0bb5f4;
}

.resume .resume_right .resume_work ul,
.resume .resume_right .resume_education ul {
  padding-left: 40px;
  overflow: hidden;
}

.resume .resume_right ul li {
  position: relative;
}

.resume .resume_right ul li .date {
  font-size: 16px;
  font-weight: 500;
  margin-bottom: 15px;
}

.resume .resume_right ul li .info {
  margin-bottom: 20px;
}

.resume .resume_right ul li:last-child .info {
  margin-bottom: 0;
}

.resume .resume_right .resume_work ul li:before,
.resume .resume_right .resume_education ul li:before {
  content: "";
  position: absolute;
  top: 5px;
  left: -25px;
  width: 6px;
  height: 6px;
  border-radius: 50%;
  border: 2px solid #0bb5f4;
}

.resume .resume_right .resume_work ul li:after,
.resume .resume_right .resume_education ul li:after {
  content: "";
  position: absolute;
  top: 14px;
  left: -21px;
  width: 2px;
  height: 115px;
  background: #0bb5f4;
}

.resume .resume_right .resume_hobby ul {
  display: flex;
  justify-content: space-between;
}

.resume .resume_right .resume_hobby ul li {
  width: 80px;
  height: 80px;
  border: 2px solid #0bb5f4;
  border-radius: 50%;
  position: relative;
  color: #0bb5f4;
}

.resume .resume_right .resume_hobby ul li i {
  font-size: 30px;
}

.resume .resume_right .resume_hobby ul li:before {
  content: "";
  position: absolute;
  top: 40px;
  right: -52px;
  width: 50px;
  height: 2px;
  background: #0bb5f4;
}

.resume .resume_right .resume_hobby ul li:last-child:before {
  display: none;
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
</head>
<body>
<div class="row">
    <div class="col-md-12 text-left justify-content-center">



    @php
$expe = \App\experience::where('user_id', $application->user_id)->where('set_default', 1)->first()
@endphp

<div class="cv">

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


    </div>
</div>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
</body>
</html>
