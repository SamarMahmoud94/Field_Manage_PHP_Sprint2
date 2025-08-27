<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\SignupController;
use App\Http\Controllers\EnquiryController;


// login route
Route::post('/login', [AuthController::class, 'login']);

// logout route
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:api');

// Signup route
Route::post('/signup', [SignupController::class, 'register']);

// Submit enquiry by admin route
Route::post('/enquiries', [EnquiryController::class, 'submit'])->middleware('auth:api');
