<?php

namespace App;

use App\Models\Brand;
use Illuminate\Database\Eloquent\Model;

class seller_company_based_discount extends Model
{
    public function brands()
    {
    return $this->hasOne(Brand::class, 'id', 'brand_id');
    }
}
