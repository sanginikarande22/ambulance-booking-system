var publicMap = null;
var publicMarker = null;
var pollingInterval = null;

function fetchPublicLocation() {

    if (!publicAVN) return;

    fetch("GetDriverLocation?avn=" + encodeURIComponent(publicAVN))
        .then(response => response.json())
        .then(data => {

            if (data && data.lat !== undefined && data.lng !== undefined && data.updated_at) {

                if (!publicMap) {

                    publicMap = L.map('publicMap')
                        .setView([data.lat, data.lng], 15);

                    L.tileLayer(
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        { attribution: '© OpenStreetMap contributors' }
                    ).addTo(publicMap);

                    var ambulanceIcon = L.icon({
                        iconUrl: 'images/ambulance.png',
                        iconSize: [40, 40],
                        iconAnchor: [20, 40],
                        popupAnchor: [0, -40]
                    });

                    publicMarker = L.marker(
                        [data.lat, data.lng],
                        { icon: ambulanceIcon }
                    ).addTo(publicMap);

                } else {

                    publicMarker.setLatLng([data.lat, data.lng]);
                    publicMap.setView([data.lat, data.lng]);
                }
            }
        })
        .catch(error => {
            console.error("Public tracking error:", error);
        });
}

// Prevent multiple intervals
if (!window.publicPollingStarted) {
    fetchPublicLocation();
    setInterval(fetchPublicLocation, 5000);
    window.publicPollingStarted = true;
}