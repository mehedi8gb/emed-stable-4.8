<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Generic extends Model
{
    public function getTranslation($field = '', $lang = false) {
        $lang = $lang == false ? App::getLocale() : $lang;
        $product_translations = $this->hasMany(ProductTranslation::class)->where('lang', $lang)->first();
        return $product_translations != null ? $product_translations->$field : $this->$field;
    }
    // public function generic() {
    //     return $this->hasOne(Generic::class, 'id', 'generic_id');
    // }
    public function products() {
        return $this->hasMany(Product::class);
    }

}
