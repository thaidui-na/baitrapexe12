<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class AuthController extends Controller
{
    // Hiển thị form đăng nhập
    public function showLoginForm()
    {
        return view('auth.login');
    }

    // Xử lý đăng nhập
    public function login(Request $request)
    {
        $username = $request->input('username');
        $password = $request->input('password');

        // Kiểm tra tài khoản (dữ liệu mẫu, không dùng database)
        if ($username === 'admin' && $password === '123456') {
            // Lưu session đăng nhập
            Session::put('logged_in', true);
            Session::put('username', $username);
            return redirect('/')->with('success', 'Đăng nhập thành công!');
        }

        return back()->withErrors(['login' => 'Sai tài khoản hoặc mật khẩu!'])->withInput();
    }

    // Xử lý đăng xuất
    public function logout()
    {
        Session::forget(['logged_in', 'username']);
        return redirect('/login')->with('success', 'Đăng xuất thành công!');
    }
}
