import { Controller } from "@hotwired/stimulus";
import anime from "animejs"

// Connects to data-controller="fadein"
export default class extends Controller {
  static targets = ["part"];

  connect() {
    document.querySelectorAll(".ml2").forEach(el => el.style.opacity = 1);
    this.observer = new IntersectionObserver(this.#handleIntersect.bind(this), {
    });

    // Observer chaque cible
    this.partTargets.forEach(target => this.observer.observe(target));
  }

  #handleIntersect(entries) {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        const id = entry.target.dataset.truc;
        document.querySelectorAll(`.letters-${id}`).forEach(el => el.innerHTML = el.textContent.replace(/\S/g, `<span class='letter-${id} opacity-0'>$&</span>`));
        this.#animateTitle(entry.target); // Lance l'animation
        this.observer.unobserve(entry.target); // Arrête d'observer l'élément après animation
      }
    });
  }

  #animateTitle(element) {
    const id = element.dataset.truc;
    console.log(id)
    anime.timeline()
      .add({
        targets: `.ml2 .letter-${id}`,
        translateX: [40,0],
        opacity: 1,
        easing: "easeOutExpo",
        duration: 1200,
        delay: (el, i) => 500 + 30 * i
      });
  }
}
