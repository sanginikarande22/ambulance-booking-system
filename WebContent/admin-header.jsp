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
					<li><a class="active" href="admin-dashboard.jsp"><strong>Home</strong></a></li>
					<li><a class="btn-primary btn-radius btn-brd log" href="admin-view-drivers.jsp"><strong>View Drivers</strong></a></li>
					<li><a class="btn-primary btn-radius btn-brd log" href="admin-view-ambulance.jsp"><strong>View Ambulances</strong></a></li>
					<li><a class="btn-primary btn-radius btn-brd log" href="admin-view-patients-complaint-feedback.jsp"><strong>Patient Complaints/Feedback</strong></a></li>
					<li><a class="btn-primary btn-radius btn-brd log" href="admin-view-patient.jsp"><strong>View Patients</strong></a></li>
					<li><a class="btn-primary btn-radius btn-brd log" href="admin-generate-report.jsp"><strong>Generate Reports</strong></a></li>
					<li><a class="btn-primary btn-radius btn-brd log" href="view-contacts-inquiry.jsp"><strong>View Contacts/Inquiry</strong></a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"><span class="caret"></span><strong> My Account</strong></a>
						<ul class="dropdown-menu">
							<li><a href="admin-profile.jsp"><strong>My Profile</strong></a></li>
							<li><a href="admin-change-password.jsp"><strong>Change Password</strong></a></li>
							<li><a href="logout.jsp"><strong>Logout</strong></a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</header>