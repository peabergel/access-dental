import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="carousel-fade"
export default class extends Controller {
  connect() {
    new Swiper('.mySwiper1', {
      // Optional parameters
      // direction: 'vertical',
      loop: true,
      autoplay: {
        delay: 4000,
      },
      effect: "fade",

      // If we need pagination
      // pagination: {
      //   el: '.swiper-pagination',
      // },

      // Navigation arrows
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },

      // And if we need scrollbar
      // scrollbar: {
      //   el: '.swiper-scrollbar',
      // },
    });
  }
}
