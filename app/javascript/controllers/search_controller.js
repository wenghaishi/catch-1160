import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["input", "results"]

  connect() {
    console.log("search controller connected")

  }

  async search() {
    const query = this.inputTarget.value
    const url = `/businesses?query=${query}&commit=Search`
    fetch(url, {
      method: "GET",
      headers: {
        "Accept": "text/plain"
      }
    })
    .then(res => res.text())
    .then(data => {
      this.resultsTarget.outerHTML = data
    })
  }
}
