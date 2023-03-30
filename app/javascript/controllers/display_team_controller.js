import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-team"
export default class extends Controller {

  static targets = ["button", "adversary"]

  display(event) {
    event.preventDefault();
    if (this.adversaryTarget.classList.contains("d-none")) {
      this.adversaryTarget.classList.remove("d-none");
      this.buttonTarget.innerText = "Cacher son club";
    } else {
      this.adversaryTarget.classList.add("d-none");
      this.buttonTarget.innerText = "Afficher son club";
    }
  }
}
