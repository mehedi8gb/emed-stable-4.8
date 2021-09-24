@extends('frontend.layouts.user_panel')

@section('panel_content')
    <div class="aiz-titlebar mt-2 mb-4">
        <div class="h6">
            <span>{{ translate('Conversations With Registerd Doctor')}}</span>
            {{-- @if ($conversation->sender_id == Auth::user()->id && $conversation->receiver->shop != null)
                <a href="{{ route('lab.visit', $conversation->receiver->shop->slug) }}" class="">{{ $conversation->receiver->shop->name }}</a>
            @endif --}}
        </div>
    </div>
    <div class="card">
        {{-- <div class="card-header">
            <h5 class="card-title fs-16 fw-600 mb-0">#{{ $conversation->title }}
            (
                {{ translate('Between you and') }}
                @if ($conversation->sender_id == Auth::user()->id)
                    {{ $conversation->receiver->name }}
                @else
                    {{ $conversation->sender->name }}
                @endif
            )
            </h5>
        </div> --}}

        <div class="card-body">
            <form class="form-horizontal" method="POST" action="{{ route('prescription.store') }}">
                @csrf
                {{-- <div class="form-group row">
                    <label class="col-md-3 col-form-label">{{translate('Name')}}</label>
                    <div class="col-md-9">
                        <input type="text" placeholder="{{translate('Name')}}" id="category_name" name="category_name" class="form-control" required>
                    </div>
                </div> --}}
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

@section('script')
    {{-- <script type="text/javascript">
    function refresh_messages(){
        $.post('{{ route('conversations.refresh') }}', {_token:'{{ @csrf_token() }}', id:'{{ encrypt($conversation->id) }}'}, function(data){
            $('#messages').html(data);
        })
    }

    refresh_messages(); // This will run on page load
    setInterval(function(){
        refresh_messages() // this will run after every 5 seconds
    }, 4000);
    </script> --}}
@endsection
