<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $data['subject'] }}</title>
</head>
<body style="margin: 0; padding: 0; width: 100%; height: 100%; background-color: #f0f9ff; font-family: Arial, sans-serif; display: flex; justify-content: center; align-items: center;">
    sender - {{ $data['name'] }}
    sender email - {{ $data['sender'] }}
    <p>
        Message - {{ $data['message'] }}
    </p>
</body>
</html>
