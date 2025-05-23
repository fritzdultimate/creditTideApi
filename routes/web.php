<?php

use App\Http\Controllers\CronJobsController;
use App\Http\Controllers\EmailLeadsController;
use App\Http\Controllers\ProfitController;
use App\Http\Controllers\ThirdPartyController;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;



Route::get('/run-queue-worker', function () {
    Artisan::call('queue:work --tries=3 --timeout=90');
    return 'Queue worker started!';
});


Route::get('/cron/job/exec', ProfitController::class);

Route::get('/update/stocks/value', [ThirdPartyController::class, 'getStockPrice']);
Route::get('/cron/job/cat/a', [CronJobsController::class, 'getCategoryA']);

Route::get('/cron/job/cat/a/send/email/leads', [CronJobsController::class, 'sendEmailLeads']);


Route::get('/email/extract', [EmailLeadsController::class, 'extract']);
Route::get('/email/extract/store', [EmailLeadsController::class, 'store']);