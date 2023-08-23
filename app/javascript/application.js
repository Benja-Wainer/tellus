// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
// import "./fade_in"
import { Application } from '@hotwired/stimulus'
import ScrollReveal from 'stimulus-scroll-reveal'
const application = Application.start()
application.register('scroll-reveal', ScrollReveal)
