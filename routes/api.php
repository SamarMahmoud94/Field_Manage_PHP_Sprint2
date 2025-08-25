<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;

// login route
Route::post('/login', [AuthController::class, 'login']);

// logout route
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:api');


