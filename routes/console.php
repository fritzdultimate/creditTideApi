<?php

use App\Models\Deposit;
use Carbon\Carbon;
use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Schedule;

Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote');

Schedule::call(function () {
    Deposit::where('status', 'pending')
        ->where('created_at', '<=', Carbon::now()->subHours(2))
        ->update(['status' => 'cancelled']);
})->everyFiveMinutes();
