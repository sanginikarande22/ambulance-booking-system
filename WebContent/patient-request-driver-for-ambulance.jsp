<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!DOCTYPE html>
<html lang="en">

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Metas -->
<title>Ambulance Booking Service</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="style.css">
<!-- Colors CSS -->
<link rel="stylesheet" href="css/colors.css">
<!-- ALL VERSION CSS -->
<link rel="stylesheet" href="css/versions.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/custom.css">

<!-- Modernizer for Portfolio -->
<script src="js/modernizer.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body class="host_version">
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="driver-header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">Patients Request For Ambulance</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<!--    Context Classes  -->
				<div class="panel panel-default">

					<div class="panel-heading">Patients Request For Ambulance</div>

					<div class="panel-body">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>Patient Id</th>
										<th>Name</th>
										<th>Email Id</th>
										<th>Mobile</th>
										<th>Address</th>
										<th>Disease</th>
										<th>Ambulance Id</th>
										<th>Source Address</th>
										<th>Destination Address</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<%
									String avn = null;
								ResultSet rs = DatabaseConnection
										.getResultFromSqlQuery("select * from tblambulance where driver_name='" + session.getAttribute("dname") + "'");
								if (rs.next()) {
									avn = rs.getString("ambulance_vehicle_no");
								}
								System.out.println("avn " + avn);

								ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblpatient where avn='" + avn + "'");
								while (resultset.next()) {
								%>
								<tbody>
									<tr class="default">
										<td><%=resultset.getString("patient_id")%></td>
										<td><%=resultset.getString("patient_name")%></td>
										<td><%=resultset.getString("patient_email")%></td>
										<td><%=resultset.getString("Patient_mobile")%></td>
										<td><%=resultset.getString("patient_address")%></td>
										<td><%=resultset.getString("patient_disease")%></td>
										<td><%=resultset.getString("avn")%></td>
										<td><%=resultset.getString("source_city")%></td>
										<td><%=resultset.getString("destination_city")%></td>
										<%
											if (resultset.getString("ambulance_status").equals("Pending")) {
										%>
										<td><span class="label label-danger">Pending</span></td>
										<%
											} else if (resultset.getString("ambulance_status").equals("Assigned")) {
										%>
										<td><span class="label label-warning">Assigned</span></td>
										<%
											} else if (resultset.getString("ambulance_status").equals("On the way")) {
										%>
										<td><span class="label label-info">On the Way</span></td>
										<%
											} else if (resultset.getString("ambulance_status").equals("Pickup")) {
										%>
										<td><span class="label label-primary">Patient Picked</span></td>
										<%
											} else if (resultset.getString("ambulance_status").equals("Reached")) {
										%>
										<td><span class="label label-success">Reached
											Hospital</span></td>
										<%
											} else {
										%>
										<td><span class="badge badge-danger">Rejected</span></td>
										<%
											}
										%>
										<td><a
											href="driver-view-booking-details.jsp?patientId=<%=resultset.getString("patient_id")%>&avn=<%=resultset.getString("avn")%>"
											class="btn btn-info">View</a></td>
									</tr>
								</tbody>
								<%
									}
								%>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="footer.jsp"></jsp:include>
	<%
		} else {
	response.sendRedirect("index.jsp");
	}
	%>
</body>
</html>