// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import LineUp from "./controllers/line_up_controller.js"
Stimulus.register("line_up", LineUp)
