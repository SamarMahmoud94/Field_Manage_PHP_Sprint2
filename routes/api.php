<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\SignupController;
use App\Http\Controllers\createTeamController;
use App\http\Controllers\BrowseFieldsController;
use App\Http\Controllers\ViewFieldDetailsController;
use App\Http\Controllers\BookingFieldController;
use App\Http\Controllers\Api\Auth\PasswordResetController;
use App\Http\Controllers\UserController;
//reset password 
Route::post('/forgot-password', [PasswordResetController::class, 'forgotPassword']);
Route::post('/reset-password', [PasswordResetController::class, 'resetPassword']);

// activate and deavtivate 

Route::middleware('auth:api')->group(function() {
    Route::post('/user/{id}/toggle-status', [App\Http\Controllers\Api\Auth\UserController::class, 'toggleStatus']);
});


// Route::middleware('auth:api')->post('/user/{id}/toggle-status', [UserController::class, 'toggleStatus']);



// update profile 

Route::middleware('auth:api')->group(function() {
    Route::post('/profile/update', [App\Http\Controllers\Api\Auth\ProfileController::class, 'update']);
});

// login route
Route::post('/login', [AuthController::class, 'login']);

// logout route
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:api');

// Signup route
Route::post('/signup', [SignupController::class, 'register']);

//Create Team
Route::middleware('auth:api')->post('/CreateTeam', [CreateTeamController::class, 'store']);

//Browse Fields
Route::middleware('auth:api')->get('/Browsefields', [BrowseFieldsController::class, 'browse']);

//View Field Details
Route::middleware('auth:api')->get('/ViewFieldDetails',[ViewFieldDetailsController::class, 'view']);

//Booking Field
Route::middleware('auth:api')->post('/bookingfield', [BookingFieldController::class, 'store']);
