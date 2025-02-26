package com.mvc.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseUtil {
    private static final String URL = "jdbc:derby:C:\\Users\\hemal\\Downloads\\Workspace\\us_4_ems\\Database;create=true";
    private static final String DRIVER = "org.apache.derby.jdbc.EmbeddedDriver";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName(DRIVER);
        return DriverManager.getConnection(URL);
    }
}
