<?php

use Illuminate\Support\Facades\Route;
//use Illuminate\Support\Facades\Auth;

Route::get('/', function () {
    return view('welcome');
});


// user's routes



// admin's routes

//Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
