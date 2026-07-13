<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Password Reset</title>
</head>

<body style="margin:0;padding:0;background:#f4f7fb;font-family:Arial,Helvetica,sans-serif;">

<table width="100%" cellpadding="0" cellspacing="0" style="background:#f4f7fb;padding:40px 15px;">
    <tr>
        <td align="center">

            <table width="600" cellpadding="0" cellspacing="0" style="background:#ffffff;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(0,0,0,.08);">

                <!-- Header -->
                <tr>
                    <td align="center" style="background:linear-gradient(135deg,#0f4c81,#1b74d1);padding:40px 20px;">
                        <h1 style="margin:0;color:#ffffff;font-size:30px;font-weight:bold;">
                            Kashyap Infratech
                        </h1>
                        <p style="margin-top:10px;color:#dbeafe;font-size:15px;">
                            Property & Design Portal
                        </p>
                    </td>
                </tr>

                <!-- Body -->
                <tr>
                    <td style="padding:40px;">

                        <h2 style="margin-top:0;color:#273142;">
                            Reset Your Password
                        </h2>

                        <p style="font-size:16px;color:#555;">
                            Hello <strong>{{ $user->first_name ?: 'Valued User' }}</strong>,
                        </p>

                        <p style="font-size:16px;color:#555;">
                            We received a request to reset the password associated with your
                            <strong>Kashyap Infratech Property & Design Portal</strong> account.
                        </p>

                        <p style="font-size:16px;color:#555;">
                            Click the button below to create a new password.
                        </p>

                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" style="padding:30px 0;">
                                    <a href="{{ $resetUrl }}"
                                       style="background:#0f4c81;
                                              color:#ffffff;
                                              text-decoration:none;
                                              padding:15px 35px;
                                              font-size:16px;
                                              border-radius:6px;
                                              display:inline-block;
                                              font-weight:bold;">
                                        Reset Password
                                    </a>
                                </td>
                            </tr>
                        </table>

                        <p style="font-size:15px;color:#666;">
                            This password reset link will expire in
                            <strong>60 minutes</strong>.
                        </p>

                        <p style="font-size:15px;color:#666;">
                            If the button doesn't work, copy and paste the following URL into your browser:
                        </p>

                        <p style="background:#f7f8fa;border:1px solid #e5e7eb;padding:15px;border-radius:6px;word-break:break-all;font-size:14px;color:#0f4c81;">
                            {{ $resetUrl }}
                        </p>

                        <hr style="border:none;border-top:1px solid #ececec;margin:35px 0;">

                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="50" valign="top" style="font-size:28px;">
                                    🔒
                                </td>
                                <td>
                                    <strong style="color:#273142;">Security Notice</strong>

                                    <p style="margin-top:8px;color:#666;font-size:15px;">
                                        If you did not request this password reset,
                                        you can safely ignore this email.
                                        Your account will remain secure and no changes
                                        will be made.
                                    </p>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>

                <!-- Footer -->
                <tr>
                    <td style="background:#273142;padding:30px;text-align:center;">

                        <h3 style="margin:0;color:#ffffff;">
                            Kashyap Infratech
                        </h3>

                        <p style="margin:10px 0;color:#d1d5db;font-size:14px;">
                            Building Trust • Creating Value • Delivering Excellence
                        </p>

                        <p style="margin:5px 0;color:#d1d5db;font-size:13px;">
                            Property & Design Portal
                        </p>

                        <p style="margin:20px 0 0;color:#9ca3af;font-size:12px;">
                            This is an automated email. Please do not reply to this message.
                        </p>

                        <p style="margin-top:8px;color:#9ca3af;font-size:12px;">
                            © {{ date('Y') }} Kashyap Infratech. All Rights Reserved.
                        </p>

                    </td>
                </tr>

            </table>

        </td>
    </tr>
</table>

</body>
</html>

@if(false)
<!doctype html>
<html lang="en">
<body style="font-family:Arial,sans-serif;color:#273142;line-height:1.6;">
    <h2>Reset your password</h2>
    <p>Hello {{ $user->first_name ?: 'there' }},</p>
    <p>We received a request to reset the password for your Property &amp; Design Portal account.</p>
    <p><a href="{{ $resetUrl }}" style="display:inline-block;padding:12px 20px;background:#2563eb;color:#fff;text-decoration:none;border-radius:6px;">Reset Password</a></p>
    <p>This link expires in 60 minutes. If you did not request a password reset, you can ignore this email.</p>
</body>
</html>
@endif
