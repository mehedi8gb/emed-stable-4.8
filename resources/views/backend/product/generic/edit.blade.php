@extends('backend.layouts.app')

@section('content')
<script src="https://cdn.tiny.cloud/1/qa89kfyojc6mam94pyc8rmg1wfitpjdabx5dd7pd14hwwmap/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<div class="row">
    <div class="col-lg-12 mx-auto">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0 h6">{{translate('Generic Information')}}</h5>
            </div>
            <div class="card-body">
                <form class="form-horizontal" action="{{ route('generic.update', $generics->id) }}" method="POST" enctype="multipart/form-data">
                	@csrf
                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">{{translate('Name:')}}<span class="text-danger">*</span></label>

                        <div class="col-md-9">
                            <input type="text" placeholder="{{translate('Generic Name')}}" value="{{$generics->name}}" onkeyup="makeSlug(this.value)" id="title" name="name" class="form-control">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-md-3 col-from-label">
                            {{translate('Generic Description:')}}
                            <span class="text-danger">*</span>
                        </label>
                        <div class="col-md-9">
                            <textarea class="" name="description">{{$generics->description}}</textarea>
                            @error('description')
                     <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">{{translate('Meta Title:')}}</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="meta" value="{{$generics->meta}}" placeholder="{{translate('Meta Title')}}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">{{translate('Slug:')}}</label>
                        <div class="col-md-9">
                            <input type="text" value="{{$generics->slug}}" name="slug" id="slug" class="form-control">
                        </div>
                    </div>

                    <div class="form-group mb-0 text-right">
                        <button type="submit" class="btn btn-primary">{{translate('Save')}}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    tinymce.init({
      selector: 'textarea',
      plugins: 'advlist autolink lists link image charmap print preview hr anchor pagebreak',
      toolbar_mode: 'floating',
   });
   function makeSlug(val) {
        let str = val;
        let output = str.replace(/\s+/g, '-').toLowerCase();
        $('#slug').val(output);
    }
  </script>
@endsection
