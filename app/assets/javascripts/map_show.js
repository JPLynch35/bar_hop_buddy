$(".map.show").ready(function() {
  var locations = JSON.parse('<%= @presenter.locations.to_json %>'.replace(/&quot;/g, '"'));
  mapboxgl.accessToken = "pk.eyJ1IjoianBseW5jaDM1IiwiYSI6ImNqbHIyczB1NjAwbDczcXMzN3Vra2RsNGwifQ.-BxRMCzfhhmbT8lA-qYqcQ";
  const map = new mapboxgl.Map({
    container: "map",
    style: "mapbox://styles/jplynch35/cjlvaecye2c492svupumelv7u",
    center: [locations[0], locations[1]],
    zoom: 14.0
  });
  map.on('load', function () {
    map.addSource("user location", {
      "type": "geojson",
      "data": {
        "type": "FeatureCollection",
        "features": [{
          "type": "Feature",
          "geometry": {
            "type": "Point",
            "coordinates": [locations[0], locations[1]]
          },
          "properties": {
            "title": "Your Location",
            "marker-symbol": "marker",
          }
        }]
      }
    });
    map.addLayer({
      "id": "user",
      "type": "symbol",
      "source": "user location",
      "layout": {
        "icon-image": "circle-15",
        "icon-size": 1,
        "icon-allow-overlap": true
      }
    });
    locations.shift();
    locations.shift();
    map.addSource("bar locations", {
      "type": "geojson",
      "data": {
        "type": "FeatureCollection",
        "features": locations
      }
    });
    map.addLayer({
      "id": "bar",
      "type": "symbol",
      "source": "bar locations",
      "layout": {
        "icon-image": "bar-11",
        "icon-size": 2,
        "icon-allow-overlap": true
      }
    });

    map.on('click', 'bar', function (e) {
      var coordinates = e.features[0].geometry.coordinates.slice();
      var name = e.features[0].properties.name;
      var address = e.features[0].properties.address;
      var hh_hours = e.features[0].properties.hh_hours;
      var deal1 = e.features[0].properties.deal1;
      var deal2 = e.features[0].properties.deal2;
      var deal3 = e.features[0].properties.deal3;
      var deal3 = e.features[0].properties.deal3;
      var deal4 = e.features[0].properties.deal4;
      var deal5 = e.features[0].properties.deal5;
      while (Math.abs(e.lngLat.lng - coordinates[0]) > 180) {
        coordinates[0] += e.lngLat.lng > coordinates[0] ? 360 : -360;
      }
      var pop_up = name + '<br />' + address + '<br />' + 'Happy Hour: ' + hh_hours + '<br />' + deal1 + '<br />' + deal2 + '<br />' + deal3 + '<br />' + deal4 + '<br />' + deal5;
      new mapboxgl.Popup()
        .setLngLat(coordinates)
        .setHTML(pop_up)
        .addTo(map);
    });
    map.on('mouseenter', 'bar', function () {
        map.getCanvas().style.cursor = 'pointer';
    });
    map.on('mouseleave', 'bar', function () {
        map.getCanvas().style.cursor = '';
    });
  });
})
