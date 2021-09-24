@extends('frontend.layouts.app')

@section('content')
<link rel="stylesheet" href="https://ithemeslab.com/tfdemo/joomla/medipuls/components/com_sppagebuilder/assets/css/sppagebuilder.css?4710e5ca557f7a06d9456c8c1a37f82a">
<link rel="stylesheet" href="https://ithemeslab.com/tfdemo/joomla/medipuls/templates/itl_medipuls/local/css/template.css">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Maven+Pro&display=swap');

body {
    font-family: 'Maven Pro', sans-serif
}

body {
    background-color: #eee
}

.add {
    border-radius: 20px
}

.card {
    border: none;
    border-radius: 10px;
    transition: all 1s;
    cursor: pointer;

}

.card:hover {
    -webkit-box-shadow: 3px 5px 17px -4px #777777;
    box-shadow: 3px 5px 17px -4px #777777;

}

.ratings i {
    color: green
}

.apointment button {
    border-radius: 20px;
    background-color: #eee;
    color: #000;
    border-color: #eee;
    font-size: 13px
}
#ProdileBG {
        background: rgb(201, 229, 255);
/* background: radial-gradient(circle, rgba(175, 210, 238, 0.24) 71%, rgba(255,255,255,1) 100%); */

border: 1px solid rgba(0, 174, 255, 0.336);


}
</style>
<section class="pt-4 mb-4">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 text-center text-lg-left">
                <h1 class="fw-600 h4">{{ translate('All Doctors') }}</h1>
            </div>
            {{-- <div class="col-lg-6">
                <ul class="breadcrumb bg-transparent p-0 justify-content-center justify-content-lg-end">
                    <li class="breadcrumb-item opacity-50">
                        <a class="text-reset" href="{{ route('home') }}">{{ translate('Home')}}</a>
                    </li>
                    <li class="text-dark fw-600 breadcrumb-item">
                        <a class="text-reset" href="{{ route('doctors') }}">"{{ translate('All Staffs & Doctors') }}"</a>
                    </li>
                </ul>
            </div> --}}
        </div>
    </div>
</section>




<div class="container mt-5 mb-5">
    @auth
    @if(Auth::user()->user_type == 'admin')
    <div class="d-flex justify-content-between mb-3"> <span>Doctors</span> <button onclick="location.href='{{ route('staffs.create') }}'"; class="btn btn-success add">Add Doctors</button> </div>
    @else

    @endif
    @endauth





    {{-- <div class="sppb-row-container"> --}}
        <div class="sppb-section-title sppb-text-left">
            <h3 class="sppb-title-heading">Meet <br>our doctors</h3>
            <p class="sppb-title-subheading">We provide the highest quality care to each patient</p>
        </div>
        <div class="sppb-row">
            @foreach ($doctor as $key => $staff)
            <div class="sppb-col-sm-3 col-12 col-md-3 pb-4">
                <div id="column-id-1628410055" class="sppb-column">

                    <div class="sppb-column-addons">

                        <div id="sppb-addon-1628410056" class="clearfix">
                            {{-- <a href="{{ route('doctor.visit', $staff->user->id) }}" class="stretched-link"> --}}
                            <div class="team-member sppb-text-left ">
                                <div class="team-image img-fluid h-md-300px">

                                    <a href="{{ route('doctor.visit', $staff->user->id) }}">
                                    @if ($staff->user->gender == 0)
                                    <img class="img-top img-thumbnail lazyload" src="{{ static_asset('assets/img/doctor-place.jpg') }}" data-src="{{ uploaded_asset($staff->user->avatar_original) }}" alt="{{ $staff->user->name }}">
                                    @else
                                    <img class="img-top img-thumbnail lazyload" src="{{ static_asset('assets/img/doctor-place-female.jpg') }}" data-src="{{ uploaded_asset($staff->user->avatar_original) }}" alt="{{ $staff->user->name }}">
                                    @endif

                                    </a>
                                 </div>
                                <div class="team-info">

                                    <a class="text-light" href="{{ route('doctor.visit', $staff->user->id) }}" class="d-block p-3" tabindex="0">
                                        <h4>{{ $staff->user->name }}</h4>
                                        <div class="rating rating-sm mb-1">
                                            @if ($staff->user->rating > 0)
                                                {{ renderStarRating($staff->user->rating) }}
                                            @else
                                                {{ renderStarRating(0) }}
                                            @endif
                                        </div>
                                    </a>
                                    <span class="team-designation">{{ $staff->user->specialty }}</span>
                                </div>
                                <div style="height: 150px" class="team-text"><strong>Dept: {{ $staff->user->depertment }}</strong><br>
                                    MBBS, FCPS (Medicine), <br>MSCP (USA), MD(USA) <br>
                                    @foreach ($staff->educations as $item)
                                    {{$item->degree}}
                                    @break
                                    {{-- @if ($item->degree->count() >= 2)
                                    {{$item->degree}}
                                    @break
                                    @else
{{$item->degree}}
                                    @endif --}}

                                    @endforeach
                                </div>
                                <div class="team-social-icons text-black">
                                    <ul>
                                        <button class="btn btn-sm btn-soft-primary" onclick="show_chat_modal()" id="AddClass" >{{ translate('Send Message')}}</button>
                                        {{-- <li><button class="btn btn-sm btn-soft-primary">Book Appointment</button></li>
                                        <li><a class="" ><i class="fal fa-phone-square-alt"></i></a></li> --}}
                                       {{--  <li><a target="_blank" href="#"><i class="fa fa-google-plus"></i></a></li>
                                        <li><a target="_blank" href="#"><i class="fa fa-pinterest"></i></a></li> --}}
                                    </ul>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>
            </div>
            @endforeach


        </div>
    </div>




</div>


    {{-- <div class="row g-2">
        @foreach ($doctor as $key => $staff)

        <div class="col-md-3">

            <div id="ProdileBG" class="card p-2 py-3 text-center">
                <a href="{{ route('doctor.visit', $staff->user->id) }}" class="stretched-link">

                <div class="img mb-2">
                    <a class="text-light" href="{{ route('doctor.visit', $staff->user->id) }}" class="d-block p-3" tabindex="0">
                    <img src="
                    @if ($staff->user->avatar_original)
                        {{uploaded_asset($staff->user->avatar_original)}}
                    @else
                        {{ static_asset('assets/img/placeholder-rect.jpg') }}
                    @endif
                    "
                    alt="{{ $staff->user->name }}"
                    width="70" class="lazyload rounded-circle"
                    >
                    </a>
                 </div>
                <h5 class="mb-0">{{ $staff->user->name }}</h5> <small>{{ $staff->user->specialty }}</small><br>
                <span>
                @foreach ($staff->educations as $item)
                {{ $item->degree }},
                @endforeach
                </span>

                <div class="ratings mt-2">

                @if ($staff->user->rating == 1 || $staff->user->rating == 2 || $staff->user->rating == 3 || $staff->user->rating == 4 || $staff->user->rating == 5)
                <i class="fad fa-star"></i>
                            @else
                            <i class="fal fa-star"></i>
                            @endif
                @if ($staff->user->rating == 2 || $staff->user->rating == 3 || $staff->user->rating == 4 || $staff->user->rating == 5)
                <i class="fad fa-star"></i>
                            @else
                            <i class="fal fa-star"></i>
                            @endif
                @if ($staff->user->rating == 3  || $staff->user->rating == 4 || $staff->user->rating == 5)
                <i class="fad fa-star"></i>
                            @else
                            <i class="fal fa-star"></i>
                            @endif
                @if ($staff->user->rating == 4 || $staff->user->rating == 5)
                <i class="fad fa-star"></i>
                            @else
                            <i class="fal fa-star"></i>
                            @endif
                @if ($staff->user->rating == 5)
                <i class="fad fa-star"></i>
                            @else
                            <i class="fal fa-star"></i>
                            @endif





               </div>
                <div class="mt-4 apointment"> <button class="btn btn-success text-uppercase">Book Appointment</button> </div>
            </a>
            </div>

    </div>

@endforeach
        </div>

    </div> --}}
{{-- </div> --}}




{{-- <section class="mb-2">
    <div class="container">
            <div class="row gutters-10 row-cols-xxl-3 row-cols-xl-3 row-cols-lg-2 row-cols-md-2 row-cols-1">
                @foreach ($doctor as $key => $staff)

                    <div class="col">
                        <div class="row no-gutters bg-white align-items-center border border-light rounded hov-shadow-md mb-3 has-transition">
                            <div class="col-4">
                                <a href="{{ route('doctor.visit', $staff->user->id) }}" class="d-block p-3" tabindex="0">
                                    <img
                                        src="{{ static_asset('assets/img/placeholder-rect.jpg') }}"
                                        data-src="{{ uploaded_asset($staff->user->avatar_original) }}"
                                        alt="{{ $staff->user->name }}"
                                        class="img-fluid lazyload"
                                        onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder-rect.jpg') }}';"
                                    >
                                </a>
                            </div>
                            <div class="col-8 border-left border-light">
                                <div class="p-3 text-left">
                                    <h2 class="h6 fw-600 text-truncate">
                                        <a href="{{route('doctor.visit',$staff->user->id)}}" class="text-reset" tabindex="0">{{ $staff->user->name }}</a>
                                    </h2>
                                    <div class="rating rating-sm mb-2">

                                    </div>
                                    <a href="{{ route('doctor.visit', $staff->user->id) }}" class="btn btn-soft-primary btn-sm" tabindex="0">
                                        {{ translate('Visit Profile') }}
                                        <i class="las la-angle-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            <div class="aiz-pagination aiz-pagination-center mt-4">

            </div>
        </div>
    </section> --}}



    <div class="modal fade" id="prescriptionAdd" tabindex="-1" role="dialog" aria-labelledby="prescriptionAddModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content border-info border-width-4">
                <div class="modal-header bg-info">
                    <div class="prescription-new-header" style="text-align: center; width: 100%; font-size:16px;"> <b class="text-white">{{translate('Add Prescription for Order')}}</b> </div>
                    <button type="button"  class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                </div>
                <div class="modal-body text-align-center">


                    <form class="form-horizontal" method="POST" action="{{ route('prescription.store') }}"  enctype="multipart/form-data">
                        @csrf



                    <div style="padding-top: 20px; text-align: center;">
                        <div style="display: flex; align-items: center; justify-content: center;">

                            @if (\App\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->code == 'bd')
                            <img id="output" src="https://cdn.osudpotro.com/project_assets/addphoto.png" alt="Add prescriptions" style="width: inherit; position: relative;" class="img-fluid">
                            @else
                            <img id="output" src="http://localhost/4.8/public/uploads/all/aIbFBEN9v6L3E7kjkRYc2mtTCnXubNwQIKTzGWE6.jpg" alt="Add prescriptions" style="width: inherit; position: relative;" class="img-fluid">
                            @endif

                            <input type="file"  onchange="loadFile(event)" name="prescription" class="prescription" style="opacity: 0; overflow: hidden; position: absolute;">



                            <script>
                              var loadFile = function(event) {
                                var output = document.getElementById('output');
                                output.src = URL.createObjectURL(event.target.files[0]);
                                output.onload = function() {
                                  URL.revokeObjectURL(output.src) // free memory
                                }
                              };
                            </script>




                        </div>
                        <input type="text" name="message" class="prescription-message" placeholder="{{translate('Your Message')}}">
                        @error('prescription')
                                <div class="alert alert-danger">{{ $message }}</div>
                                           @enderror
                    </div>
                </div>
                <div class="guest-modal-footer modal-footer" style="justify-content: center;">
                    <button type="submit" class="guest-modal-footer-button btn btn-info">Add Prescription</button>
                </div>
            </form>


            </div>
        </div>
      </div>



    @endsection


