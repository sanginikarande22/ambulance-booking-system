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
	<jsp:include page="header.jsp"></jsp:include>

	<div id="support" class="section wb">
		<div class="container">
			<div class="section-title text-center">
				<h3>Ambulance Tracking</h3>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary">
						<div class="panel-heading">Ambulance Tracking For Patient</div>
						<div class="panel-body">
						<%
							int bookingNumber = 0;
							String status = null;
							String avn = null;
							String patientId = request.getParameter("patientId");
							int booking_number = Integer.parseInt(request.getParameter("booking_number"));
							ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblpatient where patient_id='" + patientId + "' OR booking_number='"+booking_number+"'");
							while (resultset.next()) {
								bookingNumber = resultset.getInt("booking_number");
								status = resultset.getString("ambulance_status");
								avn = resultset.getString("avn");
						%>
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
								<th>Ambulance Vehicle No</th>
								<td><%=resultset.getString("avn")%></td>
								<th>Ambulance Status</th>
								<td><%=resultset.getString("ambulance_status")%></td>
							</tr>
						</table>
						<%
							}
						%>
						<%
							if ("On the way".equals(status) || "Pickup".equals(status)) {
							%>
							
							<hr>
							<h4 style="text-align:center; color:blue;">
							    Live Ambulance Location
							</h4>
							
							<div id="trackingSection" style="display:none;">
							
							    <div style="text-align:center; margin-bottom:10px;">
							        <strong>Driver Status: </strong>
							        <span id="driverStatus"></span>
							    </div>
							
							    <div id="patientMap" style="height:400px; width:100%;"></div>
							
							</div>
							
							<script>
							    var avn = "<%= avn %>";
							
							    document.addEventListener("DOMContentLoaded", function () {
							        startTracking(avn);
							    });
							</script>
							
							<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
							<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
							<script src="js/patient-tracking.js"></script>
							
							<%
							}
							%>
						</div>
					</div>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</div>
	<!-- end section -->
	<jsp:include page="footer.jsp"></jsp:include>
	<a href="#" id="scroll-to-top" class="dmtop global-radius"><i
		class="fa fa-angle-up"></i></a>

	<!-- ALL JS FILES -->
	<script src="js/all.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyCKjLTXdq6Db3Xit_pW_GK4EXuPRtnod4o"></script>
	<!-- Mapsed JavaScript -->
	<script src="js/mapsed.js"></script>
	<script src="js/01-custom-places-example.js"></script>
	<!-- ALL PLUGINS -->
	<script src="js/custom.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#info').delay(3000).show().fadeOut('slow');
		});
	</script>
</body>
</html>