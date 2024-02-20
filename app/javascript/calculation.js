window.addEventListener('turbo:load',() => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

  const price = parseFloat(priceInput.value);
  if (isNaN(price)) return; // 入力が数値でない場合は処理を終了

  // 販売手数料と利益を計算（小数点以下の桁を表示しない）
  const addTaxDom = document.getElementById("add-tax-price")
  addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));

  const profit = document.getElementById("profit")
  const taxValue = inputValue * 0.1
  profit.innerHTML = (Math.floor(inputValue - taxValue));
  });
});