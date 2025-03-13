<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/email', function () {
    return view('email');
});

Route::get('/otp', function () {
    return view('emails.auth.otp');
});
