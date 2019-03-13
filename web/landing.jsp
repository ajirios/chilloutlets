<%-- 
    Document   : landing
    Created on : 24-Oct-2018, 3:53:44 AM
    Author     : ajirios
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Directions Service</title>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
    </style>
  </head>
  <body>
    <div id="floating-panel">
    <b>Start: </b>
    <select id="start">
      <option value="956 chancellor drive, winnipeg, manitoba">956 chancellor drive, winnipeg, manitoba</option>
      <option value="86 higgins avenue, winnipeg, manitoba">86 higgins avenue, winnipeg, manitoba</option>
      <option value="1740 pembina highway, winnipeg, manitoba">1740 pembina highway, winnipeg, manitoba</option>
      <option value="621 avila avenue, winnipeg, manitoba">621 avila avenue, winnipeg, manitoba</option>
      <option value="amarillo, tx">Amarillo</option>
      <option value="gallup, nm">Gallup, NM</option>
      <option value="flagstaff, az">Flagstaff, AZ</option>
      <option value="winona, az">Winona</option>
      <option value="kingman, az">Kingman</option>
      <option value="barstow, ca">Barstow</option>
      <option value="san bernardino, ca">San Bernardino</option>
      <option value="los angeles, ca">Los Angeles</option>
    </select>
    <b>End: </b>
    <select id="end">
      <option value="956 chancellor drive, winnipeg, manitoba">956 chancellor drive, winnipeg, manitoba</option>
      <option value="86 higgins avenue, winnipeg, manitoba">86 higgins avenue, winnipeg, manitoba</option>
      <option value="1740 pembina highway, winnipeg, manitoba">1740 pembina highway, winnipeg, manitoba</option>
      <option value="621 avila avenue, winnipeg, manitoba">621 avila avenue, winnipeg, manitoba</option>
      <option value="amarillo, tx">Amarillo</option>
      <option value="gallup, nm">Gallup, NM</option>
      <option value="flagstaff, az">Flagstaff, AZ</option>
      <option value="winona, az">Winona</option>
      <option value="kingman, az">Kingman</option>
      <option value="barstow, ca">Barstow</option>
      <option value="san bernardino, ca">San Bernardino</option>
      <option value="los angeles, ca">Los Angeles</option>
    </select>
    </div>
    <div id="map"></div>
    <script>
      function initMap() {
        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer({
            polylineOptions: {
              strokeColor: "#c00c00",
                strokeOpacity: 0.7,
                strokeWeight: 7
            }
          });
  
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 7,
          center: {lat: 41.85, lng: -87.65}
        });
        directionsDisplay.setMap(map);

        var onChangeHandler = function() {
          calculateAndDisplayRoute(directionsService, directionsDisplay);
        };
        document.getElementById('start').addEventListener('change', onChangeHandler);
        document.getElementById('end').addEventListener('change', onChangeHandler);
      }

      function calculateAndDisplayRoute(directionsService, directionsDisplay) {
        directionsService.route({
          origin: document.getElementById('start').value,
          destination: document.getElementById('end').value,
          travelMode: 'DRIVING'
        }, function(response, status) {
          if (status === 'OK') {
            directionsDisplay.setDirections(response);
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
      }
      
    function calcRoute() 
    
    {
      var selectedMode = document.getElementById('mode').value;
      var request = {
          origin: haight,
          destination: oceanBeach,
          // Note that Javascript allows us to access the constant
          // using square brackets and a string value as its
          // "property."
          travelMode: google.maps.TravelMode[selectedMode]
      };
      directionsService.route(request, function(response, status) {
        if (status == 'OK') {
          directionsDisplay.setDirections(response);
        }
      });
    }
      
      
      
      
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDgh6-uYI5m95sBlU4oC5UB0pzh2o0FTsI&callback=initMap">
    </script>
  </body>
</html>