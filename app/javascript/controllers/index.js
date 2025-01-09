// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import Notification from '@stimulus-components/notification'
import ScrollReveal from '@stimulus-components/scroll-reveal'

// Register the above dropdown controller with Stimulus.
import CardController from "./card_controller";
import FadeinController from "./fadein_controller";
import CarouselFadeController from "./carousel_fade_controller";
import CarouselSlideController from "./carousel_slide_controller";

application.register("card", CardController)
application.register("fadein", FadeinController)
application.register("carousel-fade", CarouselFadeController)
application.register("carousel-slide", CarouselSlideController)
application.register("notification", Notification)
application.register('scroll-reveal', ScrollReveal)

eagerLoadControllersFrom("controllers", application)
