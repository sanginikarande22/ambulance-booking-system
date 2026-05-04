package com.patient;

import java.io.IOException;

import java.sql.ResultSet;

import com.connection.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class ManagePatientsAmbulanceRequest
 */
@WebServlet("/ManagePatientsAmbulanceRequest")
public class ManagePatientsAmbulanceRequest extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int statusMode = 0;
			ResultSet rs =DatabaseConnection.getResultFromSqlQuery("select ambulance_status from tblpatient where patient_id='" + request.getParameter("pantietId") + "'");
			while (rs.next()) {
				if (rs.getString("ambulance_status").equals("Pending")) {
					statusMode = DatabaseConnection.insertUpdateFromSqlQuery("update tblpatient set ambulance_status='Assigned' where patient_id='" + request.getParameter("pantietId") + "' and avn='"+request.getParameter("id")+"'");
				} else {
					statusMode = DatabaseConnection.insertUpdateFromSqlQuery("update tblpatient set ambulance_status='Pending' where patient_id='" + request.getParameter("pantietId") + "' and avn='"+request.getParameter("id")+"'");
				}
			}
			if (statusMode > 0) {
				response.sendRedirect("patient-request-driver-for-ambulance.jsp");
			} else {
				response.sendRedirect("patient-request-driver-for-ambulance.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
