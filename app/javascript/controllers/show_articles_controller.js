import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show"
export default class extends Controller {
static targets = ["collapsable"]

  connect() {
    console.log("Show articles controller is connected")
    console.log(this.collapsableTarget)

  }

  toggle(event) {
    console.log(event.currentTarget)
    this.collapsableTarget.classList.toggle("show");
    console.log("Test")
  }
}
