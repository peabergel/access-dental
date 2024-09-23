// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
// Register the above dropdown controller with Stimulus.
import DropdownController from "./dropdown_controller.js"
application.register("dropdown", DropdownController)
eagerLoadControllersFrom("controllers", application)
