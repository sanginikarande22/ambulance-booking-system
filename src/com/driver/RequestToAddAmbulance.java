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
 * Servlet implementation class RequestToAddAmbulance
 */
@WebServlet("/RequestToAddAmbulance")
public class RequestToAddAmbulance extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id=0;
		String avn = DatabaseConnection.generateAmbulanceId();
		String ambulanceType = request.getParameter("ambulanceType");
		String licenseNo = request.getParameter("licenseNo");
		String driverName = request.getParameter("dname");
		String driverMobile = request.getParameter("mobile");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		String status = "Pending";
		HttpSession session = request.getSession();
		try {
			int requestAmbulance = DatabaseConnection.insertUpdateFromSqlQuery(
					"insert into tblambulance(id,ambulance_vehicle_no,ambulance_type,driver_lincense_no,driver_name,driver_mobile,state,city,status)values('"+id+"','"
							+ avn + "','" + ambulanceType + "','" + licenseNo + "','" + driverName + "','"
							+ driverMobile + "','" + state + "','" + city + "','" + status + "')");
			if (requestAmbulance > 0) {
				String message="Ambulance added successfully, waiting for admin approval.";
				session.setAttribute("add-ambulance", message);
				response.sendRedirect("add-ambulance-driver.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
