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
 * Servlet implementation class BookAmbulance
 */
@WebServlet("/BookAmbulance")
public class BookAmbulance extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pid = 0;
		String pdisease = request.getParameter("pdisease");
		String avn = request.getParameter("vehicleNo");
		String scity = request.getParameter("scity");
		String dcity = request.getParameter("dcity");
		String ambulance_status = "Pending";
		String card_holder_name = request.getParameter("dholderName");
		String cardNumber = request.getParameter("cardNumber");
		String emonth = request.getParameter("emonth");
		String eyear = request.getParameter("eyear");
		String expiration_month_year = emonth + " " + eyear;
		int payment = Integer.parseInt(request.getParameter("charges"));
		int cvv = Integer.parseInt(request.getParameter("cvv"));
		String driverName = request.getParameter("driverName");
		String remark = request.getParameter("remark");
		HttpSession session = request.getSession();
		session.setAttribute("source", scity);
		session.setAttribute("destination", dcity);
		try {
			int bookAmbulance = DatabaseConnection.insertUpdateFromSqlQuery("update tblpatient set patient_disease='"
					+ pdisease + "',avn='" + avn + "',source_city='" + scity + "',destination_city='" + dcity
					+ "',ambulance_status='" + ambulance_status + "',remark='" + remark + "' where patient_id='"
					+ session.getAttribute("pid") + "' and uname='" + session.getAttribute("uname") + "'");

			int tbltrackinghistory = DatabaseConnection.insertUpdateFromSqlQuery("insert into tbltrackinghistory(BookingNumber,AmbulanceRegNum,Remark,Status)values('"
							+ session.getAttribute("bookingNumber") + "','" + avn + "','" + remark + "','"
							+ ambulance_status + "')");

			int addPaymentDetails = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblpayment(pid,payment,card_holder_name,debit_card_number,expiration_month_year,cvv,patient_name,patient_mobile,ambulanceId,driver_name)values('"
							+ pid + "','" + payment + "','" + card_holder_name + "','" + cardNumber + "','"
							+ expiration_month_year + "','" + cvv + "','" + session.getAttribute("pname") + "','"
							+ session.getAttribute("mobile") + "','" + avn + "','" + driverName + "')");

			if (addPaymentDetails > 0) {
				String message = "Ambulance booking successfully.";
				session.setAttribute("book-ambulance", message);
				response.sendRedirect("patient-print-invoice.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
