<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<jsp:include page="patient-header.jsp"></jsp:include><br>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-body">
				<div style="text-transform: uppercase">
					<strong>Ambulance Types</strong><br>
				</div>
				<br>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<image src="images/advance-ambulance-icons.png" style="width:200px;height:150px;"></image><br>
						<strong style="text-transform: uppercase; font-size: 12px;"><a
							href="advance-life-support-ambulance-info.jsp" class="text-dark" target="_blank">Advanced Life
								Support Ambulance</a></strong><br> <br>
						<p>Large Size ambulance ideal for critically ill patients</p>
					</div>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<image src="images/basic-ambulance-icon.jpg" style="width:200px;height:150px;"></image><br>
						<strong style="text-transform: uppercase; font-size: 12px;"><a
							href="basic-life-support-ambulance-info.jsp" class="text-dark" target="_blank">Basic Life Support
								Ambulance</a></strong><br> <br>
						<p>For medical transportation and continuous medical
							supervision.</p>
					</div>
				</div>
				<br> <br> <br> <br> <br> <br> <br>
				<br>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<image src="images/cardiac-ambulance.jpg" style="width:200px;height:150px;"></image><br>
						<strong style="text-transform: uppercase; font-size: 12px;"><a
							href="cardiac-ambulance-info.jsp" class="text-dark" target="_blank">Cardiac Ambulance</a></strong><br>
						<br>
						<p class="text-left">Cardiac Ambulances are designed specifically to provide
							assistance to patients suffering from cardiac diseases, which are
							among the deadliest killers known to man today.</p>
					</div>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<image src="images/neon-ambulance.jpg" style="width:200px;height:150px;"></image><br>
						<strong style="text-transform: uppercase; font-size: 12px;"><a
							href="neon-ambulance-info.jsp" class="text-dark" target="_blank">Neo Natal Ambulance</a></strong><br>
						<br>
						<p>For emergency transfers for neonates who require more
							specialist treatment at another hospital.</p>
					</div>
				</div>
				<br>
			</div>
		</div>
		<div class="panel panel-danger">
			<div class="panel-body bg-info text-white">
				<div style="text-transform: uppercase">
					<strong>Ambulance Services</strong><br>
				</div>
				<br>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<image src="images/PatientTransfer.png"></image><br>
						<strong style="text-transform: uppercase; font-size: 12px;"><a
							href="" class="text-dark">Patient Transfer</a></strong><br>
						<br>
						<p class="text-left"><strong>It is for pre-planned non-emergency medical transfer and
							Inter-facility transfer, who require skills of an Ambulance care
							assistant during the journey. It is used for patients to, from or
							between places of medical treatment, such as hospital, dialysis
							center, Medical Appointments for non-urgent/ emergency care. Main
							aim of all such transfers is to maintain the continuity of
							medical care. With us you can ensure safe and comfortable
							transfer.</strong></p>
					</div>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<image src="images/EmergencyServices.png"></image><br>
						<strong style="text-transform: uppercase; font-size: 12px;"><a
							href="" class="text-dark">Emergency Services</a></strong><br>
						<br>
						<p class="text-left"><strong>Emergency Care treats illnesses and injuries that require
							an urgent medical response, providing out-of-hospital treatment
							and transport to definitive care. We have Advance Life Our
							offerings are tailored to ensure that the patients we pick up and
							transfer receive only the best in class service by way of use of
							the most advanced equipment that can help save lives. Making
							appropriate emergency care accessible through the availability of
							Advance Life support Ambulances with trained Paramedics on board
							is our top priority.</strong></p>
					</div>
				</div>
				<br> <br> <br> <br> <br> <br> <br>
				<br>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<image src="images/AmbulanceForEvents.png"></image><br>
						<strong style="text-transform: uppercase; font-size: 12px;"><a
							href="" class="text-dark">Ambulance for
								Events</a></strong><br> <br>
						<p class="text-left"><strong>Ambulance for events ensures that any medical emergency
							will be attended to and the person afflicted will receive not
							only appropriate pre hospital care in the Ambulance, but will
							also be transferred to the nearest hospital. Over the years we
							have serviced a number of events and we can truly vouch that the
							presence of an Ambulance offers great reassurance to those
							present at the event. We urge event management companies to pay
							attention to this essential department to ensure safety of all
							present at their event, no matter how small or how big the event
							may be.</strong></p>
					</div>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<div class="shadow p-3 mb-5 bg-white rounded text-center">
						<image src="images/InterCityTransfer.png"></image><br>
						<strong style="text-transform: uppercase; font-size: 12px;"><a
							href="" class="text-dark">Inter city Transfer</a></strong>
						<p class="text-left"><strong>Main aim of all such transfers is to maintain the
							continuity of medical care. With us you can ensure safe and
							comfortable transfer.</strong></p>
					</div>
				</div>
				<br>
			</div>
		</div>
	</div>
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