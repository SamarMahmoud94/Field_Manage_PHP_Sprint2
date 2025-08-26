<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\SignupController;
use App\Http\Controllers\createTeamController;

// login route
Route::post('/login', [AuthController::class, 'login']);

// logout route
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:api');

// Signup route
Route::post('/signup', [SignupController::class, 'register']);

//Create Team
use App\Http\Controllers\TeamController;

Route::middleware('auth:api')->post('/CreateTeam', [CreateTeamController::class, 'store']);
