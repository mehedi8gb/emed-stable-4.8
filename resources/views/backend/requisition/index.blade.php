@extends('backend.layouts.app')

@section('content')

<div class="aiz-titlebar text-left mt-2 mb-3">
    <div class="row align-items-center">
        <div class="col-auto">
            <h1 class="h3">{{translate('All Purchase Requisition')}}</h1>
        </div>

        <div class="col text-right">
            <a href="{{ route('requisition.create') }}" class="btn btn-circle btn-info">
                <span>{{translate('Add New Requisition')}}</span>
            </a>
        </div>

        <table class="m-3 table mb-0 ">
            <thead>
                <tr>

                    <th data-breakpoints="lg">ORDER ID</th>
                    <th data-breakpoints="md">SN</th>
                    <th data-breakpoints="lg">Date</th>
                    <th data-breakpoints="lg">AMA</th>

                </tr>
            </thead>

        </table>
    </div>


</div>
<table class="table-bordered table-hover table ">
    <thead>
        <tr>
            <th data-breakpoints="lg">Order ID:</th>
            <th data-breakpoints="md">DATE:</th>
            <th data-breakpoints="lg">SUPPLYER NAME:</th>
        </tr>
    </thead>

</table>


<div class="card">
    <form class="" id="sort_blogs" action="" method="GET">
        <div class="card-header row gutters-5">
            <div class="col text-center text-md-left">
                <h5 class="mb-md-0 h6">{{ translate('All Purchase Requisition') }}</h5>
            </div>

            <div class="col-md-2">
                <div class="form-group mb-0">
                    <input type="text" class="form-control form-control-sm" id="search" name="search"@isset($sort_search) value="{{ $sort_search }}" @endisset placeholder="{{ translate('Type & Enter') }}">
                </div>
            </div>
        </div>
        </form>
        <div class="card-body">
            <table id="table" class="table mb-0 aiz-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>{{translate('Item Id')}}</th>
                        <th data-breakpoints="lg">{{translate('Item Name')}}</th>
                        <th data-breakpoints="lg">{{translate('Pack')}}</th>
                        <th data-breakpoints="lg">{{translate('Avil Unit')}}</th>
                        <th class="text-right">{{translate('VAT')}}</th>
                        <th data-breakpoints="lg">{{translate('Trade Price')}}</th>
                        <th data-breakpoints="lg">{{translate('Company Discount')}}</th>
                        <th data-breakpoints="lg">{{translate('Other Discount')}}</th>
                        <th data-breakpoints="md">{{translate('Options')}}</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($blogs as $key => $blog)
                    <tr>
                        <td>
                            {{ ($key+1) + ($blogs->currentPage() - 1) * $blogs->perPage() }}
                        </td>
                        <td>
                            {{ $blog->title }}
                        </td>
                        <td>
                            @if($blog->category != null)
                                {{ $blog->category->category_name }}
                            @else
                                --
                            @endif
                        </td>
                        <td>
                            {{ $blog->short_description }}
                        </td>
                        <td>
                            <label class="aiz-switch aiz-switch-success mb-0">
                                <input type="checkbox" onchange="change_status(this)" value="{{ $blog->id }}" <?php if($blog->status == 1) echo "checked";?>>
                                <span></span>
                            </label>
                        </td>
                        <td>
                            {{ $blog->title }}
                        </td>
                        <td>
                            @if($blog->category != null)
                                {{ $blog->category->category_name }}
                            @else
                                --
                            @endif
                        </td>
                        <td>
                            {{ $blog->short_description }}
                        </td>
                        <td>
                            <label class="aiz-switch aiz-switch-success mb-0">
                                <input type="checkbox" onchange="change_status(this)" value="{{ $blog->id }}" <?php if($blog->status == 1) echo "checked";?>>
                                <span></span>
                            </label>
                        </td>
                        <td class="text-right">
                            <a class="btn btn-soft-primary btn-icon btn-circle btn-sm" href="{{ route('blog.edit',$blog->id)}}" title="{{ translate('Edit') }}">
                                <i class="las la-pen"></i>
                            </a>

                            <a href="#" class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete" data-href="{{route('blog.destroy', $blog->id)}}" title="{{ translate('Delete') }}">
                                <i class="las la-trash"></i>
                            </a>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            <div class="aiz-pagination">
                {{ $blogs->links() }}
            </div>
        </div>
</div>

@endsection

@section('modal')
    @include('modals.delete_modal')
@endsection


@section('script')

    <script type="text/javascript">
        function change_status(el){
            var status = 0;
            if(el.checked){
                var status = 1;
            }
            $.post('{{ route('blog.change-status') }}', {_token:'{{ csrf_token() }}', id:el.value, status:status}, function(data){
                if(data == 1){
                    AIZ.plugins.notify('success', '{{ translate('Change blog status successfully') }}');
                }
                else{
                    AIZ.plugins.notify('danger', '{{ translate('Something went wrong') }}');
                }
            });
        }
//         $(document).ready( function () {
//     $('#table').DataTable();
// } );
    </script>

@endsection
