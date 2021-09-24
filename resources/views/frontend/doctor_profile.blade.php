@extends('frontend.layouts.app')
{{--
@section('meta_title'){{ $user->meta_title }}@stop

@section('meta_description'){{ $user->meta_description }}@stop --}}

@section('meta')
    {{-- <!-- Schema.org markup for Google+ -->
    <meta itemprop="name" content="{{ $user->meta_title }}">
    <meta itemprop="description" content="{{ $user->meta_description }}">
    <meta itemprop="image" content="{{ uploaded_asset($user->logo) }}">

    <!-- Twitter Card data -->
    <meta name="twitter:card" content="website">
    <meta name="twitter:site" content="@publisher_handle">
    <meta name="twitter:title" content="{{ $user->meta_title }}">
    <meta name="twitter:description" content="{{ $user->meta_description }}">
    <meta name="twitter:creator" content="@author_handle">
    <meta name="twitter:image" content="{{ uploaded_asset($user->meta_img) }}"> --}}

    <!-- Open Graph data -->
    {{-- <meta property="og:title" content="{{ $user->meta_title }}" /> --}}
    <meta property="og:type" content="website" />
    {{-- <meta property="og:url" content="{{ route('user.visit', $user->id) }}" /> --}}
    {{-- <meta property="og:image" content="{{ uploaded_asset($user->staff->avatar_original) }}" /> --}}
    {{-- <meta property="og:description" content="{{ $user->meta_description }}" /> --}}
    {{-- <meta property="og:site_name" content="{{ $user->staff->name }}" /> --}}
@endsection

@section('content')




<style>







    body {
    background-color: white;
    margin-top: 20px;
}

.fs35 {
    font-size: 35px !important;
}

.mw50 {
    max-width: 50px !important;
}

.mn {
    margin: 0 !important;
}

.mw140 {
    max-width: 140px !important;
}

.mb20 {
    margin-bottom: 20px !important;
}

.mr25 {
    margin-right: 25px !important;
}

.mw40 {
    max-width: 40px !important;
}

.p30 {
    padding: 30px !important;
}

.page-heading {
    position: relative;
    padding: 30px 40px;
    margin: -25px -20px 25px;
    border-bottom: 1px solid #d9d9d9;
    background-color: #f2f2f2;
    /* margin: 26px; */
}

.page-tabs {
    margin: -25px -20px 30px;
    padding: 15px 25px 0;
    border-bottom: 1px solid #ddd;
    background: #e9e9e9;
}

.page-tabs .nav-tabs {
    border-bottom: 0;
}

.page-tabs .nav-tabs>li>a {
    color: #AAA;
    padding: 10px 20px;
}

.page-tabs .nav-tabs>li:hover>a,
.page-tabs .nav-tabs>li:focus>a {
    border-color: #ddd;
}

.page-tabs .nav-tabs>li.active>a,
.page-tabs .nav-tabs>li.active>a:hover,
.page-tabs .nav-tabs>li.active>a:focus {
    color: #666;
    font-weight: 600;
    background-color: #eee;
    border-bottom-color: transparent;
}

@media (max-width: 800px) {
    .page-tabs {
        padding: 25px 20px 0;
    }

    .page-tabs .nav-tabs li {
        float: none;
        margin-bottom: 5px;
    }

    .page-tabs .nav-tabs li:last-child,
    .page-tabs .nav-tabs li.active:last-child {
        margin-bottom: 10px;
    }

    .page-tabs .nav-tabs>li>a:hover,
    .page-tabs .nav-tabs>li>a:focus {
        border: 1px solid #DDD;
    }

    .page-tabs .nav-tabs>li.active>a,
    .page-tabs .nav-tabs>li.active>a:hover,
    .page-tabs .nav-tabs>li.active>a:focus {
        border-bottom-color: #ddd;
    }
}

.panel {
    position: relative;
    margin-bottom: 27px;
    background-color: #ffffff;
    border-radius: 3px;
}

.panel.panel-transparent {
    background: none;
    border: 0;
    margin: 0;
    padding: 0;
}

.panel.panel-border {
    border-style: solid;
    border-width: 0;
}

.panel.panel-border.top {
    border-top-width: 5px;
}

.panel.panel-border.right {
    border-right-width: 5px;
}

.panel.panel-border.bottom {
    border-bottom-width: 5px;
}

.panel.panel-border.left {
    border-left-width: 5px;
}

.panel.panel-border>.panel-heading {
    background-color: #fafafa;
    border-color: #e2e2e2;
    border-top: 1px solid transparent;
}

.panel.panel-border>.panel-heading>.panel-title {
    color: #999999;
}

.panel.panel-border.panel-default {
    border-color: #DDD;
}

.panel.panel-border.panel-default>.panel-heading {
    border-top: 1px solid transparent;
}

.panel-menu {
    background-color: #fafafa;
    padding: 12px;
    border: 1px solid #e2e2e2;
}

.panel-menu.dark {
    background-color: #f8f8f8;
}

.panel-body .panel-menu {
    border-left: 0;
    border-right: 0;
}

.panel-heading+.panel-menu,
.panel-menu+.panel-body,
.panel-body+.panel-menu,
.panel-body+.panel-body {
    border-top: 0;
}

.panel-body {
    position: relative;
    padding: 15px;
    border: 1px solid #e2e2e2;
}

.panel-body+.panel-footer {
    border-top: 0;
}

.panel-heading {
    position: relative;
    height: 52px;
    line-height: 49px;
    letter-spacing: 0.2px;
    color: #999999;
    font-size: 15px;
    font-weight: 400;
    padding: 0 8px;
    background: #fafafa;
    border: 1px solid #e2e2e2;
    border-top-right-radius: 3px;
    border-top-left-radius: 3px;
}

.panel-heading+.panel-body {
    border-top: 0;
}

.panel-heading>.dropdown .dropdown-toggle {
    color: inherit;
}

.panel-heading .widget-menu .btn-group {
    margin-top: -3px;
}

.panel-heading .widget-menu .form-control {
    margin-top: 6px;
    font-size: 11px;
    height: 27px;
    padding: 2px 10px;
    border-radius: 1px;
}

.panel-heading .widget-menu .form-control.input-sm {
    margin-top: 9px;
    height: 22px;
}

.panel-heading .widget-menu .progress {
    margin-top: 11px;
    margin-bottom: 0;
}

.panel-heading .widget-menu .progress-bar-lg {
    margin-top: 10px;
}

.panel-heading .widget-menu .progress-bar-sm {
    margin-top: 15px;
}

.panel-heading .widget-menu .progress-bar-xs {
    margin-top: 17px;
}

.panel-icon {
    padding-left: 5px;
}

.panel-title {
    padding-left: 6px;
    margin-top: 0;
    margin-bottom: 0;
}

.panel-title>.fa,
.panel-title>.glyphicon,
.panel-title>.glyphicons,
.panel-title>.imoon {
    top: 2px;
    min-width: 22px;
    color: inherit;
    font-size: 14px;
}

.panel-title>a {
    color: inherit;
}

.panel-footer {
    padding: 10px 15px;
    background-color: #fafafa;
    border: 1px solid #e2e2e2;
    border-bottom-right-radius: 2px;
    border-bottom-left-radius: 2px;
}

.panel>.list-group {
    margin-bottom: 0;
}

.panel>.list-group .list-group-item {
    border-radius: 0;
}

.panel>.list-group:first-child .list-group-item:first-child {
    border-top-right-radius: 2px;
    border-top-left-radius: 2px;
}

.panel>.list-group:last-child .list-group-item:last-child {
    border-bottom-right-radius: 2px;
    border-bottom-left-radius: 2px;
}

.panel-heading+.list-group .list-group-item:first-child {
    border-top-width: 0;
}

.panel-body+.list-group .list-group-item:first-child {
    border-top-width: 0;
}

.list-group+.panel-footer {
    border-top-width: 0;
}

.panel>.table,
.panel>.table-responsive>.table,
.panel>.panel-collapse>.table {
    margin-bottom: 0;
}

.panel>.table:first-child,
.panel>.table-responsive:first-child>.table:first-child {
    border-top-right-radius: 2px;
    border-top-left-radius: 2px;
}

.panel>.table:first-child>thead:first-child>tr:first-child td:first-child,
.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child td:first-child,
.panel>.table:first-child>tbody:first-child>tr:first-child td:first-child,
.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child td:first-child,
.panel>.table:first-child>thead:first-child>tr:first-child th:first-child,
.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child th:first-child,
.panel>.table:first-child>tbody:first-child>tr:first-child th:first-child,
.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child th:first-child {
    border-top-left-radius: 2px;
}

.panel>.table:first-child>thead:first-child>tr:first-child td:last-child,
.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child td:last-child,
.panel>.table:first-child>tbody:first-child>tr:first-child td:last-child,
.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child td:last-child,
.panel>.table:first-child>thead:first-child>tr:first-child th:last-child,
.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child th:last-child,
.panel>.table:first-child>tbody:first-child>tr:first-child th:last-child,
.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child th:last-child {
    border-top-right-radius: 2px;
}

.panel>.table:last-child,
.panel>.table-responsive:last-child>.table:last-child {
    border-bottom-right-radius: 2px;
    border-bottom-left-radius: 2px;
}

.panel>.table:last-child>tbody:last-child>tr:last-child td:first-child,
.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child td:first-child,
.panel>.table:last-child>tfoot:last-child>tr:last-child td:first-child,
.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child td:first-child,
.panel>.table:last-child>tbody:last-child>tr:last-child th:first-child,
.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child th:first-child,
.panel>.table:last-child>tfoot:last-child>tr:last-child th:first-child,
.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child th:first-child {
    border-bottom-left-radius: 2px;
}

.panel>.table:last-child>tbody:last-child>tr:last-child td:last-child,
.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child td:last-child,
.panel>.table:last-child>tfoot:last-child>tr:last-child td:last-child,
.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child td:last-child,
.panel>.table:last-child>tbody:last-child>tr:last-child th:last-child,
.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child th:last-child,
.panel>.table:last-child>tfoot:last-child>tr:last-child th:last-child,
.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child th:last-child {
    border-bottom-right-radius: 2px;
}

.panel>.panel-body+.table,
.panel>.panel-body+.table-responsive {
    border-top: 1px solid #eeeeee;
}

.panel>.table>tbody:first-child>tr:first-child th,
.panel>.table>tbody:first-child>tr:first-child td {
    border-top: 0;
}

.panel>.table-bordered,
.panel>.table-responsive>.table-bordered {
    border: 0;
}

.panel>.table-bordered>thead>tr>th:first-child,
.panel>.table-responsive>.table-bordered>thead>tr>th:first-child,
.panel>.table-bordered>tbody>tr>th:first-child,
.panel>.table-responsive>.table-bordered>tbody>tr>th:first-child,
.panel>.table-bordered>tfoot>tr>th:first-child,
.panel>.table-responsive>.table-bordered>tfoot>tr>th:first-child,
.panel>.table-bordered>thead>tr>td:first-child,
.panel>.table-responsive>.table-bordered>thead>tr>td:first-child,
.panel>.table-bordered>tbody>tr>td:first-child,
.panel>.table-responsive>.table-bordered>tbody>tr>td:first-child,
.panel>.table-bordered>tfoot>tr>td:first-child,
.panel>.table-responsive>.table-bordered>tfoot>tr>td:first-child {
    border-left: 0;
}

.panel>.table-bordered>thead>tr>th:last-child,
.panel>.table-responsive>.table-bordered>thead>tr>th:last-child,
.panel>.table-bordered>tbody>tr>th:last-child,
.panel>.table-responsive>.table-bordered>tbody>tr>th:last-child,
.panel>.table-bordered>tfoot>tr>th:last-child,
.panel>.table-responsive>.table-bordered>tfoot>tr>th:last-child,
.panel>.table-bordered>thead>tr>td:last-child,
.panel>.table-responsive>.table-bordered>thead>tr>td:last-child,
.panel>.table-bordered>tbody>tr>td:last-child,
.panel>.table-responsive>.table-bordered>tbody>tr>td:last-child,
.panel>.table-bordered>tfoot>tr>td:last-child,
.panel>.table-responsive>.table-bordered>tfoot>tr>td:last-child {
    border-right: 0;
}

.panel>.table-bordered>thead>tr:first-child>td,
.panel>.table-responsive>.table-bordered>thead>tr:first-child>td,
.panel>.table-bordered>tbody>tr:first-child>td,
.panel>.table-responsive>.table-bordered>tbody>tr:first-child>td,
.panel>.table-bordered>thead>tr:first-child>th,
.panel>.table-responsive>.table-bordered>thead>tr:first-child>th,
.panel>.table-bordered>tbody>tr:first-child>th,
.panel>.table-responsive>.table-bordered>tbody>tr:first-child>th {
    border-bottom: 0;
}

.panel>.table-bordered>tbody>tr:last-child>td,
.panel>.table-responsive>.table-bordered>tbody>tr:last-child>td,
.panel>.table-bordered>tfoot>tr:last-child>td,
.panel>.table-responsive>.table-bordered>tfoot>tr:last-child>td,
.panel>.table-bordered>tbody>tr:last-child>th,
.panel>.table-responsive>.table-bordered>tbody>tr:last-child>th,
.panel>.table-bordered>tfoot>tr:last-child>th,
.panel>.table-responsive>.table-bordered>tfoot>tr:last-child>th {
    border-bottom: 0;
}

.panel>.table-responsive {
    border: 0;
    margin-bottom: 0;
}

.panel-group {
    margin-bottom: 19px;
}

.panel-group .panel-title {
    padding-left: 0;
}

.panel-group .panel-heading,
.panel-group .panel-heading a {
    position: relative;
    display: block;
    width: 100%;
}

.panel-group.accordion-lg .panel+.panel {
    margin-top: 12px;
}

.panel-group.accordion-lg .panel-heading {
    font-size: 14px;
    height: 54px;
    line-height: 52px;
}

.panel-group .accordion-icon {
    padding-left: 35px;
}

.panel-group .accordion-icon:after {
    position: absolute;
    content: "\f068";
    font-family: "FontAwesome";
    font-size: 12px;
    font-style: normal;
    font-weight: normal;
    -webkit-font-smoothing: antialiased;
    color: #555;
    left: 10px;
    top: 0;
}

.panel-group .accordion-icon.collapsed:after {
    content: "\f067";
}

.panel-group .accordion-icon.icon-right {
    padding-left: 10px;
    padding-right: 30px;
}

.panel-group .accordion-icon.icon-right:after {
    left: auto;
    right: 5px;
}

.panel-group .panel {
    margin-bottom: 0;
    border-radius: 3px;
}

.panel-group .panel+.panel {
    margin-top: 5px;
}

.panel-group .panel-heading+.panel-collapse>.panel-body {
    border-top: 0;
}

.panel-group .panel-footer {
    border-top: 0;
}

.panel-group .panel-footer+.panel-collapse .panel-body {
    border-bottom: 1px solid #eeeeee;
}


.media {
    color: #999999;
    font-weight: 600;
    margin-top: 15px;
}

.media:first-child {
    margin-top: 0;
}

.media-right,
.media>.pull-right {
    padding-left: 10px;
}

.media-left,
.media>.pull-left {
    padding-right: 10px;
}

.media-left,
.media-right,
.media-body {
    display: table-cell;
    vertical-align: top;
}

.media-middle {
    vertical-align: middle;
}

.media-bottom {
    vertical-align: bottom;
}

.media-heading {
    color: #555555;
    margin-top: 0;
    margin-bottom: 5px;
}

.media-list {
    padding-left: 0;
    list-style: none;
}

.tab-block {
    position: relative;
}

.tab-block .tab-content {
    overflow: auto;
    position: relative;
    z-index: 10;
    min-height: 125px;
    padding: 16px 12px;
    border: 1px solid #e2e2e2;
    background-color: #FFF;
}

.tab-block .nav-tabs {
    position: relative;
    border: 0;
}

.tab-block .nav-tabs>li {
    float: left;
    margin-bottom: -1px;
}

.tab-block .nav-tabs>li>a {
    z-index: 9;
    position: relative;
    color: #AAA;
    font-size: 14px;
    font-weight: 400;
    padding: 14px 20px;
    margin-right: -1px;
    border-color: #e2e2e2;
    border-radius: 0;
    background: #fafafa;
}

.tab-block .nav-tabs>li:first-child>a {
    margin-left: 0;
}

.tab-block .nav-tabs>li>a:hover {
    background-color: #f4f4f4;
}

.tab-block .nav-tabs>li.active>a,
.tab-block .nav-tabs>li.active>a:hover,
.tab-block .nav-tabs>li.active>a:focus {
    cursor: default;
    position: relative;
    z-index: 12;
    color: #555555;
    background: #FFF;
    border-color: #e2e2e2;
    border-bottom: 1px solid #FFF;
}

.tabs-left {
    float: left;
}

.tabs-left>li {
    float: none;
    margin: 0 -1px -1px 0;
}

.tabs-left>li>a {
    padding: 14px 16px;
    color: #777;
    font-weight: 600;
    border: 1px solid transparent;
    border-color: #DDD;
    background: #fafafa;
}

.tab-block .tabs-left>li.active>a,
.tab-block .tabs-left>li.active>a:hover,
.tab-block .tabs-left>li.active>a:focus {
    color: #555;
    border-color: #DDD #FFF #DDD #DDD;
    cursor: default;
    position: relative;
    z-index: 12;
    background: #FFF;
}

.tabs-right {
    float: right;
}

.tabs-right>li {
    float: none;
    margin: 0 0 -1px -1px;
}

.tabs-right>li>a {
    padding: 14px 16px;
    color: #777;
    font-weight: 600;
    border: 1px solid transparent;
    border-color: #DDD;
    background: #fafafa;
}

.tab-block .tabs-right>li.active>a,
.tab-block .tabs-right>li.active>a:hover,
.tab-block .tabs-right>li.active>a:focus {
    color: #555;
    border-color: #DDD #DDD #DDD #FFF;
    cursor: default;
    position: relative;
    z-index: 12;
    background: #FFF;
}

.tabs-below {
    position: relative;
}

.tabs-below>li {
    float: left;
    margin-top: -1px;
}

.tabs-below>li>a {
    position: relative;
    z-index: 9;
    margin-right: -1px;
    padding: 11px 16px;
    color: #777;
    font-weight: 600;
    border: 1px solid #DDD;
    background: #fafafa;
}

/* nav tab link:hover */
/* nav tab active link:focus:hover */
.tab-block .tabs-below>li.active>a,
.tab-block .tabs-below>li.active>a:hover,
.tab-block .tabs-below>li.active>a:focus {
    cursor: default;
    position: relative;
    z-index: 12;
    color: #555555;
    background: #FFF;
    border-color: #DDD;
    border-top: 1px solid #FFF;
}




.btn-grey{
    background-color:#D8D8D8;
	color:#FFF;
}
.rating-block{
	background-color:#FAFAFA;
	border:1px solid #EFEFEF;
	padding:15px 15px 20px 15px;
	border-radius:3px;
}
.bold{
	font-weight:700;
}
.padding-bottom-7{
	padding-bottom:7px;
}

.review-block{
	background-color:#FAFAFA;
	border:1px solid #EFEFEF;
	padding:15px;
	border-radius:3px;
	margin-bottom:15px;
}
.review-block-name{
	font-size:12px;
	margin:10px 0;
}
.review-block-date{
	font-size:12px;
}
.review-block-rate{
	font-size:13px;
	margin-bottom:15px;
}
.review-block-title{
	font-size:15px;
	font-weight:700;
	margin-bottom:10px;
}
.review-block-description{
	font-size:13px;
}
#btn-sz{
    padding: 3px 9px;
}
</style>










    <section id="content" class="container">


        <div class="row">
    <div class="col-md-12 card mx-auto">
        <div style="margin-bottom: 25px;" class="row d-flex ">

            <div class="col-3 ">
                <img style="    margin-top: 4%;" class="img-thumbnail "
                height="70"
                class="lazyload"
                src="


      @if ($users->gender == 0)
                @if ($users->avatar_original)
                {{ uploaded_asset($users->avatar_original)}}
                @else
                {{ static_asset('assets/img/doctor-place.jpg') }}
            @endif
                @else
                @if ($users->avatar_original)

                {{ uploaded_asset($users->avatar_original)}}
                @else
                {{ static_asset('assets/img/doctor-place-female.jpg') }}
            @endif
     @endif
                "
                alt="{{ $users->name }}"
            >
            </div>


                    <div style="" class="col-9 pl-4 text-left">
                        <h1 style="margin-top: 12px;" class="fw-600 h4 mb-0">{{ $users->name }}
                            @if ($users->email_verified_at != null)
                            <span class="ml-2"><i class="fa fa-check-circle" style="color:green"></i></span>
                            <small> - Verified</small>
                        @else
                            <span class="ml-2"><i class="fa fa-times-circle" style="color:red"></i></span>
                            <small> - Non Verified</small>
                        @endif
                        </h1>
                        {{-- @php
                        $total = 0;
                        $ratings = 0;
                        foreach ($users as $key => $seller_product) {
                         $total += $seller_product->rating->count();
                         $ratings += $seller_product->sum('rating');
                        }
                    @endphp --}}
                        <div class="rating rating-sm mb-1">
                            @if ($users->rating > 0)
                                {{ renderStarRating($users->rating) }}
                            @else
                                {{ renderStarRating(0) }}
                            @endif

                                     {{-- @if ($total > 0)
                                        {{ renderStarRating($ratings/$total) }}
                                    @else
                                        {{ renderStarRating(0) }}
                                    @endif --}}
                        </div>
                        <div class="location opacity-60">{{$users->specialty}}</div>
                        @foreach ($users->educations as $edu )

                            <b style="font-size: 15px" class="">{{ $edu->degree }},&nbsp;</b>
                        @endforeach
                        <div class="mt-3">
                            <button class="btn btn-sm btn-soft-primary" onclick="show_chat_modal()" id="AddClass" >{{ translate('Send Message')}}</button>

                            {{-- onclick="show_chat_modal()" --}}
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">

                <div class="panel">
                    <div class="panel-heading">
                        <span class="panel-icon">
                            <i class="fa fa-head-side-brain"></i>
                        </span>
                        <span class="panel-title"> Specialty</span>
                    </div>
                    <div class="panel-body pb5">
                        {{-- <span class="label label-warning mr5 mb10 ib lh15"> </span> --}}

                        <span ><b class="text-info">{{$users->specialty}}</b></span>

                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <span class="panel-icon">
                            <i class="fas fa-clinic-medical"></i>
                        </span>
                        <span class="panel-title"> Chember</span>
                    </div>
                    <div class="panel-body pb5">
                        {{-- <span class="label label-warning mr5 mb10 ib lh15"> </span> --}}

                        <span ><b class="fs-14 text-info"><i class="fad fa-chair-office"></i> {{$users->chember}}</b></span><br>
                        <span class="text-dark"><i class="text-danger far fa-map-marker-alt"></i> {{$users->chember_address}}</span>

                    </div>
                </div>


                <div class="panel">
                    <div class="panel-heading">
                        <span class="panel-icon">
                            <i class="fa fa-star"></i>
                        </span>
                        <span class="panel-title">Consultation Fee</span>
                    </div>
                    <div class="panel-body pn">
                        <table class="table mbn tc-icon-1 tc-med-2 tc-bold-last">
                            <thead>
                                <tr class="hidden">
                                    <th class="mw30">#</th>
                                    <th>Visit Type</th>
                                    <th>Fee</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <i class="fad fa-stethoscope"></i>
                                    </td>
                                    <td><b>First Visit</b></td>
                                    <td>
                                        <b>৳&nbsp;{{$users->consultution_fee}} Taka </b>
                                       </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="fas fa-user-md-chat"></i>
                                    </td>
                                    <td>	<b>Follow Up</b></td>
                                    <td>
                                        <b>৳&nbsp;{{$users->follow_up_fee}} Taka</b> </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="panel">
                    <div class="panel-heading">
                        <span class="panel-icon">
                            <i class="fa fa-pencil"></i>
                        </span>
                        <span class="panel-title">About {{ $users->name }}</span>
                    </div>
                    <div class="panel-body pb5">



                        <h6>Educations</h6>

@php
    $i = 1;
@endphp
                        @foreach ($users->educations as $edu )
                       <div>
                        <h4>{{$i++}}.&nbsp;{{ $edu->degree }}</h4>
                        <p class="text-muted">{{ $edu->institute }}</p>
                       </div>

                        @endforeach

                        <hr class="short br-lighter">

                        <h6>About Doctor </h6>

                        {{-- <h4>Successful Business</h4> --}}
                        <p class="text-muted pb10">
                            {!! $users->doctor_description !!}
                        </p>

                    </div>
                </div>
            </div>
            <div class="col-md-8">

                <div class="tab-block">
                    {{-- <ul class="nav nav-tabs">
                        <li id="tb" >
                            <a href="#tab1" id="t"  data-toggle="tab">Experience</a>
                        </li>
                        <li id="t2" class="active">
                            <a href="#tab2" data-toggle="tab">Social</a>
                        </li>
                        <li id="t3">
                            <a href="#tab3" data-toggle="tab">Review</a>
                        </li>

                   </ul> --}}





    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Profile</button>
        </li>

    <li class="nav-item" role="presentation">
        <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">Experience</button>
    </li>
    <li class="nav-item" role="presentation">
        <button class="nav-link " id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Review</button>
    </li>

    </ul>
                  <div class="tab-content" id="myTabContent">


                    <div class="tab-pane fade active" id="profile" role="tabpanel" aria-labelledby="profile-tab">






                    </div>


                    <div class="tab-pane fade show " id="home" role="tabpanel" aria-labelledby="home-tab">



                        <div class="container">

                            <div class="row">
                                <div class="col-md-7">

                                        <ul class="list-group list-group-flush">
                                            @foreach ($users->reviews as $key => $review)
                                                {{-- @if($review->user != null) --}}
                                                <li class="media list-group-item d-flex">
                                                    <span class="avatar avatar-md mr-3">
                                                        <img
                                                            class="lazyload"
                                                            src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                            onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                                            @if($review->user->avatar_original !=null)
                                                                data-src="{{ uploaded_asset($review->user->avatar_original) }}"
                                                            @else
                                                                data-src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                            @endif
                                                        >
                                                    </span>
                                                    <div class="media-body text-left">
                                                        <div class="d-flex justify-content-between">
                                                            <h3 class="fs-15 fw-600 mb-0">{{ $review->name }}</h3>
                                                            <span class="rating rating-sm">
                                                                @for ($i=0; $i < $review->rating; $i++)
                                                                    <i class="las la-star active"></i>
                                                                @endfor
                                                                @for ($i=0; $i < 5-$review->rating; $i++)
                                                                    <i class="las la-star"></i>
                                                                @endfor
                                                            </span>
                                                        </div>
                                                        <div class="opacity-60 mb-2">{{ date('d-m-Y', strtotime($review->created_at)) }}</div>
                                                        <p class="comment-text">
                                                            {{ $review->comment }}
                                                        </p>
                                                    </div>
                                                </li>
                                                {{-- @endif --}}
                                            @endforeach
                                        </ul>

                                        @if(count($users->reviews) <= 0)
                                            <div class="text-center fs-18 opacity-70">
                                                {{  translate('There have been no reviews for this Doctor yet.') }}
                                            </div>
                                        @endif

                                        @if(Auth::check())

                                            {{-- @foreach ($detailedProduct->orderDetails as $key => $orderDetail)
                                                @if($orderDetail->order != null && $orderDetail->order->user_id == Auth::user()->id && $orderDetail->delivery_status == 'delivered' && \App\Review::where('user_id', Auth::user()->id)->where('product_id', $detailedProduct->id)->first() == null)
                                                    @php
                                                        $commentable = true;
                                                    @endphp
                                                @endif
                                            @endforeach --}}

                                                <div class="pt-4">
                                                    <div class="border-bottom mb-4">
                                                        <h3 class="fs-17 fw-600">
                                                            {{ translate('Write a review')}}
                                                        </h3>
                                                    </div>
                                                    <form class="form-default" role="form" action="{{ route('doctor.review') }}" method="POST">
                                                        @csrf
                                                        <input type="hidden" name="doctor_id" value="{{ $users->id }}">
                                                        <input type="hidden" name="user_id" value="{{ Auth::user()->id }}">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="" class="text-uppercase c-gray-light">{{ translate('Your name')}}</label>
                                                                    <input type="text" name="name" value="{{ Auth::user()->name }}" class="form-control" >
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="" class="text-uppercase c-gray-light">{{ translate('Email')}}</label>
                                                                    <input type="text" name="email" value="{{ Auth::user()->email }}" class="form-control" >
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="opacity-60">{{ translate('Rating')}}</label>
                                                            <div class="rating rating-input">
                                                                <label>
                                                                    <input type="radio" name="rating" value="1" >
                                                                    <i class="las la-star"></i>
                                                                </label>
                                                                <label>
                                                                    <input type="radio" name="rating" value="2">
                                                                    <i class="las la-star"></i>
                                                                </label>
                                                                <label>
                                                                    <input type="radio" name="rating" value="3">
                                                                    <i class="las la-star"></i>
                                                                </label>
                                                                <label>
                                                                    <input type="radio" name="rating" value="4">
                                                                    <i class="las la-star"></i>
                                                                </label>
                                                                <label>
                                                                    <input type="radio" name="rating" value="5">
                                                                    <i class="las la-star"></i>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="opacity-60">{{ translate('Comment')}}</label>
                                                            <textarea class="form-control" rows="4" name="comment" placeholder="{{ translate('Your review')}}"></textarea>
                                                        </div>

                                                        <div class="text-right">
                                                            <button type="submit" class="btn btn-primary mt-3">
                                                                {{ translate('Submit review')}}
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>





@else

<div class="card">
    <div class="card-body text-center">
        <a class="" href="javascript:void(0)" onclick="show_login()">Log in</a> to submit your review..
    </div>
</div>

                                                @endif


                                </div>

                            </div>



                        </div>













                    </div>




             {{-- Experience --}}
                    <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">

                        <h6>Experience</h6><hr>


                @foreach ($users->experiences as $item )
                <div>
                <span><i class="fad fa-circle"></i>&nbsp;<b class="fs-14">{{ $item->hospital }}</b></span><br>
                <span class="text-muted"><i class="fad fa-clock"> </i> {{Carbon\Carbon::parse($item->employment_period_start)->format('d M Y')}} to {{Carbon\Carbon::parse($item->employment_period_end)->format('d M Y')}}   </span>
                </div>
                {{-- ->format('D d M Y')  --}}
                @endforeach


                    </div>
                  </div>






<script>
    var triggerTabList = [].slice.call(document.querySelectorAll('#myTab a'))
triggerTabList.forEach(function (triggerEl) {
  var tabTrigger = new bootstrap.Tab(triggerEl)

  triggerEl.addEventListener('click', function (event) {
    event.preventDefault()
    tabTrigger.show()
  })
})

//     $(document).ready(function(){
//   $("#t").click(function(){
//     $("#tb").addClass("active");
//   });
//   $("#tab2").click(function(){
//     $("#tab1").removeClass("active");
//     $("#tab2").addClass("active");
//     $("#tab3").removeClass("active");
//   });
//   $("#tab3").click(function(){
//     $("#tab3").addClass("active");
//   });
// });
</script>


                </div>
            </div>
        </div>
    {{-- </section>
</div> --}}

</section>

@section('modal')
{{-- <style>
    .messenger-sendCard {
    display: none;
    position: absolute;

    width: 100%;
    }
    .messenger-sendCard form {
    width: 100%;
    display: inline-flex;

}
</style> --}}



<style>
    .contact-form{
    background: #fff;
    margin-top: 10%;
    margin-bottom: 5%;
    width: 70%;
}
.contact-form .form-control{
    border-radius:1rem;
}
.contact-image{
    text-align: center;
}
.contact-image img{
    border-radius: 6rem;
    width: 11%;
    margin-top: -3%;
    transform: rotate(29deg);
}
.contact-form form{
    padding: 14%;
}
.contact-form form .row{
    margin-bottom: -7%;
}
.contact-form h3{
    margin-bottom: 8%;
    margin-top: -10%;
    text-align: center;
    color: #0062cc;
}
.contact-form .btnContact {
    width: 50%;
    border: none;
    border-radius: 1rem;
    padding: 1.5%;
    background: #dc3545;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
}
.btnContactSubmit
{
    width: 50%;
    border-radius: 1rem;
    padding: 1.5%;
    color: #fff;
    background-color: #0062cc;
    border: none;
    cursor: pointer;
}
</style>

{{-- Chat modal --}}

<div  class="modal fade" id="chat_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div  class="modal-dialog modal-dialog-centered modal-md" id="modal-size" role="document">
        <div style="border: 4px solid #25bcf1" class="modal-xl modal-content position-relative">
            <div class="modal-header">
                <h5 class="modal-title fw-600 h5">{{ translate('Type Your Message')}}</h5>
                <button type="button" onclick="off_chat_modal()" class="close" data-dismiss="chat_modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
    <div class="modal-body">





<div class="contact-image">
    <i style="margin: 0 0 17px 0px;" class=" fa fa-envelope la-4x"></i>
</div>



<form method="POST" action="{{ route('send.message.to') }}" enctype="multipart/form-data">
    @csrf

    <div class="justify-content-center row">
        <div class=" col-md-8">
            <div class="form-group">
            <input value="{{uploaded_asset($item->prescription)}}" type="file" class="form-control file-amount selected-files" name="file" accept="image/*, .txt, .rar, .zip, .pdf" />
            </div>
            <div class="form-group">
                <textarea name="message" class="form-control" placeholder="Your Message *" style="width: 100%; height: 150px;"></textarea>
            </div>
           @auth
           <input type="hidden" name="to_id" value="{{Auth::user()->id}}" id="">
           @endauth
            <div class="form-group">
                <input type="submit" name="btnSubmit" class="btn btn-lg btn-info" value="Send Message" />
            </div>
        </div>

    </div>
</form>
</div>



    </div>
</div>
</div>

    <!-- Modal -->
    <div class="modal fade" id="login_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                        <form class="form-default" role="form" action="{{ route('login') }}" method="POST">
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
<script>
     function show_chat_modal(){
            @if (Auth::check())
                $('#chat_modal').modal('show');
            @else
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

//         $(function(){
// $("#addClass").click(function () {
//           $('#qnimate').addClass('popup-box-on');
//             });

//             $("#removeClass").click(function () {
//           $('#qnimate').removeClass('popup-box-on');
//             });
//   })
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
@endsection

@endsection
