<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    public function toggleStatus($id)
    {
        $user = User::find($id);

        if (!$user) {
            return response()->json([
                'error' => 'User not found'
            ], 404);
        }

        $user->is_active = !$user->is_active; // toggle status
        $user->save();

        return response()->json([
            'message' => 'User status updated successfully',
            'is_active' => $user->is_active
        ], 200);
    }
}
