<?php

use App\Http\Controllers\BlogController;
use App\Http\Controllers\CelebrityInvestorController;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\CryptoController;
use App\Http\Controllers\DepositController;
use App\Http\Controllers\EmailController;
use App\Http\Controllers\FaqController;
use App\Http\Controllers\HeroController;
use App\Http\Controllers\InvestmentController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\NewsletterController;
use App\Http\Controllers\PlanController;
use App\Http\Controllers\PolicyController;
use App\Http\Controllers\PushNotificationController;
use App\Http\Controllers\RegistrationController;
use App\Http\Controllers\SiteSettingController;
use App\Http\Controllers\StockController;
use App\Http\Controllers\SurveyQuestionController;
use App\Http\Controllers\TestimonyController;
use App\Http\Controllers\TransactionController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UserWalletController;
use App\Http\Controllers\WithdrawalController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::post('/subscribe', [PushNotificationController::class, 'subscribe'])->middleware('auth:sanctum');
Route::get('/send/{userId}', [PushNotificationController::class, 'send']);

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::prefix('heroes')->group(function () {
    Route::get('/{slug}', [HeroController::class, 'getHero']); // Get hero by slug
});

Route::prefix('testimonies')->group(function () {
    Route::get('/', [TestimonyController::class, 'list']);
});

Route::prefix('celebrities')->group(function () {
    Route::get('/', [CelebrityInvestorController::class, 'list']);
});

Route::prefix('companies')->group(function () {
    Route::get('/', [CompanyController::class, 'list']);
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
Route::post('/change-password', [RegistrationController::class, 'changePassword']);

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

Route::get('/app/user', [UserController::class, 'getUser'])->middleware('auth:sanctum');
Route::post('/app/user/edit/details', [UserController::class, 'updateProfileDetails'])->middleware('auth:sanctum');
Route::post('/app/user/setup', [UserController::class, 'setupaccount'])->middleware('auth:sanctum');
Route::post('/app/user/edit/password', [UserController::class, 'updatePassword'])->middleware('auth:sanctum');
Route::post('/app/user/edit/preferences', [UserController::class, 'updatePreferences'])->middleware('auth:sanctum');
Route::post('/app/user/logout', [UserController::class, 'logout'])->middleware('auth:sanctum');


Route::post('/app/invest', [InvestmentController::class, 'invest'])->middleware('auth:sanctum');
Route::get('/app/transactions', [TransactionController::class, 'transactions'])->middleware('auth:sanctum');
Route::get('/app/transactions/{id}', [TransactionController::class, 'getTransaction'])->middleware('auth:sanctum');
Route::get('/app/grouped/transactions', [TransactionController::class, 'getGroupedTransaction'])->middleware('auth:sanctum');

Route::get('/app/investments/sum', [InvestmentController::class, 'sumActiveInvestment'])->middleware('auth:sanctum');
Route::get('/app/investments/{id}', [InvestmentController::class, 'getInvestment'])->middleware('auth:sanctum');


Route::get('app/user/wallets', [UserWalletController::class, 'getWallets'])->middleware('auth:sanctum');
Route::post('/app/user/wallet/address/change', [UserWalletController::class, 'updateAddress'])->middleware('auth:sanctum');

Route::post('/app/user/deposit', [DepositController::class, 'deposit'])->middleware('auth:sanctum');
Route::get('/app/user/deposit/{reference}', [DepositController::class, 'getDeposit'])->middleware('auth:sanctum');

Route::post('/app/user/withdraw', [WithdrawalController::class, 'withdraw'])->middleware('auth:sanctum');


// ************************************************************************************
// ************************************************************************************
// ************************************************************************************
// ************************************************************************************
// ************************************************************************************
// ************************************************************************************


// ************************************************************************************
Route::get('/stocks', [StockController::class, 'stocks']);
Route::get('/plans', [PlanController::class, 'plans']);
Route::get('/faqs', [FaqController::class, 'getFaqs']);

Route::get('/policies/categories', [PolicyController::class, 'getPolicyCategories']);
Route::get('/policies/{category}', [PolicyController::class, 'getPolicy']);

Route::get('/blogs/categories', [BlogController::class, 'getBlogCategories']);
Route::get('/blogs/{category}', [BlogController::class, 'getBlogs']);

Route::get('/post/item/{id}/like', [BlogController::class, 'love']);
Route::get('/post/item/{id}/unlike', [BlogController::class, 'unlove']);
Route::get('/post/{slug}', [BlogController::class, 'getPost']);

Route::get('/survey/questions', [SurveyQuestionController::class, 'getQuestions']);
Route::post('/newsletter/subscribe', [NewsletterController::class, 'subscribe']);
Route::post('/newsletter/unsubscribe', [NewsletterController::class, 'unsubscribe']);
Route::get('/site/settings', [SiteSettingController::class, 'getSetting']);

Route::post('/contact-us/email', [EmailController::class, 'sendEmail']);










Route::get('/crypto-price', [CryptoController::class, 'getPrice']);