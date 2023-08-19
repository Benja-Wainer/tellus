import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = ["icon", "sidebar", "content", "background"]

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
    this.sidebarTarget.classList.remove("col-2")
    this.sidebarTarget.style.width = "59px"
    this.sidebarTarget.dataset.expanded = "0"
    this.iconTarget.innerHTML = `
      <i class="fa-solid fa-angles-left text-light btn btn-outline-dark" data-sidebar-target="icon"></i>
    `
    this.contentTarget.classList.add("d-none")
    // this.backgroundTarget.style.background = "rgba(0, 0, 0, 0.1)"
  }

  expand() {
    this.sidebarTarget.style.removeProperty('width')
    this.sidebarTarget.classList.add("col-2")
    this.sidebarTarget.dataset.expanded = "1"
    this.iconTarget.innerHTML = `
      <i class="fa-solid fa-angles-right text-light btn btn-outline-dark" data-sidebar-target="icon"></i>
    `
    this.contentTarget.classList.remove("d-none")
  }
}
