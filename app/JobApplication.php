<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\JobCategory;
use Illuminate\Database\Eloquent\SoftDeletes;

class JobApplication extends Model
{
    use SoftDeletes;
    protected $fillable = [

        'circuler_id' ,
        'job_title' ,
        'category_id' ,
        'location_id' ,
        'user_id',
        'user_name' ,
        'name',
        'father_name' ,
        'mother_name' ,
        'date' ,
        'present_division' ,
        'present_district' ,
        'present_thana' ,
        'present_area' ,
        'present_road',
        'present_house' ,
        'permanent_division' ,
        'permanent_district' ,
        'permanent_thana' ,
        'permanent_area' ,
        'permanent_road',
        'permanent_house' ,
        'nationality' ,
        'marital' ,
        'nid' ,
        'email' ,
        'mobile' ,
        ];

        protected $table = "job_applications";
        public $primaryKey = 'id';
    public function education()
    {
    return $this->belongsTo(educations::class);
    }

    public function jobs()
    {

       return $this->hasOne(Jobs::class, 'id', 'circuler_id');
    }
    public function categories()
    {

       return $this->hasOne(JobCategory::class, 'id', 'category_id');
    }
    public function location()
    {

       return $this->hasOne(JobLocations::class, 'id', 'location_id');
    }

    public function user()
    {

       return $this->belongsTo(User::class);
    }
}
