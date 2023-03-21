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
      container: "map", // container id
      style: "mapbox://styles/mapbox/streets-v11",
      center: [e.coords.longitude, e.coords.latitude], // starting position
      zoom: 3 // starting zoom
  });
  
  const watchID = navigator.geolocation.watchPosition((position) => {
    doSomething(position.coords.latitude, position.coords.longitude);
  })
}}