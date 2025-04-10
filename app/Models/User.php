<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Filament\Models\Contracts\FilamentUser;
use Filament\Panel;

class User extends Authenticatable implements FilamentUser {
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'username',
        'email',
        'password',
        'dob',
        'phone',
        'invitation_code'
    ];
    protected $appends = ['total_invested'];

    public function canAccessPanel(Panel $panel): bool {
        return str_ends_with($this->email, '.com') && $this->hasVerifiedEmail(); 
    }

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    public function balance() {
        return $this->hasOne(Balance::class);
    }

    protected static function booted() {
        static::created(function($user) {
            $user->balance()->create();
        });
    }

    public function referrals() {
        return $this->hasMany(Referral::class, 'referrer_id');
    }

    public function investments() {
        return $this->hasMany(Investment::class, 'user_id');
    }

    public function referrer() {
        return $this->belongsTo(Referral::class, 'user_id'); 
    }

    public function getTotalInvestedAttribute() {
        return $this->investments()->where(['status' => 'active'])->sum('current_value');
    }
}
