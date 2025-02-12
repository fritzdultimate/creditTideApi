<?php

namespace App\Enums;

enum TransactionType: string {
    case DEPOSIT = 'deposit';
    case WITHDRAWAL = 'withdrawal';
    case INVESTMENT = 'investment';
    case PROFIT = 'profit';
    case LOSS = 'loss';
    case REFERRALBONUS = 'referral_bonus';
}