function calculate() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const price = parseFloat(priceInput.value);
    if (isNaN(price)) return; //入力が数値でない場合計算しない

    // 販売手数料と利益を表示（小数点以下の桁を表示しない）
    const addTaxDom = Math.floor(price * 0.1);
    const profit = Math.floor(price - addTaxDom);

    document.getElementById("add-tax-dom").innerHTML = addTax;
    document.getElementById("profit").innerHTML = profit;
  });
}

// 読み込み完了時にcalculate関数を呼び出す
window.addEventListener('DOMContentLoaded', calculate);