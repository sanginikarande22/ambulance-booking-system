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
 * Servlet implementation class EditDriverProfile
 */
@WebServlet("/EditDriverProfile")
public class EditDriverProfile extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String address=request.getParameter("address");
		HttpSession session=request.getSession();
		try {
			int editProfile=DatabaseConnection.insertUpdateFromSqlQuery("update tbldriver set driver_email='"+email+"',driver_mobile='"+mobile+"',driver_address='"+address+"' where uname='"+session.getAttribute("uname")+"' and driver_id='"+session.getAttribute("did")+"'");
			if(editProfile>0) {
				String message="Profile updated successfully.";
				session.setAttribute("profile-update", message);
				response.sendRedirect("driver-profile.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
