import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fadein"
export default class extends Controller {
  static targets = ["partOne", "partTwo", "partThree"]

  connect() {
    this.#animateTitle(this.partOneTarget, 0);
    this.#animateTitle(this.partTwoTarget, 0.25);
    this.#animateTitle(this.partThreeTarget, 0.5);
  }

  #animateTitle(target, delayOffset) {
    const text = target.innerText;
    target.innerHTML = text
      .split("")
      .map((letter, index) => `<span class="opacity-0 animate-fadeIn" style="animation-delay:${delayOffset + index * 0.02}s">${letter}</span>`)
      .join("");
  }
}
