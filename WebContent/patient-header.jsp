<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<header class="header header_style_01">
	<nav class="megamenu navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a class="active" href="patient-dashboard.jsp"><strong>Home</strong></a></li>
					<li><a class="btn-primary btn-radius btn-brd log"
						href="search-ambulance.jsp"><strong>Search Ambulance</strong></a></li>
					<li><a class="btn-primary btn-radius btn-brd log"
						href="patient-view-ambulances.jsp"><strong>View Ambulances</strong></a></li>
					<li><a class="btn-primary btn-radius btn-brd log"
						href="patient-view-ambulance-status.jsp"><strong>Booking Ambulance
							Status</strong></a></li>
					<li><a class="btn-primary btn-radius btn-brd log"
						href="patient-feedback-complaints.jsp"><strong>Feedback/Complaints</strong></a></li>
					<li><a class="btn-primary btn-radius btn-brd log"
						href="patient-view-ambulance-booking-payment.jsp"><strong>My Payments</strong></a></li>
					
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"><span class="caret"></span><strong> My Account</strong></a>
						<ul class="dropdown-menu">
							<li><a href="patient-profile.jsp"><strong>My Profile</strong></a></li>
							<li><a href="patient-change-password.jsp"><strong>Change Password</strong></a></li>
							<li><a href="logout.jsp"><strong>Logout</strong></a></li>
						</ul>
					</li>
			</div>
		</div>
	</nav>
</header>