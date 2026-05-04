<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<header class="header header_style_01">
	<nav class="megamenu navbar navbar-default ">
		<div class="container">
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
					<li><a class="active" href="driver-dashboard.jsp"><strong>Home</strong></a></li>
					<li><a class="btn-primary btn-radius btn-brd log" href="patient-request-driver-for-ambulance.jsp"><strong>Patients Request For Ambulance</strong></a></li>
					<li><a class="btn-primary btn-radius btn-brd log" href="add-ambulance-driver.jsp"><strong>Add Ambulance</strong></a></li>
					<li><a class="btn-primary btn-radius btn-brd log" href="driver-view-ambulance.jsp"><strong>View Ambulance</strong></a></li>
					<li><a class="btn-primary btn-radius btn-brd log" href="driver-ambulance-status.jsp"><strong>Ambulance Status</strong></a></li>
					<li><a class="btn-primary btn-radius btn-brd log" href="driver-view-patients-payments.jsp"><strong>Patients Payment</strong></a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"><span class="caret"></span><strong> My Account</strong></a>
						<ul class="dropdown-menu">
							<li><a href="driver-profile.jsp"><strong>My Profile</strong></a></li>
							<li><a href="driver-change-password.jsp"><strong>Change Password</strong></a></li>
							<li><a href="logout.jsp"><strong>Logout</strong></a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</header>
<script>
    var contextPath = "<%= request.getContextPath() %>";
</script>
<%
if (session.getAttribute("did") != null) {
%>

<script>
(function() {
    function startHeartbeat() {
        setInterval(function() {
        		fetch(contextPath + "/DriverHeartbeat").catch(function(err) {
                    console.error("Heartbeat error:", err);
                });
        }, 10000);
    }

    window.addEventListener("load", startHeartbeat);
})();


//


(function(){

    let geoWatcher = null;

    function startGPS(){
        if (geoWatcher !== null) return;

        geoWatcher = navigator.geolocation.watchPosition(function(pos){

            fetch(contextPath + "/UpdateDriverLocation?lat="
                + pos.coords.latitude + "&lng="
                + pos.coords.longitude);

        }, function(err){
            console.error("GPS error:", err);
        });
    }

    function stopGPS(){
        if (geoWatcher !== null){
            navigator.geolocation.clearWatch(geoWatcher);
            geoWatcher = null;
        }
    }

    function checkTripStatus(){
        fetch(contextPath + "/CheckActiveTrip").then(res => res.json())
            .then(data => {

                if (data.active){
                    startGPS();
                } else {
                    stopGPS();
                }

            })
            .catch(err => console.error("Trip check error:", err));
    }

    setInterval(checkTripStatus, 5000);
    checkTripStatus(); 

})();
</script>

<%
}
%>