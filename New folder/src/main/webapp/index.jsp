<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill Payment System</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f9;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #ffffff;
            padding: 50px;
            width: 500px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            text-align: center;
        }
        h2 {
            font-size: 26px;
            margin-bottom: 15px;
            color: #374151;
            font-weight: 600;
        }
        p {
            font-size: 18px;
            color: #6b7280;
            margin-bottom: 25px;
        }
        .btn {
            display: inline-block;
            padding: 14px 28px;
            font-size: 17px;
            color: #ffffff;
            background: #2563eb;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.2s;
        }
        .btn:hover {
            background: #1e40af;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Bill Payment System</h2>
        <p>View your selected bills and proceed with payment.</p>
        <a href="BillController" class="btn">View Bills</a>
    </div>
</body>
</html>
