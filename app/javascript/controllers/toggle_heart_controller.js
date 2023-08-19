import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-heart"
export default class extends Controller {
  static targets = ["icon", "topics", "newTopic"]
  static classes = ["toggle"]

  connect() {
    console.log("Toggle Heart Controller connected");
  }

  toggle(event) {
    console.log(this.iconTarget,this.toggleClass);
    event.currentTarget.classList.toggle(this.toggleClass);
    console.log(this.topicsTarget);
    console.log(this.newTopicTarget)
  //   this.topicsTarget.insertAdjacentHTML("beforeend", `<div class="card my-2" style="width: 18rem;">
  //   <div class="card-body card-details">
  //     <p class="card-text">${event.currentTarget}</p>
  //   </div>
  // </div>
  // `)
    fetch(`${window.location.pathname}/refresh_pins`, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.topicsTarget.outerHTML = data
      })

    // location.reload();
  }
}
