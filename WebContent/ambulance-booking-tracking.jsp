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
							<div class="table-responsive">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Patient Id</th>
											<th>Booking Number</th>
											<th>Name</th>
											<th>Email Id</th>
											<th>Mobile</th>
											<th>Address</th>
											<th>Disease</th>
											<th>Ambulance Id</th>
											<th>Source Address</th>
											<th>Destination Address</th>
											<th>View</th>
										</tr>
									</thead>
									<%
										String searchdata = request.getParameter("searchdata");
									try {
										ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblpatient where booking_number like '" + searchdata+ "' OR patient_name like '" + searchdata + "' OR Patient_mobile='" + searchdata + "' ");
										while (resultset.next()) {
									%>
									<tr class="default">
										<td><%=resultset.getString("patient_id")%></td>
										<td><%=resultset.getInt("booking_number")%></td>
										<td><%=resultset.getString("patient_name")%></td>
										<td><%=resultset.getString("patient_email")%></td>
										<td><%=resultset.getString("Patient_mobile")%></td>
										<td><%=resultset.getString("patient_address")%></td>
										<td><%=resultset.getString("patient_disease")%></td>
										<td><%=resultset.getString("avn")%></td>
										<td><%=resultset.getString("source_city")%></td>
										<td><%=resultset.getString("destination_city")%></td>
										<td><a
											href="ambulance-booking-tracking-details.jsp?patientId=<%=resultset.getString("patient_id")%>&booking_number=<%=resultset.getInt("booking_number")%>"
											class="btn btn-info">View</a></td>
									</tr>
									<%
										}
									} catch (Exception e) {
										e.printStackTrace();
									}
									%>
								</table>
							</div>
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