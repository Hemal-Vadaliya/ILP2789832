<!DOCTYPE html>
<html>
<head>
    <title>Payment Invoice</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; }
        .invoice-container { max-width: 600px; margin: auto; padding: 20px; border: 1px solid #ddd; }
        .invoice-container h2 { text-align: center; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        table, th, td { border: 1px solid black; padding: 10px; text-align: left; }
        .success-msg { color: green; font-size: 20px; }
        .print-button { margin-top: 20px; }
    </style>
</head>
<body>

<h2 class="success-msg">Payment Successful!</h2>

<div class="invoice-container">
    <h2>Payment Invoice</h2>
    <table>
        <tr><th>Payment ID</th><td>${paymentId}</td></tr>
        <tr><th>Transaction ID</th><td>${transactionId}</td></tr>
        <tr><th>Receipt Number</th><td>${receiptNumber}</td></tr>
        <tr><th>Transaction Date</th><td>${transactionDate}</td></tr>
        <tr><th>Transaction Type</th><td>${transactionType}</td></tr>
        <tr><th>Bill Number</th><td>${billNumber}</td></tr>
        <tr><th>Transaction Amount</th><td>${transactionAmount}</td></tr>
        <tr><th>Transaction Status</th><td>${transactionStatus}</td></tr>
    </table>

    <div class="print-button">
        <button onclick="window.print()">Download Invoice</button>
    </div>
</div>

</body>
</html>
