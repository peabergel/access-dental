import { Controller } from "@hotwired/stimulus"
import anime from "animejs"

// Connects to data-controller="animate_title"
export default class extends Controller {
  connect() {
    document.querySelectorAll(".ml1").forEach(el => el.style.opacity = 1);
    var textWrappers = document.querySelectorAll('.ml1 .letters');
    textWrappers.forEach((textWrapper) => {
      textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");
    })

    anime.timeline({loop: false})
      .add({
        targets: '.ml1 .letter',
        translateX: [40,0],
        translateZ: 0,
        opacity: [0,1],
        easing: "easeOutExpo",
        duration: 1200,
        delay: (el, i) => 200 + 30 * i
      });
  }
}
