const copyButton = document.querySelector('#copy-button');
const input = document.querySelector('input');

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
