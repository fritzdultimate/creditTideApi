<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verification Email</title>
</head>
<body style="margin: 0; padding: 0; width: 100%; height: 100%; background-color: #f0f9ff; font-family: Arial, sans-serif; display: flex; justify-content: center; align-items: center;">
    <div style="width: 100%; max-width: 400px; padding: 20px; text-align: center; background-color: white; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
        <div style="width: 48px; height: 48px; background-color: #0369a1; border-radius: 50%; margin: 0 auto; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);"></div>
        
        <h1 style="font-size: 20px; font-weight: bold; color: #0c4a6e; margin-top: 16px;">Your verification code</h1>
        <span style="display: block; font-size: 32px; font-weight: bold; color: #0369a1; border: 1px solid #7dd3fc; padding: 16px; margin-top: 8px;">{{ $data['token'] }}</span>
        <p style="font-size: 14px; color: #475569; font-weight: 500; margin-top: 8px;">Do not share this code with anyone!</p>
        
        <div style="background-color: #fef9c3; color: #a16207; padding: 16px; border-radius: 8px; text-align: left; margin-top: 16px;">
            <span style="display: flex; align-items: center; font-size: 14px; font-weight: bold;">
                <span style="margin-right: 8px; font-size: 14px;">💬</span>
                Was this request not made by you?
            </span>
            <p style="font-size: 12px; line-height: 1.5; margin-top: 8px;">
                This code was generated from a request made using Chrome browser on macOS on <strong>{{ date('d/m/Y') }}</strong>. If you did not initiate this request, you can safely <strong>ignore this email.</strong>
            </p>
        </div>
        
        <span style="display: block; font-size: 12px; color: #94a3b8; margin-top: 24px;">This is an automated message. <strong style="color: #1e293b;">Please do not reply</strong></span>
    </div>
</body>
</html>
