$(document).on("ready", function () {

  L.mapbox.accessToken = 'pk.eyJ1IjoiYXNhbnRvczMwMjYiLCJhIjoiZWZlMmMyM2JiN2ZiNzcxZmJkOGJhMWNhZWE4ODc1MjMifQ.Moj73Bv5_uyylRIcZkXcYg';
  var map = L.mapbox.map('map', 'mapbox.streets')
                .setView([40, -74.50], 9);
                
    var myLayer = L.mapbox.featureLayer().addTo(map);
    });