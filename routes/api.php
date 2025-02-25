<?php

use App\Http\Controllers\CelebrityInvestorController;
use App\Http\Controllers\HeroController;
use App\Http\Controllers\InvestmentController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\PlanController;
use App\Http\Controllers\RegistrationController;
use App\Http\Controllers\StockController;
use App\Http\Controllers\TestimonyController;
use App\Http\Controllers\TransactionController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UserWalletController;
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

Route::prefix('testimonies')->group(function () {
    Route::get('/', [TestimonyController::class, 'list']);
});

Route::prefix('celebrities')->group(function () {
    Route::get('/', [CelebrityInvestorController::class, 'list']);
});


// AUTHENTICATION ROUTES******************************************************************
// ****************************************************************************************
// ****************************************************************************************
// ****************************************************************************************
// ****************************************************************************************
// ****************************************************************************************

Route::post("/register", [RegistrationController::class, 'register']);
Route::post("/login", [LoginController::class, 'login']);
Route::post('/verify-email-address', [RegistrationController::class, 'verifyEmailAddress']);
Route::post('/send-email-verification', [RegistrationController::class, 'resendVerification']);

// ****************************************************************************************
// ****************************************************************************************
// ****************************************************************************************
// ****************************************************************************************
// ****************************************************************************************
// ****************************************************************************************
// ****************************************************************************************
// ****************************************************************************************



// ******************AUTHENTICATED*****************************************************
// ************************************************************************************
// ************************************************************************************
// ************************************************************************************
// ************************************************************************************

Route::get('/user', [UserController::class, 'getUser'])->middleware('auth:sanctum');

Route::post('/app/invest', [InvestmentController::class, 'invest'])->middleware('auth:sanctum');
Route::get('/app/transactions', [TransactionController::class, 'transactions'])->middleware('auth:sanctum');
Route::get('/app/transactions/{id}', [TransactionController::class, 'getTransaction'])->middleware('auth:sanctum');
Route::get('/app/grouped/transactions', [TransactionController::class, 'getGroupedTransaction'])->middleware('auth:sanctum');


Route::get('app/user/wallets', [UserWalletController::class, 'getWallets'])->middleware('auth:sanctum');

// ************************************************************************************
// ************************************************************************************
// ************************************************************************************
// ************************************************************************************
// ************************************************************************************
// ************************************************************************************


// ************************************************************************************
Route::get('/stocks', [StockController::class, 'stocks']);
Route::get('/plans', [PlanController::class, 'plans']);