	package com.driver;

import java.io.IOException;

import com.connection.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class DriverAccountCreate
 */
@WebServlet("/DriverAccountCreate")
public class DriverAccountCreate extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String driverId=request.getParameter("driverId");
		String dname = request.getParameter("dname");
		String demail = request.getParameter("demail");
		String dmobile = request.getParameter("dmobile");
		String daddress = request.getParameter("daddress");
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		HttpSession hs = request.getSession();
		
		try {
			int patientAccount=DatabaseConnection.insertUpdateFromSqlQuery("insert into tbldriver(driver_id,driver_name,driver_email,driver_mobile,driver_address,uname,upass) values('"+driverId+"','"+dname+"','"+demail+"','"+dmobile+"','"+daddress+"','"+uname+"','"+upass+"')");
			if(patientAccount>0) {
				String message="Driver account created successfully.";
				hs.setAttribute("success-message", message);
				response.sendRedirect("driver-register.jsp");
			}else {
				response.sendRedirect("driver-register.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
