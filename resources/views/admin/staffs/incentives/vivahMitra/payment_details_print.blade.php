<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Statement</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        .statement-box {
            max-width: 900px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border: 1px solid #eee;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
        }

        .logo img {
            max-width: 120px;
        }

        .company-details {
            text-align: right;
        }

        .company-details h2 {
            margin: 0;
            color: #333;
        }

        .details {
            margin-top: 20px;
        }

        .details table {
            width: 100%;
        }

        .details td {
            padding: 5px 0;
        }

        .table-section {
            margin-top: 20px;
        }

        table.payment-table {
            width: 100%;
            border-collapse: collapse;
        }

        .payment-table th {
            background: #333;
            color: #fff;
            padding: 10px;
            text-align: left;
        }

        .payment-table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .payment-table tr:nth-child(even) {
            background: #f9f9f9;
        }

        .total-row td {
            font-weight: bold;
            border-top: 2px solid #333;
        }

        .total-row td:last-child {
            color: green;
            font-size: 18px;
        }

        .footer {
            margin-top: 30px;
            text-align: center;
            font-size: 12px;
            color: #777;
        }

        @media print {
            body {
                background: none;
            }
            .statement-box {
                box-shadow: none;
                border: none;
            }
        }
    </style>
</head>
<body onload="window.print();">

<div class="statement-box">

    <!-- Header -->
    <div class="header">
        <div class="logo">
            <img src="{{ static_asset('assets/assets_vivah_mitra/images/ghar-logo.png') }}" alt="Company Logo">
        </div>
        <div class="company-details">
            <h2>Ghar Aanagn Foundation</h2>
            <p>Reg. Office - Kathotiya Gali Chowk, Patna City, Patna,</br> Sampatchak, Bihar, India, 800008</p>
            <p>Email: gharaanganfoundation@gmail.com</p>
            <p>Website: www.gharaanganfoundation.org</p>
        </div>
    </div>

    <!-- Statement Details -->
    <div class="details">
        <table>
            <tr>
                <td><strong>Name:</strong> {{ $user->first_name }}</td>
                <td><strong>Designation:</strong> {{ $user->designation_name }}</td>
                <td><strong>Mobile:</strong> {{ $user->mobile }}</td>
            </tr>
            <tr>
                <td><strong>Employee Code:</strong> {{ $user->employee_code }}</td>
                <td><strong>Joining Date:</strong> {{ date('d M, Y', strtotime($user->created_at)) }}</td>
				<td><strong>State:</strong> {{ $user->state_name }}</td>
            </tr>
			<tr>
                
                <td><strong>District:</strong> {{ $user->district_name }}</td>
				<td><strong>Block:</strong> {{ $user->block_name }}</td>
                <td><strong>Panchayat:</strong> {{ $user->panchayat_name }}</td>
            </tr>
			<tr>
                <td><strong>Address:</strong> {{ $user->address }}</td>
            </tr>
			
			<tr>
                <td style="text-align:center;font-size:22px;" colspan="3"><strong>Payment Statement:</strong></td>
            </tr>
			
        </table>
    </div>

    <!-- Table -->
    <div class="table-section">
        <table class="payment-table">
            <thead>
                <tr>
					<th>#</th>
					<th>Date</th>
					<th>Way of Payment Details</th>
					<th>Amount</th>
					
				</tr>
            </thead>
            <tbody>
               @php $totalAmount = 0; @endphp

				@forelse($transactions as $key => $t)
				@php $totalAmount += $t->amount; @endphp
				<tr>
					<td>{{ $key+1 }}</td>
					<td>{{ $t->created_at->format('d-M-Y') }}</td>
					<td class="remark-wrap"> @if($t->remarks!=null) {{ $t->remarks }} @else {{ $t->credit_type }} @endif </td>
					<td>₹&nbsp;{{ number_format($t->amount, 2) }}</td>
				</tr>
				@empty
				<tr>
					<td colspan="4" class="text-center text-danger">
						No transactions found
					</td>
				</tr>
				@endforelse

				<tr class="total-row">
					<td colspan="3" align="right"><strong>Total Amount</strong></td>
					<td><strong>₹&nbsp;{{ number_format($totalAmount, 2) }}</strong></td>
				</tr>
				@php
					$admin_charge = $totalAmount*2/100;
					$service_charge = $totalAmount*2/100;
					
					$total_deduct = $admin_charge+$service_charge;
				@endphp
				<tr class="total-row">
					<td colspan="3" align="right"><strong>Admin Charge 2%</strong></td>
					<td style="color:red;"><strong>₹&nbsp;{{ number_format($admin_charge, 2) }}</strong></td>
				</tr>
				<tr class="total-row">
					<td colspan="3" align="right"><strong>Service Charge 2%</strong></td>
					<td style="color:red;"><strong>₹&nbsp;{{ number_format($service_charge, 2) }}</strong></td>
				</tr>
				<tr class="total-row">
					<td colspan="3" align="right"><strong>KIT Charge 10%</strong></td>
					<td style="color:red;"><strong>₹&nbsp;{{ 0.00 }}</strong></td>
				</tr>
				<tr class="total-row">
					<td colspan="3" align="right"><strong>TDS Charge 2%</strong></td>
					<td style="color:red;"><strong>₹&nbsp;{{ 0.00 }}</strong></td>
				</tr>
				<tr style="background-color:#ccc;" class="total-row">
					<td colspan="3" align="right"><strong>Net Payout</strong></td>
					<td><strong>₹&nbsp;{{ number_format($totalAmount-$total_deduct, 2) }}</strong></td>
				</tr>


            </tbody>
        </table>
    </div>

    <!-- Footer -->
    <div class="footer">
        <h4 style="color:red;font-weight:bold;">नोट-कृपया वॉलेट में न्यूनतम ₹500/- बैलेंस बनाए रखना अनिवार्य है।</h4>
        <p>Thank you for your business!</p>
    </div>

</div>

</body>
</html>