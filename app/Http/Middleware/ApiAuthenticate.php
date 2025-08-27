<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;

class ApiAuthenticate extends Middleware
{
    protected function redirectTo($request)
    {
        return response()->json([
            'success' => false,
            'message' => 'Unauthorized'
        ], 401);
    }
}
