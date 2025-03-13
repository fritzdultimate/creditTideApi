<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcomes');
});

Route::get('/email', function () {
    return view('email');
});
