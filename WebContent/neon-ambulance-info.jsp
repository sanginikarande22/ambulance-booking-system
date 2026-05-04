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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="host_version">
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="patient-header.jsp"></jsp:include><br>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="alert alert-default">
					<h2>Neonatal Ambulance</h2>
					<div>
						<ul>
							<li>Motherhood Neonatal Transport Service provides swift
								service for newborns in need of specialised critical care
								services equal to a Level III Neonatal Intensive Care Unit
								(NICU). Newborns are safely transported in our ambulance that is
								highly equipped with the intensive-care environment.</li>
							<li>The ambulance is operated by a team of rapid action
								medical specialists who ensure that premature infants are
								transported to Motherhood Hospitals.</li>
							<li>On the arrival, the newborns are shifted to the NICU,
								where they are provided with the best quality medical care. This
								means that the NICU meets the rigorous standards set by Indian
								Medical Association to assure that it is equipped to provide the
								most advanced care to the smallest and sickest infants.</li>
							<li>The Neonatal Transport Service is available 24 hours a
								day, seven days a week.</li>
							<li>Each transport unit includes:<br>-Total body cooling therapy <br>-Heart and lung
								monitors <br>-High frequency and conventional ventilators<br>-Nitric
								oxide <br>-Blanket warmers <br>-Passive cooling <br>-Enhanced
								Vehicle hydraulics to ensure a smoother ride <br>-Ambient
								lighting to enhance relaxation
							</li>
							<li>The Neonatal Transport Ambulance is specially designed
								to deliver critical care services and is operated by a
								multidisciplinary team of experts who involve the usage of
								advanced technology.</li>
							<li>At Level III NICU, infants are put under the treatment
								curated by a highly trained team of neonatologists, nurses,
								respiratory therapists, physical therapists, social workers and
								pharmacists.</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="alert alert-default">
					<image src="images/neon-ambulance.jpg"
						style="width:500px;height:400px;"></image>
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