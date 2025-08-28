<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\SignupController;
use App\Http\Controllers\EnquiryController;
use App\Http\Controllers\SettingController;


// login route
Route::post('/login', [AuthController::class, 'login']);

// logout route
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:api');

// Signup route
Route::post('/signup', [SignupController::class, 'register']);

// Submit enquiry by admin route
Route::post('/enquiries', [EnquiryController::class, 'submit'])->middleware('auth:api');

// View Setting by anyone route
Route::get('/settings', [SettingController::class, 'view']);

// Create Setting by admin route
Route::post('/settings', [SettingController::class, 'create'])->middleware('auth:api');

// Update Setting by admin route
Route::put('/settings', [SettingController::class, 'update'])->middleware('auth:api');
