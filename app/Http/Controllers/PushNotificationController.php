<?php

namespace App\Http\Controllers;

use App\Models\PushSubscription;
use Illuminate\Http\Request;
use Minishlink\WebPush\WebPush;
use Minishlink\WebPush\Subscription;

class PushNotificationController extends Controller {
    public function subscribe(Request $request) {
        $validated = $request->validate([
            'endpoint' => 'required|url|unique:push_subscriptions,endpoint',
            'keys.p256dh' => 'required|string',
            'keys.auth' => 'required|string',
        ]);

        PushSubscription::create([
            'endpoint' => $validated['endpoint'],
            'public_key' => $validated['keys']['p256dh'],
            'auth_token' => $validated['keys']['auth'],
        ]);

        return response()->json(['success' => true]);
    }

    public function send(Request $request) {
        $subscriptions = PushSubscription::all();

        $webPush = new WebPush([
            'VAPID' => [
                'subject' => env('VAPID_SUBJECT'),
                'publicKey' => env('VAPID_PUBLIC_KEY'),
                'privateKey' => env('VAPID_PRIVATE_KEY'),
            ],
        ]);

        foreach ($subscriptions as $sub) {
            $subscription = Subscription::create([
                'endpoint' => $sub->endpoint,
                'publicKey' => $sub->public_key,
                'authToken' => $sub->auth_token,
            ]);

            $webPush->queueNotification(
                $subscription,
                json_encode([
                    'title' => 'Hello from Laravel!',
                    'body' => 'This is a push notification.',
                    'icon' => '/favicon.ico',
                ])
            );
        }

        foreach ($webPush->flush() as $report) {
            $endpoint = $report->getRequest()->getUri()->__toString();

            if ($report->isSuccess()) {
                echo "Sent message to {$endpoint}\n";
            } else {
                echo "Failed to send message to {$endpoint}: {$report->getReason()}\n";
            }
        }

        return response()->json(['message' => 'Notifications sent!']);
    }
}
