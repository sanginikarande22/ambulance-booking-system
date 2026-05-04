package com.driver;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.connection.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateDriverLocation")
public class UpdateDriverLocation extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String lat = request.getParameter("lat");
	    String lng = request.getParameter("lng");

	    if (lat == null || lng == null) return;

	    HttpSession session = request.getSession(false);
	    if (session == null) return;

	    String avn = (String) session.getAttribute("avn");
	    if (avn == null) return;

	    try (Connection con = DatabaseConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(
	             "INSERT INTO tbldriverlocation (avn, latitude, longitude) " +
	             "VALUES (?, ?, ?) " +
	             "ON DUPLICATE KEY UPDATE latitude=?, longitude=?")) {

	        double latitude = Double.parseDouble(lat);
	        double longitude = Double.parseDouble(lng);

	        ps.setString(1, avn);
	        ps.setDouble(2, latitude);
	        ps.setDouble(3, longitude);
	        ps.setDouble(4, latitude);
	        ps.setDouble(5, longitude);

	        ps.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}