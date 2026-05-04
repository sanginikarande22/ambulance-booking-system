package com.connection;

import java.sql.*;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DatabaseConnection {

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ambulancedb?useSSL=false",
            "root",
            "root"
        );
    }

    public static ResultSet getResultFromSqlQuery(String sql) {
        try {
            Connection conn = getConnection();
            Statement st = conn.createStatement();
            return st.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Database query failed.");
        }
    }
    
    public static int insertUpdateFromSqlQuery(String sql) {
        try (Connection conn = getConnection();
             Statement st = conn.createStatement()) {

            return st.executeUpdate(sql);

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Database update failed.");
        }
    }
	public static String generatePatientId() {
		String vid = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		vid = sdf.format(new Date());
		vid = "P" + vid;
		System.out.println("Patient Id " + vid);
		return vid;
	}
	
	public static String generateDriverId() {
		String did = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		did = sdf.format(new Date());
		did = "D" + did;
		System.out.println("Driver Id " + did);
		return did;
	}
	
	public static String generateAmbulanceId() {
		String aid = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		aid = sdf.format(new Date());
		aid = "AVN" + aid;
		System.out.println("Driver Id " + aid);
		return aid;
	}
}
