<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class SmsTemplateController extends Controller
{
 public function Index()
    {
        $users = User::all();
        return view('otp_systems.sms.index', compact('users'));
    }
}
