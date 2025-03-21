<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('policy_categories', function (Blueprint $table) {
            $table->id();
            $table->enum('category', ['payment', 'deposit', 'withdrawal', 'general', 'terms-and-conditions'])->default('general');
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('policy_categories');
    }
};
