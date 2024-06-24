<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Mail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use App\Mail\RegisterMail;

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

    public function customer_logout()
    {
        Auth::logout();
        return redirect('/');
    }
    public function auth_login(Request $request)
    {
        $remember = $request->has('remember');
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password, 'status'=>0, 'is_delete'=>0], $remember)) 
        {
            $json['status'] = true;
            $json['message'] = 'Login successfully';
        }
        else
        {
            $json['status'] = false;
            $json['message'] = 'Please enter correct email and password';
        }
        return response()->json($json);
    }
    public function auth_register(Request $request)
    {
        $checkEmail = User::checkEmail($request->email);
        if(empty($checkEmail)) 
        {
            $save = new User;
            $save->name = trim($request->name);
            $save->email = trim($request->email);
            $save->password = Hash::make($request->password);
    
            $save->save();
           /*  Mail::to($save->email)->send(new RegisterMail($save)); */
            $json['status'] = true;
            $json['message'] = 'Registered successfully';
        }
        else
        {
            $json['status'] = false;
            $json['message'] = 'Email already exists';
        }
        echo json_encode($json);
    }

   /*  public function activate_email($id)
    {
        $id = base64_encode($id);
        $user = User::getSingle($id);
        $user->email_verified_at = date('Y-M-D H:I:S');
        $user->save();
        return redirect('login')->with('success', 'Email verified successfully');
    } */
    
}


