<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html class="no-js" lang="">
<head>

<title>Ambulance Booking Service</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<div id="exampl">
		<br>
		<center>
			<table border="2" cellspacing="2" cellpadding="2" width="50%" height="100%">
				<tr>
					<td colspan="8"><strong><center>Ambulance Booking Receipt</center></strong></td>
				</tr>
				<%
					int isRepeat = 0;
					int srNo = 0;
					ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblpayment where patient_name='" + session.getAttribute("pname") + "'");
					if (resultset.next()) {
						srNo++;
				%>
				<tr>
					<th colspan="4">Patient Name</th>
					<td colspan="4"><%=resultset.getString("patient_name")%></td>
				</tr>
				<tr>
					<th colspan="4">Mobile No</th>
					<td colspan="4"><%=resultset.getString("patient_mobile")%></td>
				</tr>
				<tr>
					<th colspan="4">Ambulance Id</th>
					<td colspan="4"><%=resultset.getString("ambulanceId")%></td>
				</tr>
				<tr>
					<th colspan="4">Driver Name</th>
					<td colspan="4"><%=resultset.getString("driver_name")%></td>
				</tr>
				<tr>
					<th colspan="4">Ambulance Charges</th>
					<td colspan="4"><font color="green"><%=resultset.getString("payment")%>&nbsp;Rs.</font></td>
				</tr>
				<tr>
					<th colspan="4">Source Address -
					<font color="blue"><%=session.getAttribute("source")%></font></th>
					<th colspan="4">Destination Address -
					<font color="blue"><%=session.getAttribute("destination")%></font></th>
				</tr>
				<tr>
					<th colspan="4">Booking Date & Time</th>
					<td colspan="4"><%=resultset.getString("payment_date_time")%></td>
				</tr>

				<%
					}
				%>
			</table>
		</center><br>
		<center>
			<i class="fa fa-print fa-2x" aria-hidden="true"
				OnClick="CallPrint(this.value)"></i>
			<div class="checkout-left">
				<div class="checkout-right-basket animated wow slideInRight"
					data-wow-delay=".5s">
					<a href="patient-dashboard.jsp"><span
						class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>Go
						To Home</a>
				</div>
		</center>
	</div>
	<script>
		function CallPrint(strid) {
			var prtContent = document.getElementById("exampl");
			var WinPrint = window.open('', '','left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
			WinPrint.document.write(prtContent.innerHTML);
			WinPrint.document.close();
			WinPrint.focus();
			WinPrint.print();
			WinPrint.close();
		}
	</script>
	<%
		} else {
	response.sendRedirect("index.jsp");
	}
	%>
</body>
</html>