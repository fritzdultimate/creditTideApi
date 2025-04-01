<?php

use App\Mail\CustomMail;
use App\Models\Deposit;
use Carbon\Carbon;
use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Schedule;

Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote');

Schedule::call(function () {
    $deposits = Deposit::where('status', 'pending')
        ->where('created_at', '<=', Carbon::now()->subHours(2))
        ->get();

    foreach ($deposits as $deposit) {
        $deposit->update(['status' => 'cancelled']);

        // Send email to user
        $app_name = env('APP_NAME');
        $data = [
            'view' => 'emails.deposit.cancelled',
            'subject' => "[$app_name] Deposit Initiated",
            'email' => $deposit->user->email,
            'symbol' => $deposit->userWallet->adminWallet->symbol,
            'amount' => $deposit->amount,
            'username' => $deposit->user->username,
            'wallet' => $deposit->userWallet->adminWallet->name,
            'reference' => $deposit->reference,
            'date' => $deposit->updated_at,
        ];
        Mail::to($data['email'])->queue(new CustomMail($data));
    }
})->everyFiveMinutes();
