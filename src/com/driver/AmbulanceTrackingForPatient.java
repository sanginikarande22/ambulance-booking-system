package com.driver;

import java.io.IOException;

import com.connection.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AmbulanceTrackingForPatient
 */
@WebServlet("/AmbulanceTrackingForPatient")
public class AmbulanceTrackingForPatient extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ambregno=request.getParameter("ambregno");
		String status=request.getParameter("status");
		String remark=request.getParameter("remark");
		int bookingNumber=Integer.parseInt(request.getParameter("bookingNumber"));
		try {
			int addAmbulanceTrackingForPatient=DatabaseConnection.insertUpdateFromSqlQuery("insert into tbltrackinghistory(BookingNumber,AmbulanceRegNum,Remark,Status)values('"+bookingNumber+"','"+ambregno+"','"+remark+"','"+status+"')");
			
			int updateAmbulanceStatus=DatabaseConnection.insertUpdateFromSqlQuery("update tblpatient set ambulance_status ='"+status+"' where booking_number='"+bookingNumber+"'");
			
			if(updateAmbulanceStatus>0) {
				response.sendRedirect("patient-request-driver-for-ambulance.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
