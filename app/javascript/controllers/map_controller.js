import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  static targets = [ "counter", "popup", "button" ]

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

    // Set Map Bearing with device's Compass
    // geoLocate.on('geolocate', (e) => {
    //   window.addEventListener('deviceorientation', (event) => {
    //     this.map.setBearing(event.webkitCompassHeading || event.alpha);
    //   })4
    // })

    this.map.on("load", () => {

      geoLocate.trigger()
      geoLocate.on('geolocate', (e) => {
        this.map.setBearing(e.coords.heading);
        this.currentLocation = [e.coords.longitude, e.coords.latitude]
        this.map.easeTo({
          center: this.currentLocation,
          zoom: 19,
          essential: true
        });
      });

      // Disable all Map Interaction Controls
      // this.map.boxZoom.disable()
      // this.map.doubleClickZoom.disable()
      // this.map.dragPan.disable()
      // this.map.dragRotate.disable()
      // this.map.keyboard.disable()
      // this.map.scrollZoom.disable()
      // this.map.touchZoomRotate.disable()

      this.#addMarkersToMap()
    })
  }

  close(e) {
    e.preventDefault();
    this.popupTarget.classList.add("hide");
  }

  #addMarkersToMap() {

    this.markersValue.forEach((marker) => {
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)

      customMarker.addEventListener("click", () => {
        const markerLocation = [marker.lng, marker.lat]
        let length = turf.distance(turf.point(this.currentLocation), turf.point(markerLocation));
        let distanceKm = Math.round(length * 10) / 10

        this.popupTarget.classList.remove("hide")
        this.popupTarget.innerHTML = marker.info_window_html
        this.counterTarget.innerHTML = distanceKm.toString()
        // Finally, check if the distance is less than or equal to 50 meters
        if (length <= 0.2) {
          // The marker is within 200 meters of your current location
          // CATCHABLE!!!!
          this.buttonTarget.innerHTML = "Catch Token"
          this.buttonTarget.classList.remove("btn-cannot")
          this.buttonTarget.classList.add("btn-catch")
          this.buttonTarget.removeAttribute('disabled')
        } else {
          // The marker is further than 50 meters from your current location
          // NOT CATCHABLE
          this.buttonTarget.innerHTML = "Move Closer to Catch"
          this.buttonTarget.classList.remove("btn-catch")
          this.buttonTarget.classList.add("btn-cannot")
          this.buttonTarget.setAttribute('disabled')
        }

      })
    })
  }
}
