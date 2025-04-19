import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.addEventListener('mouseenter', () => {
      this.element.style.color = this.element.dataset.secondaryColor
    })

    this.element.addEventListener('mouseleave', () => {
      this.element.style.color = this.element.dataset.primaryColor
    })
  }
}
