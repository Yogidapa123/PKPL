<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function index()
    {
        return view('auth.login', [
            'title' => 'Login',
            'active' => 'login'
        ]);
    }

    public function authenticate(Request $request)
    {
        // Validasi input login
        $credentials = $request->validate([
            'login' => 'required|string',
            'password' => 'required|string'
        ]);

        // Tentukan apakah input adalah email atau username
        $loginField = filter_var($credentials['login'], FILTER_VALIDATE_EMAIL) ? 'email' : 'name';

        // Otentikasi pengguna berdasarkan field login yang sesuai
        if (Auth::attempt([$loginField => $credentials['login'], 'password' => $credentials['password']])) {
            $request->session()->regenerate();

            $user = Auth::user();

            // Redirect berdasarkan role
            switch ($user->role_id) {
                case 1:
                    return redirect()->intended('/dashboard/admin'); // Admin
                case 2:
                    return redirect()->intended('/'); // User biasa
                default:
                    Auth::logout();
                    return redirect()->back()->withErrors(['login' => 'Role tidak dikenal.']);
            }
        }

        // Jika gagal login
        return back()->with('loginError', 'Email, username, atau password salah.');
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('/');
    }
}
