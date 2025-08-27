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
        // 1) Validate input
        $validated = $request->validate([
            'name' => 'required|string|max:100',
            'email' => 'required|string|email|max:100|unique:user,email',
            'phone' => 'nullable|string|max:20',
            'password' => 'required|string|min:6|confirmed', // password_confirmation required
            'role' => [
                'required',
                'string',
                function ($attribute, $value, $fail) {
                    if (!in_array($value, ['admin', 'player'])) {
                        return response()->json([
                            'error' => 'Only admin and player are the available roles'
                        ], 403);
                    }
                }
            ],
        ]);

        // 2) Create user
        $user = User::create([
            'name' => $validated['name'],
            'email' => $validated['email'],
            'phone' => $validated['phone'] ?? null,
            'password' => bcrypt($validated['password']),
            'role' => $validated['role'],
        ]);

        // 3) Generate JWT token immediately after signup
        $token = Auth::guard('api')->login($user);

        // 4) Return response
        return response()->json([
            'message' => 'User ' . $user->name . ' registered successfully',
            'user' => $user,
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => JWTAuth::factory()->getTTL() * 60
        ]);
    }
}
