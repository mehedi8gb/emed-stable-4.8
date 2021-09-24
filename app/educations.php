<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class educations extends Model
{
    // public function user()
    // {
    //     return $this->belongsTo(User::class, 'id' , 'user_id');
    // }

    public function applications()
    {
       return $this->belongsTo(JobApplication::class);
    }
    public function job()
    {
       return $this->belongsTo(Jobs::class);
    }
}
