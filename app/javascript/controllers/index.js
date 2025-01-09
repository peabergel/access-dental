// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import Notification from '@stimulus-components/notification'
import ScrollReveal from '@stimulus-components/scroll-reveal'
import Carousel from '@stimulus-components/carousel'

// Register the above dropdown controller with Stimulus.
import CardController from "./card_controller";
import FadeinController from "./fadein_controller";

application.register("card", CardController)
application.register("fadein", FadeinController)
application.register('notification', Notification)
application.register('scroll-reveal', ScrollReveal)
application.register('carousel', Carousel)

eagerLoadControllersFrom("controllers", application)
