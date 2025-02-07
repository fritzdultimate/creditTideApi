<?php

use App\Http\Controllers\HeroController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


Route::get('/test', function() {
    return [
        'name' => 'ajeh'
    ];
});

Route::prefix('heroes')->group(function () {
    Route::get('/{slug}', [HeroController::class, 'getHero']); // Get hero by slug
});