@extends('frontend.layouts.app')

@section('content')

<section class="pt-4 mb-4">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 text-center text-lg-left">
                <h1 class="fw-600 h4">{{ translate('All Brands') }}</h1>

        </div>
    </div>
</section>
<section class="mb-4">
    <div class="container">
        <div class="bg-white shadow-sm rounded px-3 pt-3">
            <div class="text-center justify-content-center row row-cols-xxl-6 row-cols-xl-6 row-cols-lg-5 row-cols-md-4 row-cols-2 gutters-10">
                @foreach (\App\Brand::where('id','!=', 0)->get() as $brand)
                    <div class="col">
                        <a href="{{ route('products.brand', $brand->slug) }}" class="d-block p-3 mb-3 border border-light rounded hov-shadow-md">
                            <img src="{{ uploaded_asset($brand->logo) }}" class="lazyload mx-auto h-70px mw-100" alt="{{ $brand->getTranslation('name') }}">
                        </a>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
</section>

@endsection
