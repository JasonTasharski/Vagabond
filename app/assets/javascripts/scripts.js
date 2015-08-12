$(document).on("ready", function () {

  L.mapbox.accessToken = 'pk.eyJ1IjoiYXNhbnRvczMwMjYiLCJhIjoiZWZlMmMyM2JiN2ZiNzcxZmJkOGJhMWNhZWE4ODc1MjMifQ.Moj73Bv5_uyylRIcZkXcYg';
  var map = L.mapbox.map('map', 'mapbox.high-contrast', {zoomControl: false}).setView([30.449, -88.242], 2);
      
      // Disable drag and zoom handlers.
      map.dragging.disable();
      map.touchZoom.disable();
      map.doubleClickZoom.disable();
      map.scrollWheelZoom.disable();

// Disable tap handler, if present.
if (map.tap) map.tap.disable();

    var myLayer = L.mapbox.featureLayer().addTo(map);

    var geocoder = L.mapbox.geocoder('mapbox.places');
  // //adds marker to the page based on geocoder lng and lat
  // var showMarker = function(address, lng, lat) {
  //   L.mapbox.featureLayer({
  //     type: 'Feature',
  //     geometry: {
  //       type: 'Point',
  //       coordinates: [
  //       lng,
  //       lat
  //       ]
  //     },
  //     properties: {
  //       description: address,
  //       'marker-size': 'small',
  //       'marker-color': '#19B919',
  //         // 'marker-symbol': 'flag'
  //       }
  //     }).addTo(map);
  // };
    });