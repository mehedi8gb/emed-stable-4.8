@extends('frontend.layouts.user_panel')

@section('panel_content')

<div class="aiz-titlebar text-left mt-2 mb-3">
	<div class="align-items-center">
			<h1 class="h3">All Brands</h1>
            <div class="card">
<div class="card-body">
    {{-- <form action="{{route('company_based_discount.update', $item->id)}}" method="post">
        @csrf
        <input type="hidden" name="user_id" value="{{Auth::user()->id}}">
        @foreach ($brands as $item)
        <input type="hidden" name="brand_id" value="{{$item->id}}">
        @endforeach
        <input type="hidden" name="discount" value="12">
        <input type="submit" value="Click to Update Your Discount" class="ml-5 btn btn-soft-primary btn-sm">
    </form> --}}



    @error('discount')
    <div class="alert alert-danger">{{ $message }}</div>
        @enderror</div>
            </div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="card">
		    <div class="card-header row gutters-5">
				<div class="col text-center text-md-left">
					<h5 class="mb-md-0 h6">Brands</h5>
				</div>
				<div class="col-md-12">
					<form class="" id="sort_brands" action="" method="GET">
						{{-- <div class="input-group input-group-sm">
					  		<input type="text" class="form-control" id="search" name="search"@isset($sort_search) value="{{ $sort_search }}" @endisset placeholder="{Type name & Enter') }}">
						</div> --}}
					</form>
				</div>
		    </div>
		    <div class="card-body">

                {{-- edit start  --}}

		        <table class="table aiz-table mb-0">


                            <div class="row  fw-600">
                                <div class="col-1"> #</div>
                                <div class="col-7"> Name</div>
                                <div class="col-3">  Discount</div>
                                <div class="col-1"> {{ translate('Update')}}</div>

                            </div>

		            <tbody>
		                @foreach($data as $key => $item)


                        <tr>
		                        <td>{{ ($key+1) }}</td>
		                        <td>{{ $item->brands->name }}


                                </td>
                                <td>

                           <form  method="post" action="{{route('company_based_discount.update', $item->id)}}">


                            @csrf
                            <input type="hidden" name="user_id" value="{{Auth::user()->id}}">


                        <div class="input-group float-right col-md-6">
                        <input  name="discount" type="number" lang="en"  class="form-control" id="od" value="{{ $item->discount }}">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroupPrepend">%</span>
                        </div>


                           <input type="submit" value="update" class="ml-5 btn btn-soft-primary btn-sm">

                            </div>

                                    </form>
                                </td>

		                </tr>


		                @endforeach
		            </tbody>
		        </table>


                {{-- Add Start --}}

                <table class="table aiz-table mb-0">


                    <div class="row  fw-600">
                        <div class="col-1"> #</div>
                        <div class="col-7"> Name</div>
                        <div class="col-3">  Discount</div>
                        <div class="col-1 float-right"> {{ translate('Save')}}</div>

                    </div>







            <tbody>


               @foreach($brands as $key => $item)
               <tr>
                       <td>{{ ($key+1) }}</td>
                       <td>{{ $item->name }}</td>
                       <td>


                  <form  method="post" action="{{route('company_based_discount.add')}}">


                                   @csrf
                                   <input type="hidden" name="user_id" value="{{Auth::user()->id}}">
                                   <input type="hidden" name="brand_id" value="{{$item->id}}">

                   <div class="input-group float-right col-md-7">
                   <input  name="discount" type="number" lang="en"  value="" class="form-control" id="od" placeholder="{{ translate('Discount Value') }}">
                   <div class="input-group-prepend">
                       <span class="input-group-text" id="inputGroupPrepend">%</span>
                   </div>


{{-- {{$item->user_id == Auth::user()->id? 'bal':'bas' }} --}}





                  <input type="submit"  value="Save" class="ml-5 btn btn-soft-primary btn-sm">

                   </div>

                           </form>
                       </td>



               </tr>



               @endforeach

            </tbody>
        </table>
		        <div class="aiz-pagination">
                	{{-- {{ $brands->appends(request()->input())->links() }} --}}
            	</div>
		    </div>
		</div>
	</div>
	{{-- <div class="col-md-5">
		<div class="card">
			<div class="card-header">
				<h5 class="mb-0 h6">Add New Brand</h5>
			</div>
			<div class="card-body">
				<form action="{{ route('brands.store') }}" method="POST">
					@csrf
					<div class="form-group mb-3">
						<label for="name">Name</label>
						<input type="text" placeholder="Name" name="name" class="form-control" required>
					</div>
					<div class="form-group mb-3">
						<label for="name">Logo <small>120x80</small></label>
						<div class="input-group" data-toggle="aizuploader" data-type="image">
							<div class="input-group-prepend">
									<div class="input-group-text bg-soft-secondary font-weight-medium">Browse</div>
							</div>
							<div class="form-control file-amount">Choose File</div>
							<input type="hidden" name="logo" class="selected-files">
						</div>
						<div class="file-preview box sm">
						</div>
					</div>
					<div class="form-group mb-3">
						<label for="name">Meta Title</label>
						<input type="text" class="form-control" name="meta_title" placeholder="Meta Title">
					</div>
					<div class="form-group mb-3">
						<label for="name">Meta Description</label>
						<textarea name="meta_description" rows="5" class="form-control"></textarea>
					</div>
					<div class="form-group mb-3 text-right">
						<button type="submit" class="btn btn-primary">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div> --}}
</div>

@endsection

@section('modal')
    @include('modals.delete_modal')
@endsection

@section('script')
<script type="text/javascript">
    function sort_brands(el){
        $('#sort_brands').submit();
    }
</script>
@endsection
