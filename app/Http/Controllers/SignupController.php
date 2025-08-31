<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\Models\User;

class SignupController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'name'     => 'required|string|max:100',
            'email'    => 'required|string|email|max:100|unique:user,email',
            'phone'    => 'nullable|string|max:20',
            'password' => 'required|string|min:6|confirmed', // password_confirmation required
            'role'     => 'required|string|in:admin,player',
        ]);

        // Create user 
        $user = User::create([
            'name'     => $request->name,
            'email'    => $request->email,
            'phone'    => $request->phone,
            'password' => bcrypt($request->password),
            'role'     => $request->role,
            'is_active' => 1,
        ]);

        // if ($user->role !== 'admin' && $user->role !== 'player') {
        //     return response()->json(['error' => 'Only admin and player are the available roles'], 403);
        // }

        $token = Auth::guard('api')->login($user);
        return response()->json([
            'message' => 'User ' . $user->name . ' registered successfully',
            'user' => $user,
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => JWTAuth::factory()->getTTL() * 60
        ]);
    }
}
