import { Controller } from "@hotwired/stimulus"
import { leave, enter } from "el-transition";

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["menu", "button"]

  connect() {
    this.isMenuVisible = false;
    this.leaveTimeout = null;
  }

  show() {
    // Annule le timeout si la souris revient rapidement sur le bouton ou le menu
    clearTimeout(this.leaveTimeout);

    if (!this.isMenuVisible) {
      enter(this.menuTarget); // Affiche le menu avec les transitions
      this.isMenuVisible = true;
    }
  }

  hide(event) {
    // Vérifie si la souris est encore sur le bouton ou dans le menu
    const hoveredElement = event.relatedTarget;

    if (!this.element.contains(hoveredElement)) {
      this.leaveTimeout = setTimeout(() => {
        leave(this.menuTarget); // Cache le menu avec les transitions après un délai
        this.isMenuVisible = false;
      }, 200); // Petit délai pour éviter des hovers trop rapides
    }
  }
}
