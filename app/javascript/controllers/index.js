// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import Notification from '@stimulus-components/notification'
import ScrollReveal from '@stimulus-components/scroll-reveal'
import { RailsuiCountUp } from 'railsui-stimulus'

application.register("notification", Notification)
application.register('scroll-reveal', ScrollReveal)
application.register('railsui-count-up', RailsuiCountUp)

eagerLoadControllersFrom("controllers", application)
