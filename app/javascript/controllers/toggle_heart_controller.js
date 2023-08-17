import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-heart"
export default class extends Controller {
  static targets = ["icon"]
  static classes = ["toggle"]

  connect() {
    console.log("Toggle Heart Controller connected");
  }

  toggle() {
    this.iconTarget.classList.toggle(this.toggleClass);
  }
}
