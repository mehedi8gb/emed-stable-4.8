<?php

namespace App\Http\Controllers;
use App\District;
use App\Division;
use App\Upazila;
use App\Postoffice;
use Illuminate\Http\Request;

class EducationlevelController extends Controller
{
    public function myformAjax($DivisionId)
    {
        $id=Division::select('id')->where('id', $DivisionId)->first();
        $citys = District::where('DivisionId',$id['id'])->pluck("name","id");
        return json_encode($citys);
    }
    public function upazila($DistrictId)
    {
        $id=District::select('id')->where("id", $DistrictId)->first();
        $citys = Upazila::where('DistrictId',$id['id'])->pluck("name","id");
        return json_encode($citys);
    }
    public function postoffice($upazila_id)
    {
        $citys=Postoffice::where("name", $upazila_id)->pluck("code","id");
        return json_encode($citys);
    }
}
