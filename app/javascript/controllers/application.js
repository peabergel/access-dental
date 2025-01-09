import { Application } from "@hotwired/stimulus"
import "preline"
import { register } from "swiper/element/bundle";
register();

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
