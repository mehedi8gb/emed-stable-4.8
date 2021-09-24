@extends('frontend.layouts.user_panel')

@section('panel_content')
    <div class="aiz-titlebar mt-2 mb-4">
        <div class="h6">
            <span>{{ translate('Add Prescription')}}</span>

        </div>
    </div>
    <div class="card">


        <div class="card-body">
            <form class="form-horizontal" method="POST" action="{{ route('prescription.store') }}">
                @csrf

                <div class="form-group row">
                    <label class="col-md-3 col-form-label">{{translate('Message')}}</label>
                    <div class="col-md-9">
                        <input type="text" placeholder="{{translate('Your Message')}}" id="message" name="message" class="form-control">
                        @error('message')
                 <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-md-3 col-form-label" for="signinSrEmail">
                        {{translate('Prescription')}}
                        <small>(1300x650)</small>
                    </label>
                    <div class="col-md-9">
                        <div class="input-group" data-toggle="aizuploader" data-type="image">
                            <div class="input-group-prepend">
                                <div class="input-group-text bg-soft-secondary font-weight-medium">
                                    {{ translate('Browse')}}
                                </div>

                            </div>

                            <div class="form-control file-amount">{{ translate('Choose File') }}</div>
                            <input type="hidden" name="prescription" class="selected-files">

                        </div>
                        @error('prescription')
                        <div class="alert alert-danger">{{ $message }}</div>
                                   @enderror
                        <div class="file-preview box sm">
                        </div>
                    </div>
                </div>

                <div class="form-group mb-0 text-right">
                    <button type="submit" class="btn btn-primary">
                        {{translate('Save')}}
                    </button>
                </div>
            </form>
        </div>
    </div>
@endsection


