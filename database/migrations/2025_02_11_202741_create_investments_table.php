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
        Schema::create('investments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('stock_id')->constrained('stocks')->onDelete('cascade');
            $table->foreignId('investment_plan_id')->constrained('investment_plans')->onDelete('cascade');
            $table->decimal('amount', 15, 2);
            $table->decimal('current_value', 15, 2);
            $table->timestamp('start_date');
            $table->timestamp('end_date')->nullable();
            $table->boolean('is_active')->default(true);
            $table->enum('status', ['active', 'completed', 'cancelled'])->default('active');
            $table->string('reference')->unique();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('investments');
    }
};
