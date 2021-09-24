@extends('frontend.layouts.user_panel')

@section('panel_content')
@php

@endphp
<div class="aiz-titlebar text-left mt-2 mb-3">
    <div class="row align-items-center">
        <div class="col-auto">
            <h1 class="h3">{{translate('All Circulers')}}</h1>
        </div>
        {{-- <div class="col text-right">
            <a href="{{ route('user.job.store') }}" class="btn btn-circle btn-info">
                <span>{{translate('Add Job Circuler')}}</span>
            </a>
        </div> --}}
    </div>
</div>
<br>

<div class="card">
    <form class="" id="sort_blogs" action="" method="GET">
        <div class="card-header row gutters-5">
            <div class="col text-center text-md-left">
                <h5 class="mb-md-0 h6">{{ translate('All Circulers') }}</h5>
            </div>

            <div class="col-md-2">
                <div class="form-group mb-0">
                    <input type="text" class="form-control form-control-sm" id="search" name="search"@isset($sort_search) value="{{ $sort_search }}" @endisset placeholder="{{ translate('Type & Enter') }}">
                </div>
            </div>
        </div>
        </form>
        <div class="card-body">
            <table class="table mb-0 aiz-table">
                <thead>
                    <tr>
                        <th style="width: 7%">Application ID</th>
                        <th style="width: 7%">{{translate('Author')}}</th>
                        <th style="width: 7%">{{translate('Title')}}</th>
                        <th style="width: 9%" data-breakpoints="lg">{{translate('Category')}}</th>
                        <th style="width: 3%" data-breakpoints="lg">{{translate('Status')}}</th>
                        <th style="width: 10%" data-breakpoints="lg">{{translate('Application Placed')}}</th>
                        <th style="width: 5%"class="text-right">{{translate('Options')}}</th>

                    </tr>
                </thead>
                <tbody>

                    @foreach($data as $item)
                    <tr>
                        <td>
                            {{ $item->id }}
                        </td>
                        <td>
                            @if($item->user_id != null)
                            {{ $item->user->name }}
                        @else
                            no user
                        @endif
                        </td>
                        <td>
                            {{ $item->job_title }}
                        </td>
                        <td>
                            @if($item->category_id != null)
                                {{ $item->categories->category_name }}
                            @else
                                --
                            @endif
                        </td>
                        <td>
                            <label class="aiz-switch aiz-switch-success mb-0" id="statuss">

                                    @if($item->status == '1')
                                    <a href="#" data-html="true" class="text-dark" data-animation="true" data-toggle="tooltip" data-placement="top" title="<b>Application Pending</b>">
                                <span class="text-warning"> <b>{{ translate('Pending') }}</b></span></a>
                                @endif
                                    @if($item->status == '2')
                                    <a href="#" data-html="true" class="text-dark" data-animation="true" data-toggle="tooltip" data-placement="top" title="<b>Approved 😊</b>">
                                <span class="text-success"> <b> {{ translate('Approved') }}</b></span></a>
                                @endif
                                @if($item->status == '0')
                            <a href="mailto:{{env('ADMIN_EMAIL')}}" data-html="true" class="text-dark" data-animation="true" data-toggle="tooltip" data-placement="top" title="Apply again with accurate data">
                            <span class="text-danger"> <b>{{ translate('Canceled') }}</b></span></a>
                            @endif


                            </label>
                        </td>
                        <td>
                            <label class="aiz-switch aiz-switch-success mb-0">
                                @if ($item->created_at == null)
                                    <span class="text-danger">Time Not Set</span>
                                    @else
                                    {{ $item->created_at->format('d M Y') }}
                                @endif

                            </label>
                        </td>
                        {{-- <td>
                            <label class="aiz-switch aiz-switch-success mb-0">
                                @if ($item->updated_at == null)
                                    <span class="text-danger">Time Not Set</span>
                                    @else
                                    {{ $item->updated_at->diffForHumans() }}
                                @endif

                            </label>
                        </td> --}}
                        <td class="text-right">
                            <a data-html="true" data-animation="true" data-toggle="tooltip" data-placement="top" title="<b>View Application</b>"
                             class="btn btn-soft-primary btn-icon btn-circle btn-sm" href="{{ route('cus.application.show',$item->id)}}" title="{{ translate('View') }}">
                                <i class="las la-eye"></i>
                            </a>
                            @if ($item->status == '1' || $item->status == '2')
                            <button disabled title="You cant delate approved Application"
                            class="btn btn-soft-danger btn-icon btn-circle btn-sm" title="{{ translate('Delete') }}">
                               <i class="las la-trash"></i>
                           </button>
                               @else
                               <a data-html="true" data-animation="true" data-toggle="tooltip" data-placement="bottom" title="<b>Delate Application</b>"
                                class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete" data-href="{{route('cus.application.destroy', $item->id)}}" title="{{ translate('Delete') }}">
                                   <i class="las la-trash"></i>
                               </a>
                            @endif
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            <div class="aiz-pagination">
                {{ $data->links() }}
            </div>
        </div>
</div>

@endsection

@section('modal')
    @include('modals.delete_modal')
@endsection


@section('script')

<script type="text/javascript">
    // function change_status(el){
    //     var status = 0;
    //     if(el.checked){
    //         var status = 1;
    //     }
    //     $.post('{{ url('/customer/job/change-status/') }}', {_token:'{{ csrf_token() }}', id:el.value, status:status}, function(data){
    //         if(data == 1){
    //             AIZ.plugins.notify('success', '{{ translate('Circuler status Changed successfully') }}');
    //         }
    //         else{
    //             AIZ.plugins.notify('danger', '{{ translate('Something went wrong') }}');
    //         }
    //     });
    // }
    $('#statuss').tooltip('show')
</script>

@endsection
