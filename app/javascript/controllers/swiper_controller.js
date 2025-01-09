import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swiper"
export default class extends Controller {
  connect() {
    new Swiper(
      '#landingSwiper', {
        loop: true,
        effect: "fade",
        autoplay: { delay: 4000 }
      });

    new Swiper('#brandSwiper', {
      speed: 500,
      loop: true,
      autoplay: { delay: 1000 },
      breakpoints: {
        480: {
          slidesPerView: 1,
          spaceBetween: 20,
        },
        768: {
          slidesPerView: 2,
          spaceBetween: 50,
        },
        1024: {
          slidesPerView: 3,
          spaceBetween: 90,
        }
      }
    });
  }
}
