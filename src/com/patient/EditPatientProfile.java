package com.patient;

import java.io.IOException;

import com.connection.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class EditPatientProfile
 */
@WebServlet("/EditPatientProfile")
public class EditPatientProfile extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname=request.getParameter("fname");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String address=request.getParameter("address");
		HttpSession session=request.getSession();
		try {
			int editProfile=DatabaseConnection.insertUpdateFromSqlQuery("update tblpatient set patient_name='"+fname+"',patient_email='"+email+"',Patient_mobile='"+mobile+"',patient_address='"+address+"' where uname='"+session.getAttribute("uname")+"' and patient_id='"+session.getAttribute("pid")+"'");
			if(editProfile>0) {
				String message="Profile updated successfully.";
				session.setAttribute("profile-update", message);
				response.sendRedirect("patient-profile.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
