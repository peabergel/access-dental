import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="fadein"
export default class extends Controller {
  static targets = ["part"];

  connect() {
    this.observer = new IntersectionObserver(this.#handleIntersect.bind(this), {
    threshold: 0.1, // 10% de l'élément visible pour déclencher l'animation
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
    const delayOffset = parseFloat(target.dataset.delay || "0"); // Option de délai depuis un attribut
    const text = target.innerText;
    target.innerHTML = text
      .split("")
      .map(
        (letter, index) =>
          `<span class="opacity-0 animate-fadeIn" style="animation-delay:${delayOffset + index * 0.03
          }s">${letter}</span>`
      )
      .join("");
  }
}
