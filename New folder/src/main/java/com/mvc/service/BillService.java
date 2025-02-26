package com.mvc.service;

import com.mvc.dao.BillDAO;
import com.mvc.model.Bill;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class BillService {
    private BillDAO billDAO;

    public BillService(Connection conn) {
        this.billDAO = new BillDAO(conn);
    }

    public List<Bill> getAllBills() throws SQLException {
        return billDAO.getAllBills();
    }
}
