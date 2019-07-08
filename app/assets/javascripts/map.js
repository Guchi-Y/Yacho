/*
mapを関数の外で定義(codeAddressでも使うため)
geocoderを用意
*/

let map
let geocoder

function initMap(){
  // geocoderを初期化
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: 35.6804, lng: 139.769017},
  zoom: 14
  });

  // マップにマーカーを表示
  gon.points.forEach(function(point) {
     marker = new google.maps.Marker({
      position: new google.maps.LatLng( point.latitude, point.longitube ),
      map: map
    });
  });

 //mapをクリックしたときのイベントを設定
 google.maps.event.addListener(map, 'click', mylistener);
 //クリックしたときの処理
 function mylistener(e){
  //marker作成
  var marker = new google.maps.Marker();
  //markerの位置を設定
  //event.latLng.lat()でクリックしたところの緯度を取得
  marker.setPosition(new google.maps.LatLng(e.latLng.lat(), e.latLng.lng()));
  //marker設置
  marker.setMap(map);
  document.getElementById('lat').value = e.latLng.lat();
  document.getElementById('lng').value = e.latLng.lng();
 }
}

function codeAddress(){
  // 入力を取得
  let inputAddress = document.getElementById('address').value;

  // geocodingしたあとmapを移動
  geocoder.geocode( { 'address': inputAddress}, function(results, status) {
    if (status == 'OK') {
  // map.setCenterで地図が移動
      map.setCenter(results[0].geometry.location);

    } else {
      alert('次の理由により、ジオコードが成功しませんでした: ' + status);
    }
  });
}

