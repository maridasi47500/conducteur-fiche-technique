// Source - https://stackoverflow.com/a/76600210
// Posted by Roko C. Buljan, modified by community. See post 'Timeline' for change history
// Retrieved 2026-04-01, License - CC BY-SA 4.0


const elGrid = document.querySelector(".grid");
function submitlines(){
var elGrid1 = document.querySelectorAll(".grid [data-index]").length;
    for (var i = 0;i<elGrid1;i++){
      document.querySelectorAll("[id*=conducteur_conducteurlines_attributes][id*=_ordre")[i].value=i+1;
    }

return;
}


const elOrder = document.querySelector("#order");
const order = [...elGrid.children].map(el => el.dataset.index);
let elDrag;

const showOrder = () => elOrder.textContent = `Order: ${order}`;

const events = {
  dragstart() { elDrag = this; },
  dragover(ev) { ev.preventDefault(); },
  drop() {
    if (elDrag === this) return;
    const ia = [...elGrid.children].indexOf(elDrag);
    const ib = [...elGrid.children].indexOf(this);
    elDrag.replaceWith(this.cloneNode(true));
    this.replaceWith(elDrag);
    [order[ia], order[ib]] = [order[ib], order[ia]];
    showOrder();
  }
};

[...elGrid.children].forEach((el, i) => el.draggable = true);
["dragstart", "dragover", "drop"].forEach(evName => {
  elGrid.addEventListener(evName, (ev) => {
  if(ev.target.className === 'item') {
    const elItem = ev.target.closest(".item");
    if (!elItem) return; 
    events[evName].call(elItem, ev);
    }
  });
});
window.onload=function(){
showOrder();

}

console.log(elGrid1);


