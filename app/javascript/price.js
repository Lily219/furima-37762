function price (){
  const itemPrice  = document.getElementById("item-price");
  console.log(itemPrice)
  itemPrice.addEventListener("keyup", () => {
    const fee = (Math.floor(itemPrice.value * 0.1));
    console.log(fee)
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${fee}`;
    const SalesProfit = (Math.floor(itemPrice.value - fee));
    const profit = document.getElementById("profit");
    profit.innerHTML = `${SalesProfit}`;
  });
}

window.addEventListener('load', price);