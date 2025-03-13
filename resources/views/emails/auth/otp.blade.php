@extends('emails.layouts.app')
    @section('content')
        <table style="width:100%">
            <tbody>
                <tr>
                    <td>
                        <p style="text-align:left;font-weight:700;padding:0px 44px;font-size:1rem;font-weight:400;margin-bottom:16px">
                            Hello {{ $data['name'] }},
                        </p>
                    </td>
                </tr>
                <tr style="padding-top:0">
                    <td>
                        <h3 style="padding:0px 44px;">
                            OTP Verification
                            
                        </h3>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p style="font-weight:400;line-height:30px;font-size:1rem;">
                            The details are shown below:
                        </p>
                    </td>
                </tr>
                <tr>
                    <td style="overflow:hidden;">
                        <div style="width:100%;max-width:190%;margin:auto;margin-bottom:2rem;padding:1.5rem 1.5rem;padding-bottom:0.5rem;border-radius:8px;background:#f0f6fe">
                            <table style="width:100%;color:#131212;font-size:14px;border-spacing:0;border-collapse:collapse" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td style="font-weight:500;color:#131212;border-bottom:1px solid #e1e1e1;padding-bottom:1.5rem">
                                            OTP
                                        </td>
                                        <td style="font-weight:300;color:#131212;border-bottom:1px solid #e1e1e1;padding-bottom:1.5rem;text-align:right">
                                            {{ $data['otp'] }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-weight:500;padding:1.5rem 0;color:#131212;padding:1.5rem 0">
                                            Expires at:
                                        </td>
                                        <td style="font-weight:300;color:#131212;padding-left:0;text-align:right">
                                            11/24/2023 - 5:03 PM UTC
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
    @endsection