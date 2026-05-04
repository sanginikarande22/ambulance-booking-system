var patientMap = null;
var patientMarker = null;
var pollingInterval = null;

function startTracking(avn) {

    if (!avn) {
        console.log("AVN missing");
        return;
    }

    document.getElementById("trackingSection").style.display = "block";

    // Prevent multiple intervals
    if (pollingInterval) {
        clearInterval(pollingInterval);
    }

    fetchDriverLocation(avn);

    pollingInterval = setInterval(function () {
        fetchDriverLocation(avn);
    }, 5000);
}

function fetchDriverLocation(avn) {

    fetch("GetDriverLocation?avn=" + encodeURIComponent(avn))
        .then(response => response.json())
        .then(data => {
			console.log("Server data:", data);
			
            var statusElement = document.getElementById("driverStatus");

            if (data && data.lat !== undefined && data.lng !== undefined) {

                // Fix MySQL timestamp parsing
				if (statusElement) {

				    if (!data || !data.login_status) {
				        statusElement.innerHTML =
				            "<span style='color:red;'>No driver data available</span>";
				        return;
				    }

				    if (data.login_status === "OFFLINE") {
				        statusElement.innerHTML =
				            "<span style='color:red;'>Driver is Logged Out</span>";
				        return;
				    }

				    var now = Date.now();
				    var lastSeen = new Date(
				        data.last_seen.replace(" ", "T")
				    ).getTime();

				    var diff = (now - lastSeen) / 1000;

				    if (diff > 20) {
				        statusElement.innerHTML =
				            "<span style='color:orange;'>Driver Connection Lost</span>";
				    } else {
				        statusElement.innerHTML =
				            "<span style='color:green;'>Driver is Live</span>";
				    }
				}

                if (!patientMap) {

                    patientMap = L.map('patientMap')
                        .setView([data.lat, data.lng], 15);

                    L.tileLayer(
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        { attribution: '© OpenStreetMap contributors' }
                    ).addTo(patientMap);

                    var ambulanceIcon = L.icon({
                        iconUrl: 'images/ambulance.png',
                        iconSize: [40, 40],
                        iconAnchor: [20, 40],
                        popupAnchor: [0, -40]
                    });

                    patientMarker = L.marker(
                        [data.lat, data.lng],
                        { icon: ambulanceIcon }
                    ).addTo(patientMap);

                } else {

                    patientMarker.setLatLng([data.lat, data.lng]);
                    patientMap.setView([data.lat, data.lng]);
                }

            } else {
                if (statusElement) {
                    statusElement.innerHTML =
                        "<span style='color:red;'>No driver data available</span>";
                }
            }

        })
        .catch(error => {
            console.error("Tracking error:", error);
        });
}