import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

document.addEventListener("turbo:load", () => {
  HSStaticMethods.autoInit();
});

document.addEventListener("turbo:render", () => {
  HSStaticMethods.autoInit();
});

const carousels = document.querySelectorAll('.carousel-target'); // Select the carousel elements

carousels.forEach(carousel => {
  let startX, startY;

  carousel.addEventListener('touchstart', (e) => {
    startX = e.touches[0].pageX;
    startY = e.touches[0].pageY;
  });

  carousel.addEventListener('touchmove', (e) => {
    const moveX = e.touches[0].pageX;
    const moveY = e.touches[0].pageY;
    const diffX = Math.abs(moveX - startX);
    const diffY = Math.abs(moveY - startY);

    // If the vertical swipe distance is greater than the horizontal swipe distance, prevent the carousel swipe
    if (diffY > diffX) {
      e.stopPropagation(); // Stops the carousel from intercepting the swipe
    }
  });
});
