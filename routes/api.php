<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\SignupController;
use App\Http\Controllers\createTeamController;
use App\http\Controllers\BrowseFieldsController;
use App\Http\Controllers\ViewFieldDetailsController;
use App\Http\Controllers\BookingFieldController;
use App\Http\Controllers\Api\Auth\PasswordResetController;
use App\Http\Controllers\EnquiryController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\ViewTeamController;
use App\Http\Controllers\ManagementReviewController;
use App\Http\Controllers\ManagementEnquiryController;
use App\Http\Controllers\CreateReviewController;

//reset password 
Route::post('/forgot-password', [PasswordResetController::class, 'forgotPassword']);
Route::post('/reset-password', [PasswordResetController::class, 'resetPassword']);
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

// update profile 
Route::middleware('auth:api')->group(function () {
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
Route::middleware('auth:api')->get('/ViewFieldDetails', [ViewFieldDetailsController::class, 'view']);

//Booking Field
Route::middleware('auth:api')->post('/bookingfield', [BookingFieldController::class, 'store']);

// Submit enquiry by admin route
Route::post('/enquiries', [EnquiryController::class, 'submit'])->middleware('auth:api');

// View Setting by anyone route
Route::get('/settings', [SettingController::class, 'view']);

// Create Setting by admin route
Route::post('/settings', [SettingController::class, 'create'])->middleware('auth:api');

// Update Setting by admin route
Route::put('/settings', [SettingController::class, 'update'])->middleware('auth:api');

// View all teams
Route::get('/teams', [ViewTeamController::class, 'viewAllTeams'])->middleware('auth:api');

// View specific team using the team id
Route::get('/teams/{id}', [ViewTeamController::class, 'viewTeam'])->middleware('auth:api');

//Management Reviews
//get reviews
Route::middleware('auth:api')->get('/AllReview', [ManagementReviewController::class, 'index']);
//hide review
Route::middleware('auth:api')->post('/HideReview', [ManagementReviewController::class, 'hide']);
//delete review
Route::middleware('auth:api')->delete('/DeleteReview', [ManagementReviewController::class, 'destroy']);

//Management Enquiry
//get enqeiry
Route::middleware('auth:api')->get('/AllEnquiry', [ManagementEnquiryController::class, 'index']);
//hide enquiry
Route::middleware('auth:api')->post('/HideEnquiry', [ManagementEnquiryController::class, 'hide']);

//create review
Route::middleware('auth:api')->post('/createRview', [CreateReviewController::class, 'store']);