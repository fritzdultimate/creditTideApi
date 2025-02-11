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
        Schema::create('transactions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->enum('type', ['deposit', 'withdrawal', 'investment', 'profit', 'loss', 'referral_bonus']);
            $table->enum('status', ['pending', 'processing', 'completed', 'rejected', 'cancelled', 'approved'])->default('pending');
            $table->decimal('amount', 15, 2);
            $table->string('reference')->unique(); // Unique transaction identifier
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('transactions');
    }
};
