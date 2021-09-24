@extends('backend.layouts.app')

@section('content')

<div class="aiz-titlebar text-left mt-2 mb-3">
    <div class="row align-job-center">
        <div class="col-auto">
            <h1 class="h3">{{translate('All Circulers')}}</h1>
        </div>
        {{-- @if($type != 'Seller')
        <div class="col text-right">
            <a href="{{ route('job.create') }}" class="btn btn-circle btn-info">
                <span>{{translate('Add New item')}}</span>
            </a>
        </div>
        @endif --}}
    </div>
</div>
<br>

<div class="card">
    <form class="" id="sort_job" action="" method="GET">
        <div class="card-header row gutters-5">
            <div class="col">
                <h5 class="mb-md-0 h6">{{ translate('All Circulers ') }}</h5>
            </div>

            <div class="dropdown mb-2 mb-md-0">
                <button class="btn border dropdown-toggle" type="button" data-toggle="dropdown">
                    {{translate('Bulk Action')}}
                </button>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="#" onclick="bulk_delete()"> {{translate('Delete selection')}}</a>
                </div>
            </div>

            {{-- @if($type == 'Seller')
            <div class="col-md-2 ml-auto">
                <select class="form-control form-control-sm aiz-selectpicker mb-2 mb-md-0" id="user_id" name="user_id" onchange="sort_job()">
                    <option value="">{{ translate('All Sellers') }}</option>
                    @foreach (App\Seller::all() as $key => $seller)
                        @if ($seller->user != null && $seller->user->shop != null)
                            <option value="{{ $seller->user->id }}" @if ($seller->user->id == $seller_id) selected @endif>{{ $seller->user->shop->name }} ({{ $seller->user->name }})</option>
                        @endif
                    @endforeach
                </select>
            </div>
            @endif
            @if($type == 'All')
            <div class="col-md-2 ml-auto">
                <select class="form-control form-control-sm aiz-selectpicker mb-2 mb-md-0" id="user_id" name="user_id" onchange="sort_job()">
                    <option value="">{{ translate('All Sellers') }}</option>
                        @foreach (App\User::where('user_type', '=', 'admin')->orWhere('user_type', '=', 'seller')->get() as $key => $seller)
                            <option value="{{ $seller->id }}" @if ($seller->id == $seller_id) selected @endif>{{ $seller->name }}</option>
                        @endforeach
                </select>
            </div>
            @endif --}}
            {{-- <div class="col-md-2 ml-auto">
                <select class="form-control form-control-sm aiz-selectpicker mb-2 mb-md-0" name="type" id="type" onchange="sort_job()">
                    <option value="">{{ translate('Sort By') }}</option>
                    <option value="rating,desc" @isset($col_name , $query) @if($col_name == 'rating' && $query == 'desc') selected @endif @endisset>{{translate('Rating (High > Low)')}}</option>
                    <option value="rating,asc" @isset($col_name , $query) @if($col_name == 'rating' && $query == 'asc') selected @endif @endisset>{{translate('Rating (Low > High)')}}</option>
                    <option value="num_of_sale,desc"@isset($col_name , $query) @if($col_name == 'num_of_sale' && $query == 'desc') selected @endif @endisset>{{translate('Num of Sale (High > Low)')}}</option>
                    <option value="num_of_sale,asc"@isset($col_name , $query) @if($col_name == 'num_of_sale' && $query == 'asc') selected @endif @endisset>{{translate('Num of Sale (Low > High)')}}</option>
                    <option value="unit_price,desc"@isset($col_name , $query) @if($col_name == 'unit_price' && $query == 'desc') selected @endif @endisset>{{translate('Base Price (High > Low)')}}</option>
                    <option value="unit_price,asc"@isset($col_name , $query) @if($col_name == 'unit_price' && $query == 'asc') selected @endif @endisset>{{translate('Base Price (Low > High)')}}</option>
                </select>
            </div> --}}
            <div class="col-md-2">
                <div class="form-group mb-0">
                    <input type="text" class="form-control form-control-sm" id="search" name="search"@isset($sort_search) value="{{ $sort_search }}" @endisset placeholder="{{ translate('Type & Enter') }}">
                </div>
            </div>
        </div>

        <div class="card-body">
            <table class="table aiz-table mb-0">
                <thead>
                    <tr>
                        <th>
                            <div class="form-group">
                                <div class="aiz-checkbox-inline">
                                    <label class="aiz-checkbox">
                                        <input type="checkbox" class="check-all">
                                        <span class="aiz-square-check"></span>
                                    </label>
                                </div>
                            </div>
                        </th>
                        <!--<th data-breakpoints="lg">#</th>-->
                        <th>{{translate('Circuler ID')}}</th>
                        <th data-breakpoints="lg">{{translate('Title')}}</th>
                        <th data-breakpoints="md">{{translate('Added By')}}</th>
                        <th data-breakpoints="md">{{translate('Category')}}</th>
                        <th data-breakpoints="lg">{{translate('Published')}}</th>
                        {{-- <th data-breakpoints="lg">{{translate('Featured')}}</th> --}}
                        <th data-breakpoints="sm" class="text-right">{{translate('Options')}}</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($jobs as $key => $item)
                    <tr>


                        <td>
                            <div class="form-group d-inline-block">
                                <label class="aiz-checkbox">
                                    <input type="checkbox" class="check-one" name="id[]" value="{{$item->id}}">
                                    <span class="aiz-square-check"></span>
                                </label>
                            </div>
                        </td>


                     {{-- application id  --}}

                        <td><span class="text-muted text-truncate-2">{{ $item->id }}</span></td>


                    {{-- added by --}}
                        <td>
                            <div class="row gutters-5 w-200px w-md-300px mw-100">
                                <div class="col">

                                    <span class="text-muted text-truncate-2">{{$item->job_title}}</span>
                                </div>
                            </div>
                        </td>




                {{-- title --}}
                             <td>
                         <span class="text-muted text-truncate-2">
                             @if($item->user_id != null)
                            {{ $item->jobuser->name }}
                        @else
                            bad data
                        @endif</span>
                            </td>



                        <td>
                            <label class="aiz-switch aiz-switch-success mb-0">
                                <span class="slider round">{{$item->category->category_name}}</span>
                            </label>
                        </td>
                        <td>
                            <label class="aiz-switch aiz-switch-success mb-0">

                                <span class="slider round">{{$item->created_at->format('d D M Y')}}</span>
                            </label>
                        </td>

                        <td class="text-right">

                            <a class="btn btn-soft-success btn-icon btn-circle btn-sm"  href="{{ route('main.application.show', ['id'=>$item->id , 'slug'=>$item->slug]) }}"  title="{{ translate('View') }}">
                                <i class="las la-eye"></i>
                            </a>
                            <a class="btn btn-soft-primary btn-icon btn-circle btn-sm"  href="{{ route('job.edit', $item->id) }}"  title="{{ translate('Edit') }}">
                                <i class="las la-edit"></i>
                            </a>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            <div class="aiz-pagination">
                {{ $application->links() }}
            </div>
        </div>
    </form>
</div>

@endsection

@section('modal')
    @include('modals.delete_modal')
@endsection


@section('script')
    <script type="text/javascript">

        $(document).on("change", ".check-all", function() {
            if(this.checked) {
                // Iterate each checkbox
                $('.check-one:checkbox').each(function() {
                    this.checked = true;
                });
            } else {
                $('.check-one:checkbox').each(function() {
                    this.checked = false;
                });
            }

        });

        $(document).ready(function(){
            //$('#container').removeClass('mainnav-lg').addClass('mainnav-sm');
        });

        function update_todays_deal(el){
            if(el.checked){
                var status = 1;
            }
            else{
                var status = 0;
            }
            $.post('{{ route('job') }}', {_token:'{{ csrf_token() }}', id:el.value, status:status}, function(data){
                if(data == 1){
                    AIZ.plugins.notify('success', '{{ translate('Todays Deal updated successfully') }}');
                }
                else{
                    AIZ.plugins.notify('danger', '{{ translate('Something went wrong') }}');
                }
            });
        }

        function update_published(el){
            if(el.checked){
                var status = 1;
            }
            else{
                var status = 0;
            }
            $.post('{{ route('job') }}', {_token:'{{ csrf_token() }}', id:el.value, status:status}, function(data){
                if(data == 1){
                    AIZ.plugins.notify('success', '{{ translate('Published job updated successfully') }}');
                }
                else{
                    AIZ.plugins.notify('danger', '{{ translate('Something went wrong') }}');
                }
            });
        }

        function update_featured(el){
            if(el.checked){
                var status = 1;
            }
            else{
                var status = 0;
            }
            $.post('{{ route('job') }}', {_token:'{{ csrf_token() }}', id:el.value, status:status}, function(data){
                if(data == 1){
                    AIZ.plugins.notify('success', '{{ translate('Featured job updated successfully') }}');
                }
                else{
                    AIZ.plugins.notify('danger', '{{ translate('Something went wrong') }}');
                }
            });
        }

        function sort_job(el){
            $('#sort_job').submit();
        }

        function bulk_delete() {
            var data = new FormData($('#sort_job')[0]);
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url: "{{route('job')}}",
                type: 'POST',
                data: data,
                cache: false,
                contentType: false,
                processData: false,
                success: function (response) {
                    if(response == 1) {
                        location.reload();
                    }
                }
            });
        }

    </script>
@endsection
