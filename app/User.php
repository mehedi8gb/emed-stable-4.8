<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;
use App\Models\Cart;
use App\Notifications\EmailVerificationNotification;
use App\seller_company_based_discount;
use Carbon\Carbon;
class User extends Authenticatable implements MustVerifyEmail
{
    use Notifiable, HasApiTokens;


    public function getReportDateAttribute($value)
    {
        return $value ? Carbon::parse($value)->format(config('panel.date_format')) : null;

    }

    public function setReportDateAttribute($value)
    {
        $this->attributes['report_date'] = $value ? Carbon::createFromFormat(config('panel.date_format'), $value)->format('Y-m-d') : null;

    }

    public function sendEmailVerificationNotification()
    {
        $this->notify(new EmailVerificationNotification());
    }

    /**
    * The attributes that are mass assignable.
    *
    * @var array
    */
    protected $fillable = [
        'name', 'email', 'password', 'address', 'city', 'postal_code', 'phone', 'country', 'provider_id', 'email_verified_at', 'verification_code'
    ];

    /**
    * The attributes that should be hidden for arrays.
    *
    * @var array
    */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function wishlists()
    {
    return $this->hasMany(Wishlist::class);
    }

    public function customer()
    {
    return $this->hasOne(Customer::class);
    }

    public function seller()
    {
    return $this->hasOne(Seller::class);
    }

    public function affiliate_user()
    {
    return $this->hasOne(AffiliateUser::class);
    }

    public function affiliate_withdraw_request()
    {
    return $this->hasMany(AffiliateWithdrawRequest::class);
    }

    public function products()
    {
    return $this->hasMany(Product::class);
    }

    public function company_discount()
    {
    return $this->hasOne(seller_company_based_discount::class);
    }

    public function shop()
    {
    return $this->hasOne(Shop::class);
    }

    public function staff()
    {
    return $this->hasOne(Staff::class);
    }

    public function staffs()
    {
    return $this->hasOne(Staff::class, 'id', 'user_id');
    }

    public function orders()
    {
    return $this->hasMany(Order::class);
    }

    public function wallets()
    {
    return $this->hasMany(Wallet::class)->orderBy('created_at', 'desc');
    }
    public function educations()
    {
    return $this->hasMany(educations::class);
    }
    public function experiences()
    {
    return $this->hasMany(experience::class);
    }
    public function prescriptions()
    {
    return $this->hasMany(prescription::class, 'user_id');
    }

    public function club_point()
    {
    return $this->hasOne(ClubPoint::class);
    }

    public function customer_package()
    {
        return $this->belongsTo(CustomerPackage::class);
    }

    public function customer_package_payments()
    {
        return $this->hasMany(CustomerPackagePayment::class);
    }

    public function customer_products()
    {
        return $this->hasMany(CustomerProduct::class);
    }

    public function seller_package_payments()
    {
        return $this->hasMany(SellerPackagePayment::class);
    }

    public function carts()
    {
        return $this->hasMany(Cart::class);
    }

    public function reviews()
    {
        return $this->hasMany(Review::class, 'doctor_id', 'id');
    }
    public function reviewd_users()
    {
        return $this->hasMany(Review::class);
    }

    public function addresses()
    {
        return $this->hasMany(Address::class);
    }

    public function education()
    {
        return $this->hasMany(educations::class);
    }

    public function affiliate_log()
    {
        return $this->hasMany(AffiliateLog::class);
    }
    public function application()
    {
        return $this->hasMany(JobApplication::class);
    }
}
