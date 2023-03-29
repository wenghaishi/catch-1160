import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tokens"
export default class extends Controller {
  static targets = [ "form", "items", "token", "count" ]
  connect() {
    console.log("tokens controller connected")
  }

  submitForm(e) {
    e.preventDefault()

    this.submit(this.formTarget)
  }

  submit(form) {
    const location = this.tokenTargets.slice(-1)[0]
    fetch(form.action, {
      method: form.method,
      headers: {
        "Accept": "application/json",
      },
      body: new FormData(form)
    })
    .then(res => res.json())
    .then(data => {
      if (data.token) {
        location.insertAdjacentHTML('afterend', data.token)
        this.countTargets.forEach((count) => {
          count.innerText = parseInt(count.innerText) + 1
        })
      }
      this.formTarget.outerHTML = data.form
    })
  }

  startGame() {
    console.log("hello")
  }
  // validateForm(e) {
  //   clearTimeout(this.timer)

  //   this.timer = setTimeout(() => {
  //     fetch(this.element.action, {
  //       method: this.element.method,
  //       headers: {
  //         "Accept": "text/plain",
  //       },
  //       body: new FormData(this.element)
  //     })
  //     .then(res => res.text())
  //     .then(data => this.element.outerHTML = data)
  //   }, 1500)
  // }
}
