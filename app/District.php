<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class District extends Model
{
    protected $table = 'districts';
    public function division (){
        return $this->hasMany(Division::class,'DivisionId');
    }
}
