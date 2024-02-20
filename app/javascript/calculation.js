window.addEventListener('turbo:load',() => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

  const price = parseFloat(priceInput.value);
  if (isNaN(price)) return; // 入力が数値でない場合は処理を終了

  // 販売手数料の計算（小数点以下を2桁まで表示）
  const addTaxDom = document.getElementById("add-tax-price")
  addTaxDom.innerHTML = (Math.floor(inputValue * 0.1)); //小数点以下切り捨て
  //販売利益の計算
  const profit = document.getElementById("profit")
  const taxValue = inputValue * 0.1
  const roundedProfit = inputValue - taxValue
  profit.innerHTML = Math.ceil(roundedProfit); //利益を切り上げ
  });
});