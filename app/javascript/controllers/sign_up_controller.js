import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sign-up"
export default class extends Controller {
  connect() {
    console.log("hello from sign up controller")
  }
}
