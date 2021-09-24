<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use Carbon\Carbon;
use App\User;
use App\seller_company_based_discount;
use Illuminate\Http\Request;
use Symfony\Component\VarDumper\Cloner\Data;

class seller_company_based_discountController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $brands = Brand::with('company_discount')->get();
        $data = seller_company_based_discount::with('brands')->get();
        $user = User::with('company_discount')->get();
        return view('frontend.user.seller.company.index' , compact('data' , 'brands', 'user'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function add(Request $request)
    {


        $request->validate([

            'discount' => 'required|integer|between:12,100',
            'brand_id' => 'required'
        ],
    [
        'discount.between' => 'The discount must be at least 12%.'
    ]);

        $data = new seller_company_based_discount;
        $data->user_id = $request->user_id;
        $data->brand_id = $request->brand_id;
        $data->discount = $request->discount;
        $data->created_at = Carbon::now();
        $data->save();

        flash(translate('Company Based Discount has been save successfully'))->success();
        return Redirect()->route('company_based_discount');



    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
        //
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

        $request->validate([

            'discount' => 'required|integer|between:12,100',

        ],
    [
        'discount.between' => 'The discount must be at least 12%.'
    ]);

        $data = seller_company_based_discount::find($id);
        $data->user_id = $request->user_id;
        $data->discount = $request->discount;
        $data->updated_at = Carbon::now();
        $data->save();

        flash(translate('Company Based Discount has been updated successfully'))->success();
        return Redirect()->route('company_based_discount');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
