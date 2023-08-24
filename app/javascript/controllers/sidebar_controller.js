import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = ["icon", "sidebar", "content", "background", "pinned-topics", "pin"]

  connect() {
    console.log("Sidebar controller connected");
    if (this.sidebarTarget.dataset.expanded === "0") {
      this.collapse()
    }
  }

  toggle() {
    if (this.sidebarTarget.dataset.expanded === "1") {
      this.collapse()
    } else {
      this.expand()
    }
  }

  collapse() {
    this.sidebarTarget.classList.add('sidebar-collapsed')
    this.sidebarTarget.classList.remove('sidebar')
    this.sidebarTarget.style.background = "rgba(0, 0, 0, 0)"
    this.sidebarTarget.dataset.expanded = "0";

    this.iconTarget.classList.remove('fa-angles-right');
    this.iconTarget.classList.add('fa-angles-left');

    this.contentTarget.classList.add("d-none");
  }

  expand() {
    this.sidebarTarget.classList.remove('sidebar-collapsed')
    this.sidebarTarget.classList.add('sidebar')
    this.sidebarTarget.style.removeProperty('background')
    this.sidebarTarget.dataset.expanded = "1"

    this.iconTarget.classList.add('fa-angles-right');
    this.iconTarget.classList.remove('fa-angles-left');

    this.contentTarget.classList.remove("d-none")
  }

  pinTopic() {
    // this.pinnedTopicsTarget.insertAdjacentHTML("beforeend", "New target HTML")
    console.log(this.pinnedTopicsTarget)
  }
}
