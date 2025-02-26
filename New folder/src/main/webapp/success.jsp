<!DOCTYPE html>
<html>
<head>
    <title>Payment Successful</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; padding: 50px; }
        .success-msg { color: green; font-size: 20px; }
        .button { padding: 10px 20px; font-size: 16px; cursor: pointer; margin-top: 20px; }
    </style>
</head>
<body>

<h2 class="success-msg">Payment Successful!</h2>
<p>Your transaction was completed successfully.</p>

<!-- Redirect user to invoice page -->
<form action="invoice.jsp" method="post">
    <input type="hidden" name="paymentId" value="${paymentId}">
    <input type="hidden" name="transactionId" value="${transactionId}">
    <input type="hidden" name="receiptNumber" value="${receiptNumber}">
    <input type="hidden" name="transactionDate" value="${transactionDate}">
    <input type="hidden" name="transactionType" value="${transactionType}">
    <input type="hidden" name="billNumber" value="${billNumber}">
    <input type="hidden" name="transactionAmount" value="${transactionAmount}">
    <input type="hidden" name="transactionStatus" value="${transactionStatus}">
    
    <button type="submit" class="button">Download Invoice</button>
</form>

</body>
</html>
