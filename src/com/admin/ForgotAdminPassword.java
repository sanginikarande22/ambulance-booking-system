package com.admin;

import java.io.IOException;
import java.sql.ResultSet;

import com.connection.DatabaseConnection;
import com.email.EmailUtility;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ForgotAdminPassword
 */
@WebServlet("/ForgotAdminPassword")
public class ForgotAdminPassword extends HttpServlet {

	private String host;
	private String port;
	private String user;
	private String pass;

	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String uname = "";
		String password = null;
		String userPassword = "";
		String databaseEmailId = "";
		String resultMessage = "";
		String message = "Ambulance Management System";
		HttpSession session = request.getSession();
		try {
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select email from tbladmin where email='" + email + "'");
			if (resultset.next()) {
				databaseEmailId = resultset.getString("email");
			}

			if (databaseEmailId.equals(email)) {
				ResultSet resultPassword = DatabaseConnection.getResultFromSqlQuery("select uname,upass from tbladmin where email='" + email + "'");
				if (resultPassword.next()) {
					uname = resultPassword.getString("uname");
					password = resultPassword.getString("upass");
					userPassword = "Hi " + uname + "," + System.lineSeparator() + System.lineSeparator()+ "Your Admin Login Portal" + System.lineSeparator() + "User Name: " + uname+ System.lineSeparator() + "Password: " + password + System.lineSeparator()+ System.lineSeparator() + "Thank you." + System.lineSeparator()+ "Ambulance Management System Team.";
					EmailUtility.sendEmail(host, port, "dmnambulance2021@gmail.com", "admin2021", email, message,userPassword);
					resultMessage = "Your login user name & password send successfully in your email.";
					session.setAttribute("mail-success", resultMessage);
					response.sendRedirect("admin-forgot-password.jsp");
				}
			} else {
				String fail = "Your email id is wrong, unable to get password.";
				session.setAttribute("error", fail);
				response.sendRedirect("admin-forgot-password.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
