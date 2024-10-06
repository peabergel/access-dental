import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slideContainer", "prevButton", "nextButton", "indicator"]

  connect() {
    this.currentSlide = 0
    this.slidesToShow = 3
    this.totalSlides = this.slideContainerTarget.children.length
    this.maxSlide = this.totalSlides - this.slidesToShow
    this.updateCarousel()
  }

  nextSlide() {
    if (this.currentSlide < this.maxSlide) {
      this.currentSlide++
      this.updateCarousel()
    }
  }

  prevSlide() {
    if (this.currentSlide > 0) {
      this.currentSlide--
      this.updateCarousel()
    }
  }

  goToSlide(event) {
    const slideIndex = parseInt(event.currentTarget.dataset.carouselSlideIndex)
    if (slideIndex <= this.maxSlide) {
      this.currentSlide = slideIndex
      this.updateCarousel()
    }
  }

  updateCarousel() {
    this.slideContainerTarget.style.transform = `translateX(-${this.currentSlide * (100 / this.slidesToShow)}%)`
    this.updateButtons()
    this.updateIndicators()
  }

  updateButtons() {
    this.prevButtonTarget.disabled = this.currentSlide === 0
    this.nextButtonTarget.disabled = this.currentSlide === this.maxSlide
    this.prevButtonTarget.classList.toggle('opacity-50', this.currentSlide === 0)
    this.nextButtonTarget.classList.toggle('opacity-50', this.currentSlide === this.maxSlide)
  }

  updateIndicators() {
    this.indicatorTargets.forEach((indicator, index) => {
      indicator.classList.toggle('bg-blue-500', index === this.currentSlide)
      indicator.classList.toggle('bg-gray-300', index !== this.currentSlide)
    })
  }
}
