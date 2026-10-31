<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class RegisterController extends Controller
{
    public function index(){
        return view('auth.register',[
            'title' => 'Register',
            'active' => 'register'
        ]);
    }

    public function register(Request $request){
        $validatedData = $request->validate([
            'name' => 'required|max:100',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:4', 
            'phone' => 'required|numeric' // ⬅ validasi nomor WA
        ]);

        // enkripsi password
        $validatedData['password'] = bcrypt($validatedData['password']);

        // default role user
        $validatedData['role_id'] = 2;

        try {
            // SIMPAN USER + PHONE
            User::create($validatedData);

            return redirect('/login')->with('regisSuccess', 'Berhasil Register, Silahkan Login');
        } catch (\Exception $e) {
            return redirect('/register')->with('regiserror', 'Terjadi kesalahan: ' . $e->getMessage());
        }
    }

}
