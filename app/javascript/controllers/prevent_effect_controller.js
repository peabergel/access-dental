import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  stopPropagation(event) {
    event.stopPropagation();
  }

  preventTouchStart(event) {
    event.preventDefault();
  }

  preventHover() {
    this.element.children[0].children[2].classList.remove('group-hover:translate-x-0')
  }
}
