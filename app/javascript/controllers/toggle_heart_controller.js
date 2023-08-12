import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-heart"
export default class extends Controller {
  connect() {
    console.log("Toggle Heart Controller connected");
  }
}
