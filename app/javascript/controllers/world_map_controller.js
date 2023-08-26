import { Controller } from "@hotwired/stimulus"

import { autofill } from '@mapbox/search-js-web';

autofill({
    accessToken: 'pk.eyJ1IjoidGdhZmZlciIsImEiOiJjbGlrNTVibWEwOHRkM2NwOWF6Y3VvMHFrIn0.UxOvJ3__02GQNNAEkRhF7w'
})


// Connects to data-controller="world-map"
export default class extends Controller {
  static values = {countries: Array}
  connect() {
    console.log("World Map controller connected");
    const countriesList = this.countriesValue;
    mapboxgl.accessToken = 'pk.eyJ1IjoidGdhZmZlciIsImEiOiJjbGlrNTVibWEwOHRkM2NwOWF6Y3VvMHFrIn0.UxOvJ3__02GQNNAEkRhF7w';
    console.log(this.apiKeyValue);
    const map = new mapboxgl.Map({
    container: 'map', // container ID
    // Choose from Mapbox's core styles, or make your own style with Mapbox Studio
    style: 'mapbox://styles/tgaffer/clkxru5dy003m01rg38rb8j6p/draft', // style URL
    center: [0, 0], // starting position [lng, lat]
    zoom: 2,
    projection: {
      name: 'mercator',
      center: [0, 0],
    }
      });

    const search = new MapboxSearchBox();
    search.accessToken = 'pk.eyJ1IjoidGdhZmZlciIsImEiOiJjbGlrNTVibWEwOHRkM2NwOWF6Y3VvMHFrIn0.UxOvJ3__02GQNNAEkRhF7w';
    search.options = {types: "country"}
    search.placeholder = "Search for a country"
    map.addControl(search, 'top-left');


    map.on('load', function () {
      map.addSource('cbs', {  // country-boundaries-simplified
          'type': 'geojson',
          'data': 'https://d2ad6b4ur7yvpq.cloudfront.net/naturalearth-3.3.0/ne_50m_admin_0_countries.geojson'
      });


      map.addLayer({
          "id": "cf",  // country-fills
          "type": "fill",
          "source": "cbs",
          "layout": {},
          "paint": {
              "fill-color": "#1B6AD4",
              "fill-opacity": 0
          }
      });

      map.addLayer({
          "id": "cfh",  // country-fills-hover",
          "type": "fill",
          "source": "cbs",
          "layout": {},
          "paint": {
              "fill-color": "#FFFFFF",
              "fill-opacity": 0.2
          },
          "filter": ["==", "name", ""]
      });

      // When the user moves their mouse over the page, we look for features
      // at the mouse position (e.point) and within the states layer (states-fill).
      // If a feature is found, then we'll update the filter in the state-fills-hover
      // layer to only show that state, thus making a hover effect.
      map.on("mousemove", function(e) {
          var features = map.queryRenderedFeatures(e.point, { layers: ["cf"] });

          if (features.length) {
              map.getCanvas().style.cursor = 'pointer';
              map.setFilter("cfh", ["==", "name", features[0].properties.name]);
              } else {
              map.setFilter("cfh", ["==", "name", ""]);
              map.getCanvas().style.cursor = '';
          }
      });

      // Reset the state-fills-hover layer's filter when the mouse leaves the map
      map.on("mouseout", function() {
          map.getCanvas().style.cursor = 'auto';
          map.setFilter("cfh", ["==", "name", ""]);
      });

      map.on("click", function(e) {
          var features = map.queryRenderedFeatures(e.point, { layers: ["cf"] });
          if (features.length) {
            console.log(features[0].properties.name);
            const country = countriesList.find((country) => country.name === features[0].properties.name);
            // console.log(country.popup_html);
            // window.location.href=`/countries/${country.id}`
            // const popup = new mapboxgl.Popup().setHTML(country.popup_html);
            const popup = new mapboxgl.Popup({className: "bg-dark popup"})
              .setLngLat(e.lngLat)
              .setHTML(country.popup_html)
              .addTo(map);
          }
      });

  });
  }
}
