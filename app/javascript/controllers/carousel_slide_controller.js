import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    new Swiper('.mySwiper2', {
      // Optional parameters
      // direction: 'vertical',
      loop: true,
      autoplay: {
        delay: 1500
      },
      effect: "fade",
      slidesPerView: 3,
      freeMode: true,
      spaceBetween: 90
    });
  }
}
