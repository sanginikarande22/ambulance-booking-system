package com.patient;

import java.io.IOException;
import java.util.Random;

import com.connection.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/AccountCreate")
public class AccountCreate extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Random random = new Random();
	    int bookingNumber = random.nextInt(999999);
	    System.out.println("bookingNumber==>>"+bookingNumber);
		String patientId=request.getParameter("patientId");
		String pname = request.getParameter("patientName");
		String pemail = request.getParameter("emailId");
		String pmobile = request.getParameter("mobile");
		String paddress = request.getParameter("address");
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		HttpSession hs = request.getSession();
		
		try {
			int patientAccount=DatabaseConnection.insertUpdateFromSqlQuery("insert into tblpatient(patient_id,booking_number,patient_name,patient_email,patient_mobile,patient_address,uname,upass) values('"+patientId+"','"+bookingNumber+"','"+pname+"','"+pemail+"','"+pmobile+"','"+paddress+"','"+uname+"','"+upass+"')");
			if(patientAccount>0) {
				String message="Patient account created successfully.";
				hs.setAttribute("success-message", message);
				response.sendRedirect("patient-register.jsp");
			}else {
				response.sendRedirect("patient-register.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
