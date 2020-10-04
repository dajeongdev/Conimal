const productCards = document.querySelectorAll('.product-card');
const modal = document.querySelector('.modal');
const SHOWING = 'showing';



const init = () => {
  for (let i = 0; i < productCards.length; i++) {
	  console.log("dd");

    productCards[i].addEventListener('click', clickModal);
  }
};
const clickModal=()=>{
	console.log("modal");
	console.log(modal);
	  modal.classList.add(SHOWING);
	};

init();