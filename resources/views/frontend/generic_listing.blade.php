@extends('frontend.layouts.app')

@section('content')
<style>
    .generic-card:hover{
        -webkit-box-shadow: 9px 9px 33px 5px rgba(153, 192, 192, 0.94);
-moz-box-shadow: 9px 9px 33px 5px rgba(153, 192, 192, 0.94);
box-shadow: 9px 9px 33px 5px rgba(153, 192, 192, 0.94);
    }
</style>
<section class="pt-4 mb-4">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 text-center text-lg-left">
                <h1 class="fw-600 h4">{{ translate('All Generics') }}</h1>
            </div>
            {{-- <div class="col-lg-6">
                <ul class="breadcrumb bg-transparent p-0 justify-content-center justify-content-lg-end">
                    <li class="breadcrumb-item opacity-50">
                        <a class="text-reset" href="{{ route('home') }}">{{ translate('Home')}}</a>
                    </li>
                    <li class="text-dark fw-600 breadcrumb-item">
                        <a class="text-reset" href="{{ route('doctors') }}">"{{ translate('Generics') }}"</a>
                    </li>
                </ul>
            </div>
        </div> --}}
    </div>
</section>
<section class="mb-2">
    <div class="container">
        <div class="row align-items-center justify-content-center gutters-10 row-cols-xxl-4 row-cols-xl-4 row-cols-lg-3 row-cols-md-2 row-cols-1">
            @foreach ($generic as $key => $item)

        <div class="bg-white hov-bg-soft-primary  m-3 border border-light rounded has-transition">
             <a  href="{{ url('generic', $item->slug).'/'.$item->id  }}" class="text-reset" tabindex="0">
                {{-- <div class="row generic-card "> --}}
                    <div class=" border-left border-light">
                        <div class="p-3 text-left">

                            <h2 class="h6 fw-600 text-truncate">
                                {{ $item->name }}
                            </h2>
                            <div class="rating rating-sm mb-2">
                                <span class="text-dark"> {{ $item->products->count() }} available @choice('brand|brands', $item->products->count())</span>
                            </div>
                        </div>
                    </div>
                {{-- </div> --}}
             </a>
        </div>


                @endforeach

            <div class="aiz-pagination aiz-pagination-center mt-4">
                {{ $generic->links() }}
            </div>
        </div>
    </div>
 </section>

@endsection
