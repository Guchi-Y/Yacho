let map
let geocoder
let mcs = [];

function initMap(){
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: 37.6804, lng: 139.769017},
  zoom: 5
  });

  gon.points.forEach(function(point) {
     marker = new google.maps.Marker({
      position: new google.maps.LatLng( point.latitude, point.longitube ),
      map: map,
      icon: image_path("bird_icon.png")
    });
    mcs.push(marker);
  });

  var mcOptions = {
    gridSize: 50,
    maxZoom: 15,
    imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'
  };
  new MarkerClusterer( map, mcs, mcOptions );

 google.maps.event.addListener(map, 'click', mylistener);
 function mylistener(e){
  var marker = new google.maps.Marker();
  marker.setPosition(new google.maps.LatLng(e.latLng.lat(), e.latLng.lng()));
  marker.setMap(map);
  document.getElementById('lat').value = e.latLng.lat();
  document.getElementById('lng').value = e.latLng.lng();
 }
}

function codeAddress(){
  let inputAddress = document.getElementById('address').value;

  geocoder.geocode( { 'address': inputAddress}, function(results, status) {
    if (status == 'OK') {
      map.setCenter(results[0].geometry.location);
      map.setZoom(16);
    } else {
      alert('エラー: ' + status);
    }
  });
}

