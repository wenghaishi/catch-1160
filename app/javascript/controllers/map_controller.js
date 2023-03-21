import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    navigator.geolocation.getCurrentPosition(success, error, options);

    this.map = new mapboxgl.Map({
<<<<<<< HEAD
      container: "map", // container id
      style: "mapbox://styles/mapbox/streets-v11",
      center: [e.coords.longitude, e.coords.latitude], // starting position
      zoom: 3 // starting zoom
  });
  
  const watchID = navigator.geolocation.watchPosition((position) => {
    doSomething(position.coords.latitude, position.coords.longitude);
  })
}}
=======
      container: this.element,
      style: "mapbox://styles/mapbox/light-v11",
      pitch: 60
    })

    const geoLocate = new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      // When active the map will receive updates to the device's location as it changes.
      trackUserLocation: true,
      // Draw an arrow next to the location dot to indicate which direction the device is heading.
      showUserHeading: true,
    })

    this.map.addControl(geoLocate);

    this.map.on("load", () => {

      geoLocate.trigger()
      geoLocate.on('geolocate', (e) => {
        this.map.easeTo({
          center:[e.coords.longitude, e.coords.latitude],
          zoom: 19,
          essential: true
        });
      });

      this.map.scrollZoom.disable()
    })
  }
}
>>>>>>> aa572f2f9f026b0aace7085475a7a0dbcbb24faf
