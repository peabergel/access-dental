// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import Notification from '@stimulus-components/notification'
import ScrollReveal from '@stimulus-components/scroll-reveal'

// Register the above dropdown controller with Stimulus.
import CardController from "./card_controller";
import FadeinController from "./fadein_controller";
import SwiperController from "./swiper_controller";

application.register("card", CardController)
application.register("fadein", FadeinController)
application.register("swiper", SwiperController)
application.register("notification", Notification)
application.register('scroll-reveal', ScrollReveal)

eagerLoadControllersFrom("controllers", application)
