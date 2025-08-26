<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\SignupController;

// login route
Route::post('/login', [AuthController::class, 'login']);

// logout route
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:api');

// Signup route
Route::post('/signup', [SignupController::class, 'register']);
