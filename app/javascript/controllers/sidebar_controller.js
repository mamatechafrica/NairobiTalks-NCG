import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sidebar", "toggleIcon"]

  connect() {
    // Restore collapsed state from localStorage
    const collapsed = localStorage.getItem('adminSidebarCollapsed') === 'true'
    if (collapsed) {
      this.collapse()
    }
  }

  toggle() {
    if (this.sidebarTarget.classList.contains('collapsed')) {
      this.expand()
    } else {
      this.collapse()
    }
  }

  collapse() {
    this.sidebarTarget.classList.add('collapsed')
    this.toggleIconTarget.classList.remove('fa-bars')
    this.toggleIconTarget.classList.add('fa-chevron-right')
    localStorage.setItem('adminSidebarCollapsed', 'true')
  }

  expand() {
    this.sidebarTarget.classList.remove('collapsed')
    this.toggleIconTarget.classList.remove('fa-chevron-right')
    this.toggleIconTarget.classList.add('fa-bars')
    localStorage.setItem('adminSidebarCollapsed', 'false')
  }
}