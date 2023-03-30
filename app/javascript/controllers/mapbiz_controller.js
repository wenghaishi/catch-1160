import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

// Connects to data-controller="mapbiz"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  static targets = [ "counter", "popup" ]

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/ernest-heh/clf9px8j1001w01s0rbrg9br0",
      pitch: 0,
      minPitch: 0,
      maxPitch: 0
    })

    const geoLocate = new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      // When active the map will receive updates to the device's location as it changes.
      // trackUserLocation: true,
      // Draw an arrow next to the location dot to indicate which direction the device is heading.
      showUserHeading: true,
      // fitBoundsOptions: { maxZoom: 24 },
      showAccuracyCircle: false,
    })

    const nav = new mapboxgl.NavigationControl({
      showCompass: true,
      showZoom: false
    })

    this.map.addControl(geoLocate, 'top-right')
    this.map.addControl(nav, 'top-right')

    this.map.on("load", () => {

      geoLocate.trigger()
      geoLocate.on('geolocate', (e) => {
        this.currentLocation = [e.coords.longitude, e.coords.latitude]
        this.#addMarkersToMap()
        this.#fitMapToMarkers()
      });
    })
    this.#fitMapToMarkers()
  }

  close(e) {
    e.preventDefault()
    this.popupTarget.classList.add("hide")
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 120, maxZoom: 15, duration: 0 })
  }

  #addMarkersToMap() {

    this.markersValue.forEach((marker) => {
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.markerbiz_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)

      customMarker.addEventListener("click", () => {
        const markerLocation = [marker.lng, marker.lat]
        let length = turf.distance(turf.point(this.currentLocation), turf.point(markerLocation))
        let distanceKm = Math.round(length * 10) / 10

        this.popupTarget.classList.remove("hide")
        this.popupTarget.innerHTML = marker.info_window_html
        this.counterTarget.innerHTML = distanceKm.toString()
      })
    })
  }
}
