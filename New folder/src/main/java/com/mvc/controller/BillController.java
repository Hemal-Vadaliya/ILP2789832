package com.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mvc.model.Bill;
import com.mvc.service.BillService;
import com.mvc.util.DatabaseUtil;

@WebServlet("/BillController")
public class BillController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = DatabaseUtil.getConnection()) {
            BillService billService = new BillService(conn);
            List<Bill> bills = billService.getAllBills();

            request.setAttribute("bills", bills);
            request.getRequestDispatcher("bills.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to load bills. Please try again.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
