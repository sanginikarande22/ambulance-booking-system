package com.feedback;

import java.io.IOException;

import com.connection.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddFeedback
 */
@WebServlet("/AddFeedback")
public class AddFeedback extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = 0;
		String patientId = request.getParameter("patientId");
		String patientName = request.getParameter("patientName");
		String patientMobile = request.getParameter("patientMobile");
		String avn = request.getParameter("avn");
		String dname = request.getParameter("dname");
		String type = request.getParameter("type");
		String feeback_complaint = request.getParameter("feedback");

		try {
			int addFeedback = DatabaseConnection.insertUpdateFromSqlQuery(
					"insert into tblfeedback(id,patient_id,patient_name,patient_mobile,avn,driverName,feedback_complaint_type,feedback_or_complaint)values('"
							+ id + "','" + patientId + "','" + patientName + "','" + patientMobile + "','" + avn + "','"
							+ dname + "','" + type + "','" + feeback_complaint + "')");
			if (addFeedback > 0) {
				response.sendRedirect("patient-feedback-complaints.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
