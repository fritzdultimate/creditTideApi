<?php

use Illuminate\Support\Facades\Artisan;
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

Route::get('/run-queue-worker', function () {
    Artisan::call('queue:work --tries=3 --timeout=90');
    return 'Queue worker started!';
});
