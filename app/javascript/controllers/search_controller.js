import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["input"]

  connect() {
    console.log("hi")
    console.log(this.inputTarget.value)
  }

  async search() {
    console.log("yes")
    console.log(this.inputTarget.value)
    const query = this.inputTarget.value
  }
}
