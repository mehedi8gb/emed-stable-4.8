<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Prescription extends Model
{
    protected $fillable = [
        'user_id', 'proceed_by', 'name', 'message', 'prescription'
    ];
    public function proceed()
    {
    return $this->hasOne(User::class, 'id', 'proceed_by');
    }
    public function user()
    {
    return $this->belongsTo(User::class, 'user_id', 'id');
    }

}
