<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Division extends Model
{
    protected $table = 'divisions';
    public function district()
    {
        return $this->hasMany(District::class,'division_id');
    }
}
