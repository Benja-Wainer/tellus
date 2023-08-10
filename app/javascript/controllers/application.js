import { Application } from "@hotwired/stimulus"
import Reveal from 'stimulus-reveal-controller'

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
