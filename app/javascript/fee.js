window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = Math.round(priceInput.value * 0.1 );
      const addProfit = document.getElementById("profit");
      addProfit.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1))
  })
});