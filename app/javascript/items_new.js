const price = () => {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  if (priceInput) {
    priceInput.addEventListener('input', () => {
      const inputValue = priceInput.value;
      
      if (inputValue >= 300 && inputValue <= 9999999) {
        const tax = Math.floor(inputValue * 0.1);
        const profitAmount = inputValue - tax;

        addTaxPrice.innerHTML = tax;
        profit.innerHTML = profitAmount;
      } else {
        addTaxPrice.innerHTML = '';
        profit.innerHTML = '';
      }
    });
  }
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);