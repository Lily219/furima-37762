// window.addEventListener("load", pay);

const pay = () => {
  console.log("ok")
  Payjp.setPublicKey("pk_test_be7ba346bc03a560524437dc");
  const submit = document.getElementById("button");
  console.log(submit)
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    console.log(formResult)

    const card = {
      number: formData.get("order_address[number]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
      cvc: formData.get("order_address[cvc]"),
    };
    console.log(card)

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
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