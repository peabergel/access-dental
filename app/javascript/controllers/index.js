// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import Notification from '@stimulus-components/notification'
import ScrollReveal from '@stimulus-components/scroll-reveal'

application.register("notification", Notification)
application.register('scroll-reveal', ScrollReveal)

eagerLoadControllersFrom("controllers", application)
