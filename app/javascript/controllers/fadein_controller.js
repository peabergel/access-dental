import { Controller } from "@hotwired/stimulus";
import anime from "animejs"

// Connects to data-controller="fadein"
export default class extends Controller {
  static targets = ["part"];

  connect() {
    this.observer = new IntersectionObserver(this.#handleIntersect.bind(this), {
    });

    // Observer chaque cible
    this.partTargets.forEach(target => this.observer.observe(target));
  }

  #handleIntersect(entries) {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        this.#animateTitle(entry.target); // Lance l'animation
        this.observer.unobserve(entry.target); // Arrête d'observer l'élément après animation
      }
    });
  }

  #animateTitle(target) {
    target.innerHTML = target.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

    anime.timeline({loop: false})
      .add({
        targets: '.ml1 .letter',
        translateX: [40,0],
        translateZ: 0,
        opacity: [0,1],
        easing: "easeOutExpo",
        duration: 1200,
        delay: (el, i) => 500 + 30 * i
      });
  }
}
