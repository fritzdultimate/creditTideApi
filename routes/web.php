<?php

use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;
use Filament\Facades\Filament;

// Filament::routes();

Route::get('/', function () {
    return view('welcome');
});


Route::get('/run-queue-worker', function () {
    Artisan::call('queue:work --tries=3 --timeout=90');
    return 'Queue worker started!';
});
