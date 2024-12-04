function setNumberField(number: number): void {
    const field = document.getElementById('number-field');
    if (field)
    {
        field.innerText = number.toFixed(2).toString();
    }
    else {
        console.error("Field 'number-field not found");
    }
}

function fetchNumber(): Promise<number> {
    return fetch('/api/get-number')
        .then(response => response.json())
        .then(data => data as number);
}

async function getNumberHandler(): Promise<void> {
    const number = await fetchNumber();
    setNumberField(number);
}