// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import Notification from '@stimulus-components/notification'

// Register the above dropdown controller with Stimulus.
import CardController from "./card_controller";
application.register("card", CardController)
application.register('notification', Notification)

eagerLoadControllersFrom("controllers", application)
