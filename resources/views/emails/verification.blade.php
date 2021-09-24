<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#e8ebef">
    @php
    $logo = get_setting('header_logo');
    @endphp
    <tr>
        <td align="center" valign="top" class="container" style="padding:50px 10px;">
            <!-- Container -->
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="center">
                        <table width="650" border="0" cellspacing="0" cellpadding="0" class="mobile-shell">
                            <tr>
                                <td class="td" bgcolor="#ffffff" style="width:650px; min-width:650px; font-size:0pt; line-height:0pt; padding:0; margin:0; font-weight:normal;">
                                    <!-- Header -->
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
                                        <tr>
                                            <td class="p30-15-0" style="padding: 40px 30px 0px 30px;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <th class="column" style="font-size:0pt; line-height:0pt; padding:0; margin:0; font-weight:normal;">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td class="img m-center" style="font-size:0pt; line-height:0pt; text-align:left;"><a href="https://emed.com.bd" target="_blank" class="link" style="color:#000001; text-decoration:none;"><img src="https://emed.com.bd/public/uploads/all/ORfAEpPbndJbgiUedq6tY1AqoWYmBpKd2oPnG3JM.png" height="34" border="0" alt=""></a></td>
                                                                </tr>
                                                            </table>
                                                        </th>
                                                        <th class="column-empty" width="1" style="font-size:0pt; line-height:0pt; padding:0; margin:0; font-weight:normal;"></th>
                                                        {{-- <th class="column" width="120" style="font-size:0pt; line-height:0pt; padding:0; margin:0; font-weight:normal;">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td class="text-header right" style="color:#000000; font-family:'Fira Mono', Arial,sans-serif; font-size:12px; line-height:16px; text-align:right;"><a href="https://emed.com.bd" target="_blank" class="link" style="color:#000001; text-decoration:none;"><span class="link" style="color:#000001; text-decoration:none;">{{ env('APP_NAME') }}</span></a></td>
                                                                </tr>
                                                            </table>
                                                        </th> --}}
                                                    </tr>
                                                </table>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td class="separator" style="padding-top: 20px; border-bottom:1px solid rgb(3, 149, 207); font-size:0pt; line-height:0pt;">&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <!-- END Header -->

                                    <!-- Intro -->
                <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
                    <tr>
                        <td class="p30-15" style="padding: 30px 30px 10px 30px;">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="h3 center pb10" style="color:#000000; font-family:'Ubuntu', Arial,sans-serif; font-size:30px; font-weight:700; line-height:60px; text-align:center; padding-bottom:10px;">{{ $array['subject'] }}</td>
                                </tr>
                                <tr>
                                    <td class="h6 center blue pb30" style="font-family:'Ubuntu', Arial,sans-serif; font-size:16px; line-height:26px; text-align:center; color:#2e57ae; padding-bottom:30px;"> @if(!empty( $array['link']))<a style="text-decoration: none" href="{{ $array['link'] }}">@endif {{ $array['content'] }}</a> </td>

                                </tr>
                                <tr>
                                    <td class="h6 center blue pb30" style="font-family:'Ubuntu', Arial,sans-serif; font-size:14px; line-height:15px; text-align:justify; color:#08132c; padding-bottom:30px;">
                                        <p>
                                        Please pay attention: <br>
                                        After verification, you will be able to place Order, Modify your Password & Other profile details.
                                        If you did not apply for a verification code,
                                        Please <a style="text-decoration: none" href="{{ route('user.login') }}" target="_blank" rel="noopener noreferrer">sign in</a> to your account and change your password to ensure your account's security.
                                        and skip this mail. <br>
                                        In order to protect your account, Please do not allow others access to your email.
                                        </p>
</td>
                                </tr>
                                @if(!empty( $array['link']))
                                <tr>
                                    <td class="h6 center blue pb30" style="font-family:'Ubuntu', Arial,sans-serif; font-size:20px; line-height:26px; text-align:center; color:#2e57ae; padding-bottom:30px">
                                        <form method="get" action="{{ $array['link'] }}">
                                        <button style="cursor: pointer;background: #7045d4e8;padding: 0.45rem 1rem;font-size:14px;color:#fff;border-radius: .2rem;">{{ translate("Verify") }}</button>
                                        </form>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="separator" style="padding-top: 20px; border-bottom:1px solid rgb(3, 149, 207); font-size:0pt; line-height:0pt;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="h6 center blue " style="font-family:'Ubuntu', Arial,sans-serif; font-size:14px; line-height:15px; text-align:center; color:#08132c; padding-bottom:5px; padding-top:5px;">

                                        &#169;2020-2021 eMed Technology Ltd. All rights reserved.
                                    </td>
                                </tr>
                                @endif
                            </table>
                        </td>
                    </tr>
                </table>
                                    <!-- END Intro -->
                                </td>
                            </tr>
                            <tr>
                                <td class="text-footer" style="padding-top: 30px; color:#1f2125; font-family:'Fira Mono', Arial,sans-serif; font-size:12px; line-height:22px; text-align:center;">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <!-- END Container -->
        </td>
    </tr>
</table>

