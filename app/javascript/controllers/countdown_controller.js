import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ["days", "hours", "minutes", "seconds", "next"]
  // static values = { date: Date }

  connect() {
    // Récupérer la date stockée dans la variable `@next_date`
    let nextDate = new Date(this.nextTarget.innerText)

    // Définir une fonction de mise à jour qui mettra à jour les éléments HTML avec le temps restant
    const updateCountdown = () => {
      let now = new Date().getTime()
      let distance = nextDate.getTime() - now

      let days = Math.floor(distance / (1000 * 60 * 60 * 24))
      let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))
      let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60))
      let seconds = Math.floor((distance % (1000 * 60)) / 1000)

      this.daysTarget.innerHTML = days
      this.hoursTarget.innerHTML = hours
      this.minutesTarget.innerHTML = minutes
      this.secondsTarget.innerHTML = seconds
    }

    // Mettre à jour le compte à rebours toutes les secondes
    setInterval(updateCountdown, 1000)
  }
}
