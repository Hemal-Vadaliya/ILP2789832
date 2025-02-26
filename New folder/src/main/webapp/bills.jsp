<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List" %>
<%@page import="com.mvc.model.Bill" %>

<html>
<head>
    <title>Bill Payment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 20px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background: white;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }
        .hidden { display: none; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        .form-group {
            margin-bottom: 10px;
        }
        label {
            font-weight: bold;
            display: block;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .error {
            color: red;
            font-size: 14px;
        }
        .buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .buttons button {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .pay-btn { background-color: #28a745; color: white; }
    </style>

    <script>
    function updateTotalAmount() {
        var checkboxes = document.querySelectorAll(".bill-checkbox:checked");
        var totalAmount = 0;
        var selectedBills = [];

        checkboxes.forEach(function (checkbox) {
            var amount = parseFloat(checkbox.getAttribute("data-amount"));
            if (!isNaN(amount)) {
                totalAmount += amount;
            }
            selectedBills.push(checkbox.value);
        });

        document.getElementById("totalAmount").value = totalAmount.toFixed(2);
        document.getElementById("selectedBills").value = selectedBills.join(",");
    }

    function showCardDetails() {
        var paymentMethod = document.getElementById("paymentMethod").value;
        var cardDetails = document.getElementById("cardDetails");
        
        if (paymentMethod === "credit" || paymentMethod === "debit") {
            cardDetails.style.display = "block";
        } else {
            cardDetails.style.display = "none";
        }
    }

    function validateCardNumber() {
        var cardNumber = document.getElementById("cardNumber").value;
        var error = document.getElementById("cardNumberError");
        var regex = /^\d{16}$/;
        error.textContent = regex.test(cardNumber) ? "" : "Enter a valid 16-digit card number.";
    }

    function validateCVV() {
        var cvv = document.getElementById("cvv").value;
        var error = document.getElementById("cvvError");
        var regex = /^\d{3}$/;
        error.textContent = regex.test(cvv) ? "" : "Enter a valid 3-digit CVV.";
    }

    function validateExpiry() {
        var expiry = document.getElementById("expiry").value;
        var error = document.getElementById("expiryError");
        var regex = /^(0[1-9]|1[0-2])\/\d{2}$/;

        if (!regex.test(expiry)) {
            error.textContent = "Enter expiry date in MM/YY format.";
            return;
        }

        var parts = expiry.split("/");
        var enteredMonth = parseInt(parts[0], 10);
        var enteredYear = parseInt("20" + parts[1], 10);

        var today = new Date();
        var currentMonth = today.getMonth() + 1;
        var currentYear = today.getFullYear();

        if (enteredYear < currentYear || (enteredYear === currentYear && enteredMonth < currentMonth)) {
            error.textContent = "Card has expired.";
        } else {
            error.textContent = "";
        }
    }

    function validatePayment() {
        var paymentMethod = document.getElementById("paymentMethod").value;
        if (paymentMethod === "credit" || paymentMethod === "debit") {
            validateCardNumber();
            validateCVV();
            validateExpiry();

            if (document.getElementById("cardNumberError").textContent !== "" ||
                document.getElementById("cvvError").textContent !== "" ||
                document.getElementById("expiryError").textContent !== "") {
                return false;
            }
        }
        return true;
    }
    </script>
</head>
<body>
    <div class="container">
        <h2>Bill Payment</h2>

        <%-- Bill Table --%>
        <table>
            <tr>
                <th>Select</th>
                <th>ID</th>
                <th>Consumer No</th>
                <th>Bill Date</th>
                <th>Billing Period</th>
                <th>Amount</th>
                <th>Due Date</th>
            </tr>
            <%
                List<Bill> bills = (List<Bill>) request.getAttribute("bills");
                if (bills != null) {
                    for (Bill bill : bills) {
            %>
            <tr>
                <td>
                    <input type="checkbox" class="bill-checkbox" name="selectedBills" value="<%= bill.getId() %>" 
                        data-amount="<%= bill.getBillAmount() %>" onchange="updateTotalAmount()">
                </td>
                <td><%= bill.getId() %></td>
                <td><%= bill.getConsumerNumber() %></td>
                <td><%= bill.getBillDate() %></td>
                <td><%= bill.getBillingPeriod() %></td>
                <td><%= bill.getBillAmount() %></td>
                <td><%= bill.getDueDate() %></td>
            </tr>
            <% 
                    }
                } else {
            %>
            <tr><td colspan="7">No bills available</td></tr>
            <% } %>
        </table>

        <%-- Payment Form --%>
        <form action="PaymentServlet" method="post" onsubmit="return validatePayment()">
            <input type="hidden" id="selectedBills" name="selectedBills">

            <div class="form-group">
                <label>Total Amount:</label>
                <input type="text" id="totalAmount" name="totalAmount" value="0.00" readonly>
            </div>

            <div class="form-group">
                <label>Payment Method:</label>
                <select id="paymentMethod" name="paymentMethod" onchange="showCardDetails()">
                    <option value="">Select</option>
                    <option value="credit">Credit Card</option>
                    <option value="debit">Debit Card</option>
                </select>
            </div>
            <div id="cardDetails" class="hidden" style="display: none;">
                <div class="form-group">
                    <label>Card Number:</label>
                    <input type="text" id="cardNumber" name="cardNumber" maxlength="16" onblur="validateCardNumber()">
                    <span id="cardNumberError" class="error"></span>
                </div>
                <div class="form-group">
                    <label>CVV:</label>
                    <input type="password" id="cvv" name="cvv" maxlength="3" onblur="validateCVV()">
                    <span id="cvvError" class="error"></span>
                </div>
                <div class="form-group">
                    <label>Expiry Date (MM/YY):</label>
                    <input type="text" id="expiry" name="expiry" maxlength="5" onblur="validateExpiry()">
                    <span id="expiryError" class="error"></span>
                </div>
            </div>

            
            

            <div class="buttons">
                <button type="submit" class="pay-btn">Proceed to Payment</button>
            </div>
        </form>
    </div>
</body>
</html>
