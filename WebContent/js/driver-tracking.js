var map;
var marker;
var geoWatcher = null;

function initMap(lat, lng) {
    map = L.map('map').setView([lat, lng], 15);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '© OpenStreetMap contributors'
    }).addTo(map);

    var customIcon = L.icon({
        iconUrl: contextPath + '/images/ambulance.png',
        iconSize: [32, 32],
        iconAnchor: [16, 32],
        popupAnchor: [0, -32]
    });

    marker = L.marker([lat, lng], { icon: customIcon }).addTo(map);
}

function startTracking() {

    if (!navigator.geolocation) {
        alert("Geolocation not supported");
        return;
    }

    if (geoWatcher !== null) return; 

    geoWatcher = navigator.geolocation.watchPosition(function(position) {

        var lat = position.coords.latitude;
        var lng = position.coords.longitude;

        if (!map) {
            initMap(lat, lng);
        } else {
            marker.setLatLng([lat, lng]);
            map.setView([lat, lng], 15);
        }

        fetch(contextPath + "/UpdateDriverLocation?lat=" + lat + "&lng=" + lng)
            .catch(error => console.error("Error sending location:", error));

    }, function(error) {
        console.error("Geolocation error:", error);
    });
}

window.onload = function() {

    if (
        typeof bookingStatus !== "undefined" &&
        (bookingStatus === "On the way" || bookingStatus === "Pickup")
    ) {
        console.log("Tracking started");
        startTracking();
    }

};