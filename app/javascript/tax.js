function tax (){
  const articleText  = document.getElementById("item-price");
  articleText.addEventListener("keyup", () => {
    const countVal = Math.floor(articleText.value * 0.1);
    const charNum = document.getElementById("add-tax-price");
    charNum.innerHTML = `${countVal}`;

    const countTax = (articleText.value - countVal);
    const numNum = document.getElementById("profit");
    numNum.innerHTML = `${countTax}`;
  });
}
window.addEventListener('keypress', tax);