import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  // static targets = ["carousel"];

  // connect() {
  //   this.activeCarousel = null;
  // }

  // toggle(event) {
  //   const selectedCarousel = event.currentTarget.nextElementSibling;

  //   // Si le carousel est déjà actif et que l'utilisateur clique à nouveau, on le ferme
  //   if (this.activeCarousel === selectedCarousel) {
  //     this.hideCarousel(selectedCarousel);
  //     this.activeCarousel = null; // Réinitialiser l'actif
  //     return; // Sortir de la fonction
  //   }

  //   // Ferme tous les autres carousels avant d'en ouvrir un nouveau
  //   this.closeAllCarousels();

  //   // Ouvre le carousel sélectionné et force Preline à réinitialiser
  //   this.showCarousel(selectedCarousel);
  //   this.activeCarousel = selectedCarousel; // Met à jour le carousel actif
  // }

  // closeAllCarousels() {
  //   this.carouselTargets.forEach((carousel) => {
  //     this.hideCarousel(carousel);
  //     this.resetCarouselStyles(carousel);
  //   });
  // }

  // showCarousel(carouselElement) {
  //   carouselElement.classList.remove("hidden");
  //   this.initializePrelineCarousel(carouselElement);
  // }

  // hideCarousel(carouselElement) {
  //   carouselElement.classList.add("hidden");
  // }

  // resetCarouselStyles(carouselElement) {
  //   const carouselBody = carouselElement.querySelector(".hs-carousel-body");
  //   const slides = carouselElement.querySelectorAll(".hs-carousel-slide");

  //   if (carouselBody) {
  //     carouselBody.style.width = ""; // Réinitialiser la largeur
  //   }

  //   slides.forEach((slide) => {
  //     slide.style.width = ""; // Réinitialiser la largeur de chaque slide
  //   });
  // }

  // initializePrelineCarousel(carouselElement) {
  //   setTimeout(() => {
  //     if (window.HSCarousel) {
  //       const carouselInstance = window.HSCarousel.getInstance(carouselElement.querySelector('.hs-carousel'));
  //       if (carouselInstance) {
  //         carouselInstance.refresh(); // Rafraîchir l'instance existante
  //       } else {
  //         if (typeof window.HSCarousel.init === 'function') {
  //           window.HSCarousel.init(carouselElement.querySelector('.hs-carousel')); // Initialiser le nouveau carrousel
  //         } else {
  //           console.error("HSCarousel.init is not a function. Please check if Preline is loaded correctly.");
  //         }
  //       }
  //     } else {
  //       console.error("HSCarousel is not defined. Please check if Preline is loaded correctly.");
  //     }
  //   }, 200);
  // }
}
