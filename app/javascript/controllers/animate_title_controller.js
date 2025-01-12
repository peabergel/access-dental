import { Controller } from "@hotwired/stimulus";
import anime from "animejs"

// Connects to data-controller="animate-title"
export default class extends Controller {
  static targets = ["title"];

  connect() {
    this.observer = new IntersectionObserver(this.#handleIntersect.bind(this), {
    threshold: 0.5,
    });

    // Observer chaque cible
    this.titleTargets.forEach(target => this.observer.observe(target));
  }

  #handleIntersect(entries) {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        this.#separateLetters(entry.target); // Sépare les lettres
        this.#animateTitle(entry.target); // Lance l'animation
        this.#removeClassLetter(entry.target); // Retire la classe letter
        this.observer.unobserve(entry.target); // Arrête d'observer l'élément après animation
      }
    });
  }

  #separateLetters(title) {
    Array.from(title.children).forEach(el => {
      el.style.opacity = 1;
      el.innerHTML = el.textContent.replace(/\S/g, `<span class='letter inline-block'>$&</span>`)
    });
  }

  #removeClassLetter(title) {
    Array.from(title.children).forEach(word => {
      Array.from(word.children).forEach(letter => {
        letter.classList.remove('letter')
      })
    });
  }

  #animateTitle() {
    anime.timeline()
      .add({
        targets: `.letter`,
        translateX: [40,0],
        translateZ: 0,
        opacity: [0,1],
        easing: "easeOutExpo",
        duration: 1200,
        delay: (el, i) => 200 + 30 * i
      });
  }
}
