<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Staff extends Model
{
    public function user()
    {
    return $this->belongsTo(User::class);
    }
    public function educations()
    {
    return $this->hasMany(educations::class, 'user_id', 'user_id');
    }

    public function role()
    {
    return $this->belongsTo(Role::class);
    }

    public function pick_up_point()
    {
    	return $this->hasOne(PickupPoint::class);
    }

}
