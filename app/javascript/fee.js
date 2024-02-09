const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const price = parseFloat(inputValue);
    if (!isNaN(price) && price >= 300 && price <= 9999999) {
      const fee = Math.floor(price * 0.1);
      const profit = Math.floor(price - fee);
      document.getElementById("add-tax-price").innerHTML = fee.toLocaleString();
      document.getElementById("profit").innerHTML = profit.toLocaleString();
    } else {
      document.getElementById("add-tax-price").innerHTML = "";
      document.getElementById("profit").innerHTML = "";
    }
  });
};
window.addEventListener("turbo:load", price);