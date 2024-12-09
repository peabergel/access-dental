import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content", "overlay"]

  connect() {
    console.log("Card controller connected")
  }

  toggleOverlay(event) {
    event.preventDefault();
    console.log("Overlay toggled");

    if (this.overlayTarget.classList.contains('-translate-x-full')) {
      // Afficher l'overlay et le texte
      this.overlayTarget.classList.remove('transform', '-translate-x-full');
      this.contentTarget.classList.remove('opacity-0');
      this.contentTarget.classList.add('opacity-100');
    } else {
      // Masquer l'overlay et le texte
      this.overlayTarget.classList.add('transform', '-translate-x-full');
      this.contentTarget.classList.remove('opacity-100');
      this.contentTarget.classList.add('opacity-0');
    }
  }
}
