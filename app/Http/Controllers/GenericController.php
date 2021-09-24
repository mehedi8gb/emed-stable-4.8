<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Generic;
use Carbon\Carbon;
use Illuminate\Support\Facades\Artisan;

class GenericController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $generic = Generic::orderBy('created_at', 'desc')->latest()->paginate(10);
        return view('backend.product.generic.index', compact('generic'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $generics = Generic::all();
        return view('backend.product.generic.create', compact('generics'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $Generic = new Generic;
        $Generic->name = $request->name;
        $Generic->description = $request->description;
        $Generic->meta = $request->meta;
        $Generic->slug = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', $request->slug));
        $Generic->created_at = Carbon::now();
        $Generic->save();
        flash(translate('Generic has been inserted successfully'))->success();
        Artisan::call('view:clear');
        Artisan::call('cache:clear');
        return Redirect()->route('generic.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $generics = Generic::findOrFail($id);
        return view('backend.product.generic.edit', compact('generics'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $Generic = Generic::findOrFail($id);
        $Generic->name = $request->name;
        $Generic->description = $request->description;
        $Generic->meta = $request->meta;
        $Generic->slug = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', $request->slug));
        $Generic->created_at = Carbon::now();
        $Generic->save();
        flash(translate('Generic has been updated successfully'))->success();
        Artisan::call('view:clear');
        Artisan::call('cache:clear');
        return Redirect()->route('generic.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $generic = Generic::FindOrFail($id);
        $generic->delete();

        flash(translate('Generic has been deleted successfully'))->success();
        Artisan::call('view:clear');
        Artisan::call('cache:clear');
        return Redirect()->route('generic.index');
    }
}
