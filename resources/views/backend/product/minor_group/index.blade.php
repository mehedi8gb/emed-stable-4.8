@extends('backend.layouts.app')

@section('content')
<div class="aiz-titlebar text-left mt-2 mb-3">
    <div class="row align-items-center">
        <div class="col-md-6">
            <h1 class="h3">{{translate('Dosage Form Group')}}</h1>
        </div>
        <div class="col-md-6 text-md-right">
            <a href="{{ route('minor.group.create') }}" class="btn btn-primary">
                <span>{{translate('Add New Dosage Form')}}</span>
            </a>
        </div>
    </div>
</div>
 <div class="card">
    <div class="card-header d-block d-md-flex">
        <h5 class="mb-0 h6">{{ translate('Dosage Form') }}</h5>
        <form class="" id="sort_minor_group" action="" method="GET">
            <div class="box-inline pad-rgt pull-left">
                <div class="" style="min-width: 200px;">
                    {{-- <input type="text" class="form-control" id="search" name="search"@isset($sort_search) value="{{ $sort_search }}" @endisset placeholder="{{ translate('Type name & Enter') }}"> --}}
                </div>
            </div>
        </form>
    </div>
    <div class="card-body">
        <table class="table aiz-table mb-0">
            <thead>
                <tr>
                    <th data-breakpoints="lg">#</th>
                    <th>{{translate('Name')}}</th>
                    <th data-breakpoints="lg">{{ translate('Icon') }}</th>
                    {{-- <th data-breakpoints="lg">{{ translate('Order Level') }}</th> --}}
                    {{-- <th data-breakpoints="lg">{{ translate('Level') }}</th> --}}
                    {{-- <th data-breakpoints="lg">{{translate('Banner')}}</th> --}}
                    <th data-breakpoints="lg">{{translate('Slug')}}</th>
                    {{-- <th data-breakpoints="lg">{{translate('Featured')}}</th> --}}
                    {{-- <th data-breakpoints="lg">{{translate('Commission')}}</th> --}}
                    <th width="10%" class="text-right">{{translate('Options')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($minor_group as $key => $category)
                    <tr>
                        <td>
                            {{$minor_group->firstItem()+$loop->index }}
                            {{-- {{ $minor_group->firstItem()+$loop->index }} --}}
                            {{-- {{ ($key+1) + ($minor_group->currentPage() - 1)*$minor_group->perPage() }} --}}
                        </td>
                        <td>{{ $category->name }}</td>
                        {{-- <td>
                            @php
                                $parent = \App\Category::where('id', $category->parent_id)->first();
                            @endphp
                            @if ($parent != null)
                                {{ $parent->getTranslation('name') }}
                            @else
                                —
                            @endif
                        </td> --}}
			{{-- <td>{{ $category->order_level }}</td>
			<td>{{ $category->level }}</td> --}}
                        {{-- <td>
                            @if($category->banner != null)
                                <img src="{{ uploaded_asset($category->banner) }}" alt="{{translate('Banner')}}" class="h-50px">
                            @else
                                —
                            @endif
                        </td> --}}
                        <td>
                            @if($category->icon != null)
                                <span class="avatar avatar-square avatar-xs">
                                    <img src="{{ uploaded_asset($category->icon) }}" alt="{{translate('icon')}}">
                                </span>
                            @else
                                —
                            @endif
                        </td>
                        {{-- <td>
                            <label class="aiz-switch aiz-switch-success mb-0">
                                <input type="checkbox" onchange="update_featured(this)" value="{{ $category->id }}" >
                                <span></span>
                            </label>
                        </td> --}}
                        <td> <a href="{{ url('dosage-form/'.$category->slug) }}" target="_blank" rel="noopener noreferrer">{{$category->slug}}</a></td>
                        <td class="text-right">
                            <a class="btn btn-soft-primary btn-icon btn-circle btn-sm" href="{{route('minor_group.edit', ['id'=>$category->id, 'lang'=>env('DEFAULT_LANGUAGE')] )}}" title="{{ translate('Edit') }}">
                                <i class="las la-edit"></i>
                            </a>
                            <a href="#" class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete" data-href="{{route('minor_group.destroy', $category->id)}}" title="{{ translate('Delete') }}">
                                <i class="las la-trash"></i>
                            </a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        <div class="aiz-pagination">
            {{ $minor_group->links() }}
        </div>
    </div>
</div>
@endsection


@section('modal')
    @include('modals.delete_modal')
@endsection


@section('script')
    {{-- <script type="text/javascript">
        function update_featured(el){
            if(el.checked){
                var status = 1;
            }
            else{
                var status = 0;
            }
            $.post('{{ route('minor_group.featured') }}', {_token:'{{ csrf_token() }}', id:el.value, status:status}, function(data){
                if(data == 1){
                    AIZ.plugins.notify('success', '{{ translate('Featured minor_group updated successfully') }}');
                }
                else{
                    AIZ.plugins.notify('danger', '{{ translate('Something went wrong') }}');
                }
            });
        }
    </script> --}}
@endsection
