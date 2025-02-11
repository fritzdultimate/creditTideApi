<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('investment_plans', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->decimal('min_amount');
            $table->decimal('max_amount');
            $table->decimal('interest_rate', 5, 2); // Fixed percentage e.g. 10% 
            $table->enum('interval', ['yearly', 'monthly', 'weekly', 'daily', 'hourly'])->default('daily');
            $table->integer('duration'); // Lock-in period  
            $table->decimal('referral_bonus')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('investment_plans');
    }
};
