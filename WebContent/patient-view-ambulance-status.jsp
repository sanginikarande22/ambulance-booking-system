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
	<jsp:include page="patient-header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">Booking Ambulance Status</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<%
					String bookAmbulance = (String) session.getAttribute("book-ambulance");
					if (bookAmbulance != null) {
						session.removeAttribute("book-ambulance");
				%>
				<div class="alert alert-success" id="success">Ambulance
					booking successfully.</div>
				<%
					}
				%>
				<div class="panel panel-default">

					<div class="panel-heading">Booking Ambulance Status</div>

					<div class="panel-body">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>Patient Id</th>
										<th>Patient Name</th>
										<th>Email</th>
										<th>Mobile</th>
										<th>Address</th>
										<th>Patient Description</th>
										<th>Ambulance Id</th>
										<th>Source Address</th>
										<th>Destination Address</th>
										<th>Ambulance Status</th>
										<th>Apply Date & Time</th>
										<th>Approved Date & Time</th>
										<th>Track Driver</th>
									</tr>
								</thead>
								<%
									ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblpatient where patient_name='" + session.getAttribute("pname") + "'");
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
											String status = resultset.getString("ambulance_status");
											if (status == null || "Pending".equals(status)) {
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
										<td><span class="label label-primary">Patient
												Picked</span></td>
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
										
										<td><%=resultset.getString("created_at")%></td>
										<td><%=resultset.getString("updated_at")%></td>
										<td>
										<%
										String currentStatus = resultset.getString("ambulance_status");
										if ("On the way".equals(currentStatus) || "Pickup".equals(currentStatus)) {
										%>
										<button class="btn btn-info btn-sm"
										        onclick="startTracking('<%= resultset.getString("avn") %>')">
										    Track
										</button>
										<%
										} else {
										%>
										-
										<%
										}
										%>
										</td>
									</tr>
								</tbody>
								<%
									}
								%>
							</table>
							<div id="trackingSection" style="display:none; margin-top:20px;">
							    <h4 style="color:blue; text-align:center;">Live Driver Location</h4>
							    <h4 id="driverStatus">Checking driver status...</h4>
							    <div id="patientMap" style="height:400px;"></div>
							</div>
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
	<script type="text/javascript">
		$(function() {
			$('#success').delay(9000).show().fadeOut('slow');
		});
	</script>
	<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
	<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
	<script src="js/patient-tracking.js"></script>
</body>
</html>