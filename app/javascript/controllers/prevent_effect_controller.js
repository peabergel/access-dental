import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["overlay"]

  stopPropagation(event) {
    event.stopPropagation();
  }

  preventTouchStart(event) {
    event.preventDefault();
  }

  preventHover() {
    this.overlayTarget.classList.remove('group-hover:translate-x-0')
  }
}
