document.addEventListener('DOMContentLoaded', function() {
  const itemPriceInput = document.getElementById("item-price");
  console.log(ここまで)
  if (itemPriceInput) {
    itemPriceInput.addEventListener('input', calculation);
    calculation();
  }
});

function calculation() {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return; // ID が存在しない場合は処理を終了

  const price = parseFloat(priceInput.value);
  if (isNaN(price)) return; // 入力が数値でない場合は処理を終了

  // 販売手数料と利益を計算（小数点以下の桁を表示しない）
  const addTaxDom = Math.floor(price * 0.1);
  const profit = Math.floor(price - addTaxDom);

  document.getElementById("add-tax-dom").innerText = addTaxDom;
  document.getElementById("profit").innerText = profit;
}