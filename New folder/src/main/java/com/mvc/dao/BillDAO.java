package com.mvc.dao;

import com.mvc.model.Bill;
import java.sql.*;
import java.util.*;

public class BillDAO {
    private Connection conn;
    
    public BillDAO(Connection conn) {
        this.conn = conn;
    }
    
    public List<Bill> getAllBills() throws SQLException {
        List<Bill> bills = new ArrayList<>();
        String sql = "SELECT * FROM bills"; // Adjust SQL for Derby if needed
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        
        while (rs.next()) {
            Bill bill = new Bill();
            bill.setId(rs.getInt("id"));
            bill.setConsumerNumber(rs.getString("consumer_number"));
            bill.setBillDate(rs.getString("bill_date"));
            bill.setBillingPeriod(rs.getString("billing_period"));
            bill.setBillAmount(rs.getDouble("bill_amount"));
            bill.setDueDate(rs.getString("due_date"));
            
            bills.add(bill);
        }
        return bills;
    }
}
