@extends('frontend.layouts.app')

@section('content')
@php
 $item = App\JobApplication::where('user_id', Auth::user()->id)->latest()->first();
 $items = App\Jobs::where('id', $item->circuler_id)->first();
  @endphp
<div class="jumbotron text-center">
    <h1 class="display-3">Thank You!</h1>
    <p class="lead"><strong>Your Application ID: {{ $item->id }}</strong></p>
    <p class="lead"><strong>Please check your email</strong> for further instructions on how to complete your application and <b>Send your CV for the verification.</b></p>
    <hr>
    <p>
      Having trouble? <a href="mailto:{{env('ADMIN_EMAIL')}}">Contact us</a>
    </p>
    <p class="lead">
      <a class="btn btn-primary btn-sm" href="{{env('APP_URL')}}" role="button">Go Home</a>
      <a class="btn btn-primary btn-sm" href="mailto:{{$items->email}}?subject=For the post as a {{ $item->job_title}} of {{ $items->company }}&body=Attach your CV. and sent it to the author." data-html="true" role="button">Send CV</a>
    </p>
  </div>
@endsection
