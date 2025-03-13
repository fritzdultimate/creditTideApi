@extends('emails.layouts.app')
    @section('content')
        <table style="width:100%">
            <tbody>
                <tr>
                    <td>
                        <p style="text-align:left;font-weight:700;font-size:1rem;font-weight:400;margin-bottom:16px">
                            Hello {{ $data['name'] }},
                        </p>
                    </td>
                </tr>
                <tr style="padding-top:0">
                    <td>
                        <h3 style="">
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
                        <div style="width:100%;margin:auto;margin-bottom:2rem;border-radius:8px;background:#f0f6fe; padding: 16px">
                            <table style="width:100%;color:#131212;font-size:14px;border-spacing:0;border-collapse:collapse" cellspacing="0">
                                <tbody>
                                    <tr style="border: 1px solid red width:100%;">
                                        <td style="font-weight:500;color:#131212;border-bottom:1px solid #e1e1e1;padding-bottom:1.5rem">
                                            OTP
                                        </td>
                                        <td style="font-weight:300;color:#131212;border-bottom:1px solid #e1e1e1;padding-bottom:1.5rem;text-align:right; padding-right:5px;">
                                            {{ $data['otp'] }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-weight:500;padding:1.5rem 0;color:#131212;padding:1.5rem 0">
                                            Expires at:
                                        </td>
                                        <td style="font-weight:300;color:#131212;padding-left:0;text-align:right">
                                            11/24/2023 - 5:03 PM
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
    @endsection