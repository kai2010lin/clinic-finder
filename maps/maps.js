var map;
var directionService;
var geocoder;

function initialize() {
    addEventListeners();

    var mapOptions = {
        center: new google.maps.LatLng(-34.397, 150.644),
        zoom: 8
    };
    map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
    directionsService = new google.maps.DirectionsService();
    geocoder = new google.maps.Geocoder();
    var marker = codeAddress("1183 Sherwood Ave, San Jose, CA");
    if (marker != null)
        marker.setMap(map);
}

function addEventListeners() {
    $("input[type=button]").click(function() {
        // var start = new google.maps.LatLng(28.694004, 77.110291);
        // var end = new google.maps.LatLng(28.72082, 77.107241);
        var start = $("#start").val();
        var end = $("#end").val();
        displayRoute(map, directionsService, start, end, google.maps.TravelMode.WALKING);
    });
}

function detectBrowser() {
    var useragent = navigator.userAgent;
    var mapdiv = document.getElementById("map-canvas");

    if (useragent.indexOf('iPhone') != -1 || useragent.indexOf('Android') != -1 ) {
        mapdiv.style.width = '100%';
        mapdiv.style.height = '100%';
    } else {
        mapdiv.style.width = '600px';
        mapdiv.style.height = '800px';
    }
}

function displayRoute(map, directionsService, start, end, mode) {
    // Also, constructor can get "DirectionsRendererOptions" object
    var directionsDisplay = new google.maps.DirectionsRenderer();
    directionsDisplay.setMap(map);          // map should be already initialized.

    var request = {
        origin: start,
        destination: end,
        travelMode: mode
    };

    directionsService.route(request, function(response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
        }
    });
}

function codeAddress(address) {
    geocoder.geocode({ 'address': address }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            return new google.maps.Marker({
                map: map,
                position: results[0].geometry.location,
                animation: google.maps.Animation.DROP,
                title: address
            });
        } else {
            alert("Geocode was not successful for the following reason: " + status);
            return null;
        }
    });
}

// google.maps.event.addDomListener(window, 'load', initialize);
