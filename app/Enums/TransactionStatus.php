<?php

namespace App\Enums;

enum TransactionStatus: string {
    case PENDING = 'pending';
    case PROCESSING = 'processing';
    case COMPLETED = 'completed';
    case REJECT = 'reject';
    case CANCELLED = 'cancelled';
}