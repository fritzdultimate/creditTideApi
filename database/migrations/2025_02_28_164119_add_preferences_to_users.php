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
        Schema::table('users', function (Blueprint $table) {
            $table->boolean('hide_balance')->default(false);
            $table->boolean('two_factor_enabled')->default(false);
            $table->boolean('email_notifications')->default(true);
            $table->boolean('newsletter_subscription')->default(true);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn(['hide_balance', 'two_factor_enabled', 'email_notifications', 'newsletter_subscription']);
        });
    }
};
