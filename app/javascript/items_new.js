document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  if (priceInput) {
    priceInput.addEventListener('input', () => {
      const inputValue = priceInput.value.replace(/,/g, '');
      
      if (inputValue >= 300 && inputValue <= 9999999) {
        const tax = Math.floor(inputValue * 0.1);
        const profitAmount = inputValue - tax;

        addTaxPrice.innerHTML = formatWithCommas(tax);
        profit.innerHTML = formatWithCommas(profitAmount);
      } else {
        addTaxPrice.innerHTML = '';
        profit.innerHTML = '';
      }

      priceInput.value = formatWithCommas(inputValue);
    });
  }

  function formatWithCommas(value) {
    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
  }
});