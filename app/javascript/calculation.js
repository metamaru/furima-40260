function calculate() {
  var priceInput = document.getElementById("item_price").value;
  if (priceInput === "") {
    // 入力フィールドが空の場合は計算せず、空文字列を表示する
    document.getElementById("add-tax-price").innerText = "";
    document.getElementById("profit").innerText = "";
  } else {
    var price = parseFloat(priceInput);
    var commissionRate = 0.1; // 販売手数料率
    var commission = Math.floor(price * commissionRate); // 販売手数料の計算（小数点以下を切り捨て）
    var profit = Math.floor(price - commission);  // 利益の計算（小数点以下を切り捨て）

    // 販売手数料と利益を表示（小数点以下の桁を表示しない）
    document.getElementById("add-tax-price").innerText = Math.floor(commission);
    document.getElementById("profit").innerText = Math.floor(profit);
  }
}

// 読み込み完了時にcalculate関数を呼び出す
document.addEventListener("DOMContentLoaded", function(event) {
  calculate();
});