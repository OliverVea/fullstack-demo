const apiBaseUrl = 'http://localhost:5000/api';
const numberFieldId = 'number-field';

function getNumber() {
    fetch(`${apiBaseUrl}/get-number`)
        .then(response => response.json())
        .then(data => {
        document.getElementById(numberFieldId).innerText = data;
        });
}