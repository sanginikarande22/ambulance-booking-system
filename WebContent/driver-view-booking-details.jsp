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

<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body class="host_version">
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="driver-header.jsp"></jsp:include>
	<div class="container">
		<br>
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">BOOKING DETAILS FOR AN AMBULANCE</h4>
			</div>
		</div>
		<div class="row">

			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="panel panel-info">
					<div class="panel-heading">BOOKING DETAILS FOR AN AMBULANCE</div>
					<div class="panel-body">
						<%
							int bookingNumber = 0;
							String status = null;
							String patientId = request.getParameter("patientId");
							ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblpatient where patient_id='" + patientId + "'");
							while (resultset.next()) {
								bookingNumber = resultset.getInt("booking_number");
								status = resultset.getString("ambulance_status");
								
						%>
						<script>
						    var bookingStatus = "<%= status %>";
						</script>
						
						<table border="1" class="table table-bordered mg-b-0">
							<tr align="center">
								<th colspan="6"
									style="font-size: 20px; color: blue; text-align: center;">
									View Request Details of # <%=resultset.getInt("booking_number")%></th>

							</tr>
							<tr>
								<th>Patient Name</th>
								<td><%=resultset.getString("patient_name")%></td>
								<th>Email Id</th>
								<td><%=resultset.getString("patient_email")%></td>
							</tr>
							<tr>
								<th>Mobile No</th>
								<td><%=resultset.getString("patient_mobile")%></td>
								<th>Address</th>
								<td><%=resultset.getString("patient_address")%></td>
							</tr>
							<tr>
								<th>Disease</th>
								<td><%=resultset.getString("patient_disease")%></td>
								<th>Ambulance Request Date</th>
								<td><%=resultset.getString("created_at")%></td>
							<tr>
							<tr>
								<th>Source Address</th>
								<td><%=resultset.getString("source_city")%></td>
								<th>Destination Address</th>
								<td><%=resultset.getString("destination_city")%></td>
							</tr>
							<tr>
								<th>Ambulance Status</th>
								<td><%=resultset.getString("ambulance_status")%></td>
							</tr>
						</table>
						<%
							}
						%>
						<table border="1" class="table table-bordered mg-b-0">
							<tr align="center">
								<th colspan="6"
									style="font-size: 20px; color: blue; text-align: center;">
									Tracking History</th>
							</tr>
							<tr>
								<th>Remark</th>
								<th>Status</th>
								<th>Ambulance Vehicle Number</th>
								<th>Action Date</th>
							</tr>
							<%
								int count = 0;
								String avn = request.getParameter("avn");
								ResultSet resultsetTrackingDetails = DatabaseConnection.getResultFromSqlQuery("select * from tbltrackinghistory where BookingNumber='" + bookingNumber + "'");
								while (resultsetTrackingDetails.next()) {
							%>
							<tr>
								<td><%=resultsetTrackingDetails.getString("Remark")%></td>
								<td>
									 <%
										if (resultsetTrackingDetails.getString("Status").equals("Pending")) {
									 %> <span class="label label-danger">Pending</span> <%
									 	} else if (resultsetTrackingDetails.getString("Status").equals("Assigned")) {
									 %> <span class="label label-warning">Assigned</span> <%
									 	} else if (resultsetTrackingDetails.getString("Status").equals("On the way")) {
									 %> <span class="label label-info">On the Way</span> <%
									 	} else if (resultsetTrackingDetails.getString("Status").equals("Pickup")) {
									 %> <span class="label label-primary">Patient Picked</span> <%
									 	} else if (resultsetTrackingDetails.getString("Status").equals("Reached")) {
									 %> <span class="label label-success">Reached
																			Hospital</span> <%
									 	} else {
									 %> <span class="label label-danger">Rejected</span> <%
									 	}
									 %>
								</td>
								<td><%=resultsetTrackingDetails.getString("AmbulanceRegNum")%></td>
								<td><%=resultsetTrackingDetails.getString("UpdationDate")%></td>
							</tr>
							<%
								}
							%>
						</table>
						
						<% if(!"Reached".equals(status)) { %>
						<h4 style="color:blue; text-align:center;">Live Driver Location</h4>
						    <div id="map" style="height:400px;"></div>
						<% } %>
						<hr>
						<%
							if (status.equals("Pending") || status.equals("Assigned") || status.equals("On the way") || status.equals("Pickup")) {
						%>
						<form action="AmbulanceTrackingForPatient" method="post">
							<table border="1" class="table table-bordered mg-b-0">
								<tr>
									<td colspan="6"
										style="font-size: 18px; text-align: center; color: blue;">Administrator
										Work</td>
								</tr>

								<input type="hidden" name="ambregno" value="<%=avn%>">
								<input type="hidden" name="bookingNumber" value="<%=bookingNumber%>">
								<tr>
									<th>Status :</th>
									<td><select class=" form-control" id="status"
										name="status" required="true" value="">
											<option value="">Choose Status</option>
											<%
												if (status.equals("Pending")) {
											%>
											<option value="Assigned">Assigned</option>
											<option value="Rejected">Rejected</option>
											<%
												} else if (status.equals("Assigned")) {
											%>
											<option value="On the way">On the way</option>
											<%
												} else if (status.equals("On the way")) {
											%>
											<option value="Pickup">Pick Patient</option>
											<%
												} else if (status.equals("Pickup")) {
											%>
											<option value="Reached">Reached</option>
											<%
												}
											%>
									</select></td>
								</tr>
								<tr>
									<th>Remark :</th>
									<td><textarea class="form-control" required name="remark"></textarea></td>
								</tr>
								<tr align="center">
									<td colspan="2"><button type="submit" name="submit"
											class="btn btn-primary">Update</button></td>
								</tr>
							</table>
						</form>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>

	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<%
		} else {
	response.sendRedirect("index.jsp");
	}
	%>
</body>
<script type="text/javascript">
    var contextPath = '<%= request.getContextPath() %>';
</script>
<script type="text/javascript">
	$(function() {
		$('#success').delay(3000).show().fadeOut('slow');
	});
	
</script>

<script src="js/driver-tracking.js"></script>
</html>