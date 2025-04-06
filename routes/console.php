<?php

use App\Mail\CustomMail;
use App\Models\Deposit;
use App\Models\Transaction;
use App\Models\Withdrawal;
use Carbon\Carbon;
use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Schedule;

Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote');

function cancelPendingWithdrawal() {
    $withdrawals = Withdrawal::where('status', 'pending')
        ->where('created_at', '<=', Carbon::now()->subHours(24))
        ->get();

    foreach ($withdrawals as $withdrawal) {
        $withdrawal->update(['status' => 'cancelled']);
        Transaction::where('reference', $withdrawal->reference)->update(['status' => 'cancelled']);

        // Send email to user
        $app_name = env('APP_NAME');
        $data = [
            'view' => 'emails.withdrawal.cancelled',
            'subject' => "[$app_name] Withdrawal Cancelled",
            'email' => $withdrawal->user->email,
            'symbol' => $withdrawal->userWallet->adminWallet->symbol,
            'amount' => $withdrawal->amount,
            'username' => $withdrawal->user->username,
            'wallet' => $withdrawal->userWallet->adminWallet->name,
            'reference' => $withdrawal->reference,
            'date' => $withdrawal->updated_at,
        ];
        Mail::to($data['email'])->queue(new CustomMail($data));
    }
}
function cancelPendingDeposit() {
    $deposits = Deposit::where('status', 'pending')
        ->where('created_at', '<=', Carbon::now()->subHours(2))
        ->get();

    foreach ($deposits as $deposit) {
        $deposit->update(['status' => 'cancelled']);
        Transaction::where('reference', $deposit->reference)->update(['status' => 'cancelled']);

        // Send email to user
        $app_name = env('APP_NAME');
        $data = [
            'view' => 'emails.deposit.cancelled',
            'subject' => "[$app_name] Deposit Cancelled",
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
}

Schedule::call(function () {
    cancelPendingDeposit();
    cancelPendingWithdrawal();
})->everyFiveMinutes();
