@extends('backend.layouts.app')

@section('content')

<div class="aiz-titlebar text-left mt-2 mb-3">
    <div class="row align-items-center">
        <div class="col-auto">
            <h1 class="h3">{{translate('Prescriptions')}}</h1>
            {{-- <div class="card">
                @foreach ($count as $data)
                {{ count($data->id) }}
                @endforeach

            </div> --}}
        </div>
        <div class="col text-right">
            <a href="{{ route('prescriptions.add') }}" class="btn btn-circle btn-info">
                <span>{{translate('Add Prescription')}}</span>
            </a>
        </div>
    </div>
</div>
<br>

    <div class="card">
        <div class="card-header row gutters-5">
            <div class="col-md-3">
        <form class="" id="sort_prescriptions" action="" method="GET">

                    <div class="form-group mb-0">
                        <input type="text" class="aiz-date-range form-control form-control-sm" id="search" name="date"@isset($date_search) value="{{ $date_search }}" @endisset placeholder="{{ translate('Date') }}">
                    </div>

            </form>
        </div>
        <div class="col-md-3">
        <form class="" id="sort_prescriptions" action="" method="GET">

                    <div class="form-group mb-0">
                        <input type="text" class="form-control form-control-sm" id="search" name="user"@isset($user_search) value="{{ $user_search }}" @endisset placeholder="{{ translate('User') }}">
                    </div>

            </form>
        </div>
            <div class="col-md-3">
        <form class="" id="sort_prescriptions" action="" method="GET">

                    <div class="form-group mb-0">
                        <input type="text" class="form-control form-control-sm" id="search" name="p"@isset($p_search) value="{{ $p_search }}" @endisset placeholder="{{ translate('Prescription search') }}">
                    </div>

            </form>
        </div>
        <div class="col-md-3">
        <form class="" id="sort_prescriptions" action="" method="GET">

                    <div class="form-group mb-0">
                        <input type="text" class="form-control form-control-sm" id="search" name="proceed"@isset($proceed_search) value="{{ $proceed_search }}" @endisset placeholder="{{ translate('Proceed By') }}">
                    </div>

            </form>
        </div>
        </div>
      <div class="card-body">
        <table class="table mb-0 aiz-table">
            <thead>
                <tr>
                    <th>{{translate('Date')}}</th>
                    <th>{{translate('Prescription ID')}}</th>
                    <th>{{translate('User ID')}}</th>
                    <th>{{translate('User Name')}}</th>
                    <th data-breakpoints="lg">{{translate('Prescription')}}</th>
                    <th data-breakpoints="md">{{translate('Proceed by')}}</th>
                    <th >{{translate('Proceed Time')}}</th>
                    <th >{{translate('Order ID')}}</th>
                    <th class="text-right">{{translate('Options')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($prescription as $key => $item)
                <tr>
                    <td>
                        {{ \Carbon\Carbon::parse($item->created_at)->format('d/m/Y')}}
                        </td>
                        <td>
                            {{$item->id}}
                        </td>
                    <td>
                        {{-- {{ ($key+1) + ($prescription->currentPage() - 1) * $prescription->perPage() }} --}}
                        {{  $item->user_id  }}
                    </td>
                    <td>

                        {{  $item->name  }}
                    </td>
                    <td>

            <!-- Button trigger modal -->
            <button type="button" class="{{$item->action_taken_at == null ? 'btn-danger':'btn-info' }} btn btn-sm " data-toggle="modal" data-target="#exampleModal{{$item->id}}">
                 Show Prescription
                    </button>
                    </td>
<td>

    {{ $item->proceed->name }} @if ($item->proceed->id != 2)
    ( {{$item->proceed_by}} )
    @endif



</td>
<td>
    {{ $item->action_taken_at  }}
</td>
<td>
    {{$item->order_id}}
</td>
                    <td class="text-right">
                        {{-- <a class="btn btn-soft-primary btn-icon btn-circle btn-sm" href="{{ route('item.edit',$item->id)}}" title="{{ translate('Edit') }}">
                            <i class="las la-pen"></i>
                        </a> --}}
                        <button type="button" class="btn btn-soft-primary btn-icon btn-circle btn-sm" data-toggle="modal" data-target="#editModal{{$item->id}}">
                            <i class="las la-pen"></i>
                               </button>
                        <a href="#" class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete" data-href="{{route('prescriptions.destroy', $item->id)}}" title="{{ translate('Delete') }}">
                            <i class="las la-trash"></i>
                        </a>
                    </td>
                </tr>

 <!--View  Modal -->
 <div class="modal fade" id="exampleModal{{$item->id}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">{{$item->name}}'s Prescription</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <div class="text-center">

                <img

                src="{{ static_asset('assets/img/placeholder-rect.jpg') }}"
                data-src="{{ url($item->prescription) }}"
                alt="{{ url($item->prescription) }}"
                class="img-fluid lazyload w-70"
            >
            </div>

            <p>



                    <ul class="list-group list-group-flush">
                        {{-- @foreach($conversation->messages as $message) --}}
                            <li class="list-group-item px-0">
                                <div class=" media mb-2">

                                  <div class="media-body row">
                                    <div class="ml-0 mb-2 col-md-3">
                                        <img class="img-fluid avatar avatar-square" src="{{uploaded_asset($item->user->avatar_original) }}" alt="">

                                    </div>
                                    <div class="col-md-9 mb-2">
                                        <h6>About Patient</h6><hr>
                                        <b>Name: {{$item->user->name}}</b> <br>
                                        <a href="tel:{{$item->user->phone}}">Call Now: {{$item->user->phone}}</a>
                                    </div>


                                        @if ($item->message != null)

                                        <div class="p-3 col-md-12 bg-soft-primary">{{ $item->message }}</div>
                                        @endif

                                  </div>

                                </div>

                            </li>

                        {{-- @endforeach --}}
                    </ul>

            </p>
        </div>
        <div class="modal-footer">
            <div class="mt-3">

            </div>
            <form method="POST" action="{{ route('prescriptions.proceed', $item->id)}}">
                @csrf

                <input type="hidden" name="proceed_by" value="{{ Auth::user()->id}}" id="proceed_by">
                {{-- @if ($item->procced_by == null) --}}

                <button type="submit" class="btn btn-primary">
                    {{translate('proceed')}}
                </button>
                {{-- @else
                <button class="btn btn-primary">
                    {{translate('proceeded by').$item->procced->name}}
                </button>
                @endif --}}
            </form>
            <button class="btn btn-secondary" onclick="show_chat_modal()">{{ translate('Send Message')}}</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          {{-- <button type="button" class="btn btn-primary">Save changes</button> --}}
        </div>
      </div>
    </div>
  </div>


<!--edit  Modal -->
  <div class="modal fade" id="editModal{{$item->id}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">{{$item->name}}'s Prescription</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <form class="form-horizontal" method="POST" action="{{ route('prescriptions.update', $item->id) }}">
                @csrf

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
                            <input type="hidden" name="prescription" value="{{$item->prescription}}" class="selected-files">
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
    </div>
  </div>

{{-- Chat modal --}}

  <div  class="modal fade" id="chat_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div  class="modal-dialog modal-dialog-centered modal-md" id="modal-size" role="document">
        <div style="border: 4px solid #25bcf1" class="modal-xl modal-content position-relative">
            <div class="modal-header">
                <h5 class="modal-title fw-600 h5">{{ translate('Type Your Message')}}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
    <div class="modal-body">
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




<div class="contact-image">
    <i style="margin: 0 0 17px 0px;" class=" fa fa-envelope la-4x"></i>
</div>



<form method="POST" action="{{ route('pres.message.to') }}" enctype="multipart/form-data">
    @csrf

    <div class="justify-content-center row">
        <div class=" col-md-8">
            <div class="form-group">
            <input value="{{uploaded_asset($item->prescription)}}" type="file" class="form-control file-amount selected-files" name="file" accept="image/*, .txt, .rar, .zip, .pdf" />
            </div>
            <div class="form-group">
                <textarea name="message" class="form-control" placeholder="Your Message *" style="width: 100%; height: 150px;"></textarea>
            </div>
            <input type="hidden" name="to_id" value="{{$item->user->id}}" id="">
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
</div>

                @endforeach
            </tbody>
        </table>
      </div>
    </div>
    @section('modal')
    @include('modals.delete_modal')
    @section('script')

    <script>

function show_chat_modal(){
            @if (Auth::check())
                $('#chat_modal').modal('show');
            @else
                $('#login_modal').modal('show');
            @endif
        };


        function change_status(el){
        var status = 0;
        if(el.checked){
            var status = 1;
        }
        $.post('{{ route('job.change-status') }}', {_token:'{{ csrf_token() }}', id:el.value, status:status}, function(data){
            if(data == 1){
                AIZ.plugins.notify('success', '{{ translate('Circuler status Changed  successfully') }}');
            }
            else{
                AIZ.plugins.notify('danger', '{{ translate('Something went wrong') }}');
            }
        });
    }
    </script>
    @endsection

@endsection
    <div class="aiz-pagination">
      	{{-- {{ $prescription->links() }} --}}
    </div>

@endsection
