@extends('frontend.layouts.user_panel')

@section('panel_content')
<style>

        .prescription-message {
    font-size: 14px;
    padding: 10px;
    border: none;
    background-color: #ebebeb;
    margin: 30px auto 5px;
    width: 275px;
}

.prescription {
    width: 250px;
    font-size: 200px;
    cursor: pointer;
}
</style>
    <div class="aiz-titlebar mt-2 mb-4">
      <div class="row align-items-center">
          <div class="col-md-6">
              <b class="h4">{{ translate('Your Prescriptions')}}</b>
          </div>
          <div class="col-md-6 text-md-right">

            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#prescriptionAdd">{{translate('Add New Prescription')}}</button>
            {{-- <a href="{{ route('prescription.add') }}" class="btn btn-primary">
                <span>{{translate('Add New Prescription')}}</span>
            </a> --}}
        </div>
      </div>
    </div>

    <div class="card">
      <div class="card-body">
        <table class="table mb-0 aiz-table">
            <thead>
                <tr><th data-breakpoints="lg">{{translate('Prescription ID')}}</th>
                    <th>{{translate('Prescriptions')}}</th>
                    <th data-breakpoints="lg">{{translate('Upload Time')}}</th>
                    <th class="text-right">{{translate('Options')}}</th>
                </tr>
            </thead>
            <tbody>

                @foreach($prescription as $key => $item)
                @if (Auth::user()->id == $item->user_id)
                <tr>
                    <td>
                        {{$item->id}}
                    </td>


                    <td>
                   <!-- Button trigger modal -->
            <button type="button" class="btn btn-block btn-sm btn-light" data-toggle="modal" data-target="#exampleModal{{$item->id}}">
                Show Prescription
                   </button>
                    </td>
                    <td>
                        {{ $item->created_at }}
                        </td>


                    <td class="text-right">
                        {{-- <a class="btn btn-soft-primary btn-icon btn-circle btn-sm" href="{{ route('item.edit',$item->id)}}" title="{{ translate('Edit') }}">
                            <i class="las la-pen"></i>
                        </a> --}}
                        <button type="button" class="btn btn-soft-primary btn-icon btn-circle btn-sm" data-toggle="modal" data-target="#editModal{{$item->id}}">
                            <i class="las la-pen"></i>
                               </button>

                        <a href="#" class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete" data-href="{{route('prescription.destroy', $item->id)}}" title="{{ translate('Delete') }}">
                            <i class="las la-trash"></i>
                        </a>
                    </td>
                </tr>


                 <!-- Modal -->



 <div class="modal fade" id="exampleModal{{$item->id}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">{{$item->name}}'s Prescription</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
                   <img

                src="{{ static_asset('assets/img/placeholder-rect.jpg') }}"
                data-src=" @if (Auth::user()->id == $item->user_id)
                {{url($item->prescription) }}"
                alt="{{ $item->prescription }}
                @endif "
                class="img-fluid lazyload w-70"
            >
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          {{-- <button type="button" class="btn btn-primary">Save changes</button> --}}
        </div>
      </div>
    </div>
  </div>

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
            <form class="form-horizontal" method="POST" action="{{ route('prescription.update', $item->id) }}">
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
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          {{-- <button type="button" class="btn btn-primary">Save changes</button> --}}
        </div>
      </div>
    </div>
  </div>






  {{-- prescription add modal --}}


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


   @endif
                @endforeach
            </tbody>
        </table>
      </div>
    </div>
    @section('modal')
    @include('modals.delete_modal')




@endsection
    <div class="aiz-pagination">
      	{{ $prescription->links() }}
    </div>

@endsection
