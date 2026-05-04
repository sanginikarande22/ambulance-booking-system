package com.driver;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;
import java.util.UUID;

import com.connection.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class DriverLogin
 */
@WebServlet("/DriverLogin")
public class DriverLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		String vercode = request.getParameter("vercode");
		String captchaDB = null;
		try {
			String tokens = UUID.randomUUID().toString();
			Random random = new Random();
			int newRandomCaptcha = random.nextInt(9000) + 10000;
			HttpSession hs = request.getSession();
			Connection con = DatabaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet captchResultSet = DatabaseConnection.getResultFromSqlQuery("select * from tblcaptcha");
			if (captchResultSet.next()) {
				captchaDB = captchResultSet.getString(1);
			}
			System.out.println("Entered uname: [" + uname + "]");
			System.out.println("Entered pass: [" + upass + "]");
			System.out.println("DB captcha: [" + captchaDB + "]");
			System.out.println("User captcha: [" + vercode + "]");
			if (captchaDB.equals(vercode)) {
				PreparedStatement ps = con.prepareStatement(
					    "SELECT * FROM tbldriver WHERE uname=? AND upass=?"
					);
					ps.setString(1, uname);
					ps.setString(2, upass);

					ResultSet resultset = ps.executeQuery();
				if (resultset.next()) {
					hs.setAttribute("did", resultset.getString("driver_id"));
					hs.setAttribute("uname", resultset.getString("uname"));
					hs.setAttribute("dname", resultset.getString("driver_name"));
					hs.setAttribute("mobile", resultset.getString("driver_mobile"));
					
					String driverId = resultset.getString("driver_id");

					PreparedStatement updatePs = con.prepareStatement(
						    "UPDATE tbldriver SET login_status='ONLINE', last_seen=NOW() WHERE driver_id=?"
						);
						updatePs.setString(1, resultset.getString("driver_id"));
						updatePs.executeUpdate();
					
					ResultSet ambulanceRs = DatabaseConnection.getResultFromSqlQuery(
					        "SELECT ambulance_vehicle_no FROM tblambulance " +
					        "WHERE driver_name='" + resultset.getString("driver_name") + "' " +
					        "AND status='Added'"
					    );

					    if (ambulanceRs.next()) {
					        hs.setAttribute("avn", ambulanceRs.getString("ambulance_vehicle_no"));
					        System.out.println("Session AVN set to: " + ambulanceRs.getString("ambulance_vehicle_no"));
					    } else {
					        System.out.println("No approved ambulance found for this driver.");
					    }

					int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='"+ newRandomCaptcha + "'");
					response.sendRedirect("driver-dashboard.jsp");
				} else {
					String message = "You have enter wrong credentials";
					hs.setAttribute("credential", message);
					int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
					response.sendRedirect("driver-login.jsp");
				}
			} else {
				String message = "You have enter invalid verification code";
				hs.setAttribute("verificationCode", message);
				int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
				response.sendRedirect("driver-login.jsp");
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
