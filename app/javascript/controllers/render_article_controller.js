import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="render-article"
export default class extends Controller {
  static values = {id: String}
  connect() {
    console.log("Render Article Controller connected");
  }

  render() {
    console.log(this.articleValue);
  }
}
