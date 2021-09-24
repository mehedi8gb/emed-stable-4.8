<form id="add_form" class="form-horizontal" action="{{ route('blog.store') }}" method="POST">
    @csrf
<div class="form-group row">
    <label class="col-md-2 col-form-label">
        {{translate('Supplyer Name:')}}
        <span class="text-danger">*</span>
    </label>
    <div class="col-md-3">
        <input type="text" placeholder="{{translate('Supplyer Name')}}" onkeyup="maketp(this.value)" id="supplyer_name" name="supplyer_name" value="{{old('supplyer_name')}}" class="form-control" >
            @error('supplyer_name')
 <div class="alert alert-danger">{{ $message }}</div>
            @enderror

     </div>

          {{-- item_id --}}

    <label class="col-md-2 col-form-label">
        {{translate('Item Id:')}}
        <span class="text-danger">*</span>
    </label>
    <div class="col-md-3">
        <input type="text" placeholder="{{translate('Enter Product Item ID')}}"  id="item_id" name="item_id" value="{{old('item_id')}}" class="form-control" >
            @error('item_id')
 <div class="alert alert-danger">{{ $message }}</div>
            @enderror

     </div>
      {{-- end item_id --}}
</div>



{{--
<div class="form-group row" id="category">
    <label class="col-md-2 col-from-label">
        {{translate('Category:')}}
        <span class="text-danger">*</span>
    </label>
    <div class="col-md-3">
        <select class="form-control aiz-selectpicker" name="category_id" id="category_id" data-live-search="true" >
            <option disabled selected value="">select category</option>
  @foreach ($job_category as $category)
   <option value="{{ $category->id }}" {{  old('category_id') ==  $category->id ? 'selected' : '' }}> {{ $category->category_name }}</option>
            @endforeach
        </select>
        @error('category_id')
 <div class="alert alert-danger">{{ $message }}</div>
            @enderror
    </div> --}}

     {{-- location --}}

    {{-- <label class="col-md-2 col-from-label">
        {{translate('Location:')}}
        <span class="text-danger">*</span>
    </label>
    <div class="col-md-3">
        <select class="form-control aiz-selectpicker" name="location_id" id="location_id" data-live-search="true" >
            <option value="" selected disabled>select location</option>
            @foreach ($job_locations as $item )
    <option value="{{ $item->id }}" {{  old('location_id') ==  $item->id ? 'selected' : '' }}>{{$item->location}}</option>
            @endforeach
        </select>
        @error('location')
 <div class="alert alert-danger">{{ $message }}</div>
            @enderror
    </div>



</div> --}}
{{--End location --}}


{{-- pack --}}
<div class="form-group row">
    <label class="col-md-2 col-form-label">
        {{translate('Pack Size:')}}
        <span class="text-danger">*</span>
    </label>
    <div class="col-md-3">
        <input type="text" placeholder="{{translate('Pack Size')}}"  id="pack" name="pack" value="{{old('pack')}}" class="form-control" >
            @error('pack')
 <div class="alert alert-danger">{{ $message }}</div>
            @enderror

     </div>

{{-- end pack --}}

{{-- avil_unit --}}

    <label class="col-md-2 col-form-label">
        {{translate('Avil Unit:')}}
        <span class="text-danger">*</span>
    </label>
    <div class="col-md-3">
        <input type="text" placeholder="{{translate('Your Avil Unit')}}"  id="avil_unit" name="avil_unit" value="{{old('avil_unit')}}" class="form-control" >
            @error('avil_unit')
 <div class="alert alert-danger">{{ $message }}</div>
            @enderror

     </div>
</div>
{{-- end avil_unit --}}

     {{-- Gender --}}

 <div class="form-group row">
     {{--   <label class="col-md-2 col-form-label">
            {{translate(':')}}
            <span class="text-danger">*</span>
        </label>
        <div class="col-md-3">
            <div class="custom-control custom-radio">
                <input type="radio" class="custom-control-input" id="customControlValidation2" value="1" name="gender"  {{  old('gender') ==  1 ? 'checked' : '' }}>
                <label class="custom-control-label" for="customControlValidation2">Male</label>
                <div class="invalid-feedback">Please check one option</div>
              </div>
              <div class="custom-control custom-radio">
                <input type="radio" class="custom-control-input" id="customControlValidation3" value="2" name="gender"   {{  old('gender') ==  2 ? 'checked' : '' }}>
                <label class="custom-control-label" for="customControlValidation3">Females</label>
                <div class="invalid-feedback">Please check one option</div>
              </div>
              <div class="custom-control custom-radio">
                <input type="radio" class="custom-control-input" id="customControlValidation4" value="3" name="gender"  {{  old('gender') ==  3 ? 'checked' : '' }}>
                <label class="custom-control-label" for="customControlValidation4">Both's</label>
                <div class="invalid-feedback">Please check one option</div>
              </div>

         </div> --}}


   {{-- end Gender --}}


   {{-- vat --}}

    <label class="col-md-2 col-form-label">
        {{translate('Vat:')}}
        <span class="text-danger">*</span>
    </label>
    <div class="col-md-3">
        <input type="number" placeholder="{{translate('vat')}}"  id="vat" name="vat" value="{{old('vat')}}" class="form-control" >
            @error('vat')
 <div class="alert alert-danger">{{ $message }}</div>
            @enderror

     </div>

     <label class="col-md-2 col-form-label">{{translate('Trade Price:')}}
        <span class="text-danger">*</span></label>
    <div class="col-md-3">
        <input type="text" value="{{old('tp')}}" placeholder="{{translate('tp')}}" name="tp" id="tp" class="form-control" >
        @error('tp')
 <div class="alert alert-danger">{{ $message }}</div>
            @enderror
    </div>
</div>
{{-- end vat --}}

{{-- Company Discount --}}
<div class="form-group row">
    <label class="col-md-2 col-form-label">
        {{translate('Company Discount:')}}
        <span class="text-danger">*</span>
    </label>
    <div class="col-md-3">
        <input type="text" placeholder="{{translate('Ex: ')}}"  id="co" name="co" value="{{old('co')}}" class="form-control" >
            @error('co')
 <div class="alert alert-danger">{{ $message }}</div>
            @enderror

     </div>

{{-- End Company Discount --}}

{{-- Other Discount --}}

    <label class="col-md-2 col-form-label">
        {{translate('Other Discount')}}<span class="text-danger">*</span>

    </label>
    <div class="col-md-3">
        <input type="text" placeholder="{{translate('op')}}"  id="op" name="op" value="{{old('op')}}" class="form-control" >
            @error('op')
 <div class="alert alert-danger">{{ $message }}</div>
            @enderror

     </div>

{{-- end Other Discount --}}

 {{-- Employment Status --}}

    {{-- <label class="col-md-2 col-from-label" style="margin-top: 7px ">
        {{translate('Employment Status:')}}
        <span class="text-danger">*</span>
    </label>
    <div class="col-md-2">
        <select class="form-control aiz-selectpicker" name="employment_status" id="employment_status" data-live-search="true" >
            <option value="Full Time"  {{  old('employment_status') ==  'Full Time' ? 'selected' : '' }}>Full Time</option>
            <option value="Part Time"  {{  old('employment_status') ==  'Part Time' ? 'selected' : '' }}>Part Time</option>

        </select>
        @error('employment_status')
 <div class="alert alert-danger">{{ $message }}</div>
            @enderror
    </div>--}}
</div>
{{-- end Employment Status --}}

{{-- nbp --}}
<div class="form-group row">
    <label class="col-md-2 col-form-label">
        {{translate('Net Buying Price:')}}
        <span class="text-danger">*</span>
    </label>
    <div class="col-md-3">
        <input type="text" placeholder="{{translate('')}}"  id="nbp" name="nbp" value="{{old('nbp')}}" class="form-control" >
            @error('nbp')
 <div class="alert alert-danger">{{ $message }}</div>
            @enderror

     </div>

{{-- end date --}}
<label class="col-md-2 col-form-label">
    {{translate("Date:")}}
    <span class="text-danger">*</span>
</label>
<div class="col-md-3">
 <input class="form-control" id="date" name="date" value="{{old('date')}}"  placeholder="MM/DD/YYYY" type="text"/>
 @error('date')
<div class="alert alert-danger">{{ $message }}</div>
    @enderror
</div>
{{-- date --}}

</div>

<div class="form-group mb-0 text-right">
    <button type="submit" class="btn btn-primary">
        {{translate('Save')}}
    </button>
</div>
</form>
