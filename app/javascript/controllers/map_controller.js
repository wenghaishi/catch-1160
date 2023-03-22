import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/ernest-heh/clf9px8j1001w01s0rbrg9br0",
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
      fitBoundsOptions: { maxZoom: 24 },
      showAccuracyCircle: false
    })

    this.map.addControl(geoLocate, 'top-right');

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