@extends('emails.layouts.app')
    @section('content')
        <table style="width:100%">
            <tbody>
                <tr>
                    <td>
                        <p style="padding-top:40px;text-align:left;font-weight:700;padding:0px 44px;font-size:1rem;font-weight:400;margin-bottom:16px">
                            Hello Chukwuemeka Darlington,
                        </p>
                    </td>
                </tr>
                <tr style="padding-top:0">
                    <td>
                        <h3 style="padding:0px 44px;">
                            Your transaction was successful 
                            <img data-emoji="🤑" class="an1" alt="🤑" aria-label="🤑" draggable="false" src="https://fonts.gstatic.com/s/e/notoemoji/16.0/1f911/32.png" loading="lazy">
                            
                        </h3>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p style="font-weight:400;line-height:30px;font-size:1rem;padding:0 44px">
                            The details are shown below:
                        </p>
                    </td>
                </tr>
                <tr>
                    <td style="overflow:hidden;padding:10px 48px">
                        <div style="width:100%;max-width:190%;margin:auto;margin-bottom:2rem;padding:1.5rem 1.5rem;padding-bottom:0.5rem;border-radius:8px;background:#f0f6fe">
                            <table style="width:100%;color:#131212;font-size:14px;border-spacing:0;border-collapse:collapse" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td style="font-weight:500;color:#131212;border-bottom:1px solid #e1e1e1;padding-bottom:1.5rem">
                                            Transaction Type:
                                        </td>
                                        <td style="font-weight:300;color:#131212;border-bottom:1px solid #e1e1e1;padding-bottom:1.5rem;text-align:right">
                                                debit
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-weight:500;padding:1.5rem 0;color:#131212;border-bottom:1px solid #e1e1e1">
                                            Merchant:
                                        </td>
                                        <td style="font-weight:300;color:#131212;border-bottom:1px solid #e1e1e1;text-align:right">
                                                    Google YouTube
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-weight:500;padding:1.5rem 0;color:#131212;border-bottom:1px solid #e1e1e1">
                                            Amount Debited:
                                        </td>
                                        <td style="font-weight:300;color:#131212;padding-left:0;border-bottom:1px solid #e1e1e1;text-align:right">
                                        1.56
                                        </td>
                                    </tr>
                                    

                                    <tr>
                                        <td style="font-weight:500;padding:1.5rem 0;color:#131212;border-bottom:1px solid #e1e1e1">
                                            Reference:
                                        </td>
                                        <td style="font-weight:300;color:#131212;padding-left:0;border-bottom:1px solid #e1e1e1;text-align:right">
                                            c65f2cf9-e0ad-40da-b4a6-<wbr>08dbec6d5115
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-weight:500;padding:1.5rem 0;color:#131212;padding:1.5rem 0">
                                            Date &amp; Time:
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