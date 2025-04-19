import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.updateParallax();
    window.addEventListener("scroll", this.updateParallax.bind(this));
  }

  disconnect() {
    window.removeEventListener("scroll", this.updateParallax.bind(this));
  }

  updateParallax() {
    const scrollPosition = window.scrollY;
    const parallaxSpeed = 0.5;
    const offset = window.innerWidth < 650 ? 7300 : (window.innerWidth < 768 ? 6600 : (window.innerWidth < 1024 ? 5100 : 4500));
    this.element.style.backgroundPositionY = `${(-scrollPosition + offset) * parallaxSpeed}px`;
  }
  // 0.1 = 2400
  // 0.2 = 4000

}
