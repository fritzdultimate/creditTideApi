<?php

use Illuminate\Auth\AuthenticationException;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Http\Request;
use Illuminate\Session\Middleware\StartSession;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->statefulApi();
        $middleware->append(StartSession::class);
        $middleware->redirectGuestsTo(fn (Request $request) => null);

        // Exclude login from CSRF
        $middleware->validateCsrfTokens(except: [
            'api/login',
            'api/register',
            'login',
            'register',
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        // Return clean JSON 401 for unauthenticated requests
        $exceptions->render(function (AuthenticationException $e, Request $request) {
            return response()->json([
                'success' => false,
                'message' => 'Unauthenticated. Please provide a valid token.',
            ], 401);
        });
    })->create();

// @TheOnlyWebStormer$1
