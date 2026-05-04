<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<%
	String driverName = request.getParameter("name");
	int deleteDriver = DatabaseConnection.insertUpdateFromSqlQuery("delete tbldriver,tblambulance from tbldriver INNER JOIN tblambulance ON tbldriver.driver_name=tblambulance.driver_name where tbldriver.driver_name='"+ driverName + "'");
	if (deleteDriver > 0) {
	response.sendRedirect("admin-view-drivers.jsp");
	} else {
	response.sendRedirect("driver-ambulance-record-not-found.jsp");
	}
%>