<?php

namespace App\Enums;

enum InvestmentStatus: string {
    case ACTIVE = 'active';
    case COMPLETED = 'completed';
    case CANCELLED = 'cancelled';
}