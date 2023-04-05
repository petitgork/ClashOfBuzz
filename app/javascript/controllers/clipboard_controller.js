import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const copyButton = this.element.querySelector('#copy-button');
    const input = this.element.querySelector('input');

    if (copyButton) {
      copyButton.addEventListener('click', () => {
        navigator.clipboard.writeText(input.value)
          .then(() => {
            copyButton.innerText = "Copié !";
          })
          .catch((error) => {
            console.error('Failed to copy text: ', error);
          });
      });
    }
  }
}
