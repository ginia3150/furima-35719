const pay = () => {
  Payjp.setPublicKey("pk_test_217474baba885807a937c282");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    const card = {
      number: formData.get("history_code[number]"),
      exp_month: formData.get("history_code[exp_month]"),
      exp_year: `20${formData.get("history_code[exp_year]")}`,
      cvc: formData.get("history_code[cvc]"),
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);