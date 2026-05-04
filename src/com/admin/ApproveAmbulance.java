package com.admin;

import java.io.IOException;

import com.connection.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ApproveAmbulance
 */
@WebServlet("/ApproveAmbulance")
public class ApproveAmbulance extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String avn=request.getParameter("avn");
		try {
			int addAmbulance=DatabaseConnection.insertUpdateFromSqlQuery("update tblambulance set status='Added' where id='"+id+"' and ambulance_vehicle_no='"+avn+"'");
			if(addAmbulance>0) {
				response.sendRedirect("admin-view-ambulance.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
