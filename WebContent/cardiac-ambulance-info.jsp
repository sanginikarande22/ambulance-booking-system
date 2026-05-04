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
					<h2>Cardiac Ambulance</h2>
					<div>
						<ul>
							<li>Advanced Life support (ALS) ambulances, also known as Cardiac Ambulances, are designed specifically to provide assistance to patients suffering from cardiac diseases, which are among the deadliest killers known to man today.</li>
							<li>These diseases affect the patient’s circulatory system, blood vessels, heart muscle, valves, or rhythm. Often, the blood vessels of such patients become narrow or blocked, leading to chest pain, heart attacks, or strokes, eventually resulting in death. In fact, cardiac diseases are today the leading cause of deaths in India, owing to factors like lack of access to quality healthcare, and the timely availability of appropriate cardiac ambulance services.</li>
							<li>Over the last two decades, the rate of deaths from heart diseases in India has increased by almost 34 percent, rising from 155.7 to 209.1 deaths per one lakh population.</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="alert alert-default">
					<image src="images/cardiac-ambulance.jpg"
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