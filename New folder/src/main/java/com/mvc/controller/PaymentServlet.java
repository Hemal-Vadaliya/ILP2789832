package com.mvc.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Simulated payment processing logic
	    String paymentId = "PAY12345"; // Generate dynamically
	    String transactionId = "TXN67890"; // Generate dynamically
	    String receiptNumber = "RCPT56789"; // Generate dynamically
	    String transactionDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	    String transactionType = request.getParameter("cardType"); // Credit or Debit
	    String billNumber = request.getParameter("billNumber"); 
	    String transactionAmount = request.getParameter("transactionAmount");
	    String transactionStatus = "Success"; // Assume success for now

	    // Set attributes to forward to invoice.jsp
	    request.setAttribute("paymentId", paymentId);
	    request.setAttribute("transactionId", transactionId);
	    request.setAttribute("receiptNumber", receiptNumber);
	    request.setAttribute("transactionDate", transactionDate);
	    request.setAttribute("transactionType", transactionType);
	    request.setAttribute("billNumber", billNumber);
	    request.setAttribute("transactionAmount", transactionAmount);
	    request.setAttribute("transactionStatus", transactionStatus);

	    // Forward request to invoice.jsp
	    RequestDispatcher dispatcher = request.getRequestDispatcher("invoice.jsp");
	    dispatcher.forward(request, response);
	}


    private boolean validateCardNumber(String cardNumber) {
        return cardNumber != null && cardNumber.matches("\\d{16}");
    }

    private boolean validateCVV(String cvv) {
        return cvv != null && cvv.matches("\\d{3}");
    }

    private boolean validateExpiry(String expiry) {
        if (expiry == null || !expiry.matches("^(0[1-9]|1[0-2])/\\d{2}$")) {
            return false;
        }

        String[] parts = expiry.split("/");
        int month = Integer.parseInt(parts[0]);
        int year = Integer.parseInt("20" + parts[1]);

        YearMonth enteredDate = YearMonth.of(year, month);
        YearMonth currentDate = YearMonth.now();

        return !enteredDate.isBefore(currentDate);
    }
}

