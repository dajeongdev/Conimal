const productCards = document.querySelectorAll('.product-card');
const backdrop = document.querySelector(".backdrop");
const modal = document.querySelector('.modal');
const SHOWING = 'showing';


const modalClose = () => {
	modal.classList.remove(SHOWING);
}

const modalOpen = () => {
	  modal.classList.add(SHOWING);
	};

const init = () => {
  for (let i = 0; i < productCards.length; i++) {
    productCards[i].addEventListener('click', modalOpen);
  }
  backdrop.addEventListener("click",modalClose);
};


init();