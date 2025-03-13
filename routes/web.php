<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcomesgggg');
});

Route::get('/email', function () {
    return view('email');
});
