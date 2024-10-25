// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

// Register the above dropdown controller with Stimulus.
import CardController from "./card_controller";
application.register("card", CardController)

eagerLoadControllersFrom("controllers", application)
