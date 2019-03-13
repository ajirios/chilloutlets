<%-- 
    Document   : location
    Created on : 6-Sep-2018, 9:29:43 PM
    Author     : ajirios
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Waypoints in Directions</title>
            <script src="https://www.gstatic.com/firebasejs/5.7.0/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.1/firebase-database.js"></script>
             
<script>
  
  
  
  // Initialize Firebase
  var config = {
    
        apiKey: "AIzaSyBj875J0Q7SXR1a5Eg4e2SiycuIUexQuig",
    authDomain: "chilloutlets-carrier.firebaseapp.com",
    databaseURL: "https://chilloutlets-carrier.firebaseio.com",
    projectId: "chilloutlets-carrier",
    storageBucket: "chilloutlets-carrier.appspot.com",
    messagingSenderId: "789603527218"
  };
  
  firebase.initializeApp(config);
  
  
  
    
  
  
  
</script>

    <style>
      #right-panel {
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }

      #right-panel select, #right-panel input {
        font-size: 15px;
      }

      #right-panel select {
        width: 100%;
      }

      #right-panel i {
        font-size: 12px;
      }
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
        float: left;
        width: 70%;
        height: 100%;
      }
      #right-panel {
        margin: 20px;
        border-width: 2px;
        width: 20%;
        height: 400px;
        float: left;
        text-align: left;
        padding-top: 0;
      }
      #directions-panel {
        margin-top: 10px;
        background-color: #FFEE77;
        padding: 10px;
        overflow: scroll;
        height: 174px;
      }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <div id="right-panel">
    <div>
    <b>Start:</b>
    <select id="start">
      <option value="956 chancellor drive, winnipeg, manitoba">956 chancellor drive, winnipeg, manitoba</option>
      <option value="86 higgins avenue, winnipeg, manitoba">86 higgins avenue, winnipeg, manitoba</option>
      <option value="1740 pembina highway, winnipeg, manitoba">1740 pembina highway, winnipeg, manitoba</option>
      <option value="621 avila avenue, winnipeg, manitoba">621 avila avenue, winnipeg, manitoba</option>
      <option value="622 patricia avenue, winnipeg, manitoba">622 patricia avenue, winnipeg, manitoba</option>
      <option value="1875 pembina highway, winnipeg, manitoba">1875 pembina highway, winnipeg, manitoba</option>
      <option value="540 main street, winnipeg, manitoba">540 main street, winnipeg, manitoba</option>
    </select>
    <br>
    <b>Waypoints:</b> <br>
    <i>(Ctrl+Click or Cmd+Click for multiple selection)</i> <br>
    <select multiple id="waypoints">
      <option value="956 chancellor drive, winnipeg, manitoba">956 chancellor drive, winnipeg, manitoba</option>
      <option value="86 higgins avenue, winnipeg, manitoba">86 higgins avenue, winnipeg, manitoba</option>
      <option value="1740 pembina highway, winnipeg, manitoba">1740 pembina highway, winnipeg, manitoba</option>
      <option value="621 avila avenue, winnipeg, manitoba">621 avila avenue, winnipeg, manitoba</option>
      <option value="622 patricia avenue, winnipeg, manitoba">622 patricia avenue, winnipeg, manitoba</option>
      <option value="1875 pembina highway, winnipeg, manitoba">1875 pembina highway, winnipeg, manitoba</option>
      <option value="540 main street, winnipeg, manitoba">540 main street, winnipeg, manitoba</option>
    </select>
    <br>
    <b>End:</b>
    <select id="end">
      <option value="956 chancellor drive, winnipeg, manitoba">956 chancellor drive, winnipeg, manitoba</option>
      <option value="86 higgins avenue, winnipeg, manitoba">86 higgins avenue, winnipeg, manitoba</option>
      <option value="1740 pembina highway, winnipeg, manitoba">1740 pembina highway, winnipeg, manitoba</option>
      <option value="621 avila avenue, winnipeg, manitoba">621 avila avenue, winnipeg, manitoba</option>
      <option value="622 patricia avenue, winnipeg, manitoba">622 patricia avenue, winnipeg, manitoba</option>
      <option value="1875 pembina highway, winnipeg, manitoba">1875 pembina highway, winnipeg, manitoba</option>
      <option value="540 main street, winnipeg, manitoba">540 main street, winnipeg, manitoba</option>
    </select>
    <br>
      <input type="submit" id="submit">
    </div>
    <div id="directions-panel"></div>
    </div>
    
    <script>
      
      
        var map = null;
        var markers = [];
        //var carMarker = null;
        
        var directionsService = null;
        var directionsDisplay = null;
        
        var shopLatFloat = null;
        var shopLongFloat = null;
      
      function initMap() 
      
      {
        directionsService = new google.maps.DirectionsService;
        directionsDisplay = new google.maps.DirectionsRenderer({
            polylineOptions: {
              strokeColor: "#c00c00",
                strokeOpacity: 0.7,
                strokeWeight: 7
            }
          });
          
  
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 6,
          center: {lat: 41.85, lng: -87.65}
        });
        
        
        
            
        //directionsDisplay.setOptions({suppressMarkers: true});
        
        directionsDisplay.setMap(map);

        document.getElementById('submit').addEventListener('click', function() {
          calculateAndDisplayRoute(directionsService, directionsDisplay);
        });
        
      }
      

      function calculateAndDisplayRoute(directionsService, directionsDisplay) 
      
      {
          //waypoints array
        var waypts = [];
        
        //waypoints select html element
        var checkboxArray = document.getElementById('waypoints');
        
        for (var i = 0; i < checkboxArray.length; i++) 
        
        {
          if (checkboxArray.options[i].selected) 
          
          {
              //push the selected option addresses to waypoints
            waypts.push({
              location: checkboxArray[i].value,
              stopover: true
            });
            
          }
          
        }
        
        
        
            var houseMarker = new google.maps.Marker({
               position:  new google.maps.LatLng(49.813230, -97.156350), //document.getElementById('end').value,
               map: map,
               draggable:true,
               icon:'images/placeholder (3).png'
            });
            
            houseMarker.setMap(map);
        
            var carMarker = new google.maps.Marker({
               position: new google.maps.LatLng(shopLatFloat, shopLongFloat),
               map: map,
               draggable:true,
               icon:'images/car64.png'
            });
            
            
            for (var v = 0; v < markers.length; v++)
                
            {
                markers[v].setMap(null);
            }
            
            markers = [];
            
            //carMarker.setMap(map);
            markers.push(carMarker);
            
            for (var v = 0; v < markers.length; v++)
                
            {
                markers[v].setMap(map);
            }
        

        directionsService.route({
            
          origin: new google.maps.LatLng(shopLatFloat, shopLongFloat),  //document.getElementById('start').value,
          destination: document.getElementById('end').value,
          waypoints: waypts,
          optimizeWaypoints: true,
          travelMode: 'DRIVING'
          
        }, function(response, status) 
        
        {
          if (status === 'OK') 
          
          {
            directionsDisplay.setDirections(response);
            var route = response.routes[0];
            var summaryPanel = document.getElementById('directions-panel');
            summaryPanel.innerHTML = '';
            // For each route, display summary information.
            for (var i = 0; i < route.legs.length; i++) {
              var routeSegment = i + 1;
              summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment +
                  '</b><br>';
              summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
              summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
              summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
            }
            
          } 
          
        else 
        
          {
            //window.alert('Directions request failed due to ' + status);
          }
          
        }); //directionsService made
        
      }
      
      
            
            var latitudeRef = firebase.database().ref().child('carriers/8137721630172/latitude');
                latitudeRef.on('value', function(snapshot) {
                    shopLatFloat = parseFloat(snapshot.val());
                    //setMapOnAll(null);
                    calculateAndDisplayRoute(directionsService, directionsDisplay);
                    //alert(snapshot.val());
                });
      
            
            var longitudeRef = firebase.database().ref().child('carriers/8137721630172/longitude');
                longitudeRef.on('value', function(snapshot) {
                    shopLongFloat = parseFloat(snapshot.val());
                    //setMapOnAll(null);
                    calculateAndDisplayRoute(directionsService, directionsDisplay);
                    //alert(snapshot.val());
                });
                
      
      
      
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDgh6-uYI5m95sBlU4oC5UB0pzh2o0FTsI&callback=initMap">
    </script>
  </body>
</html>