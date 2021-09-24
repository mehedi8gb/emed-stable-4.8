<?php

namespace App;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;
use App\Jobs;
use App\JobLocations;
use App\JobApplication;

class JobCategory extends Model
{
    use SoftDeletes;

    public function posts()
    {
        return $this->hasMany(Jobs::class);
    }

    public function locations()
    {
        return $this->hasMany(JobLocations::class);
    }
    // public function postss()
    // {
    //     return $this->hasMany(JobApplication::class);
    // }

}
