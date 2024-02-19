const pay = () => {
  //テスト公開鍵  
  const publicKey = gon.public_key;
  const payjp = Payjp(publicKey);

  //HTML要素をフォームと置き換え
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

   // フォームの送信をトリガーする関数
   const submitForm = () => {
    const form = document.getElementById('charge-form');
    form.submit();
  };

  //処理が完了した時のみトークンの値を取得し送信アクション実行
  const form = document.getElementById('charge-form')
  form.addEventListener('submit', async (e) => {
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      //エラーハンドリングを行う
      } else {
        const token = response.id;
        const renderDom = document.getElementById('charge-form');
        const tokenObj = `<input value="${token}" name="token" type="hidden">`;
        renderDom.insertAdjacentHTML('beforeend', tokenObj);
      }

      //クレジットカード情報削除
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      //フォームの情報をサーバーサイドに送信
      document.getElementById("charge-form").submit();
    });
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render",pay);