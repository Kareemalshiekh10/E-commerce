<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login_admin()
    {
        if (Auth::check() && Auth::user()->is_admin == 1) {
            return redirect('admin/dashboard');
        }

        return view('admin.auth.login');
    }

    public function auth_login_admin(Request $request)
    {
        $remember = $request->has('remember');
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password, 'is_admin' => 1, 'status'=>0, 'is_delete'=>0], $remember)) {
            return redirect('admin/dashboard');
        }

        return redirect()->back()->with('error', 'Please enter correct email and password');
    }

    public function logout_admin()
    {
        Auth::logout();
        return redirect('admin');
    }
}


