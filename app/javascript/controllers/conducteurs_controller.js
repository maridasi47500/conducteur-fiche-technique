// Source - https://stackoverflow.com/a/76600210
// Posted by Roko C. Buljan, modified by community. See post 'Timeline' for change history
// Retrieved 2026-04-01, License - CC BY-SA 4.0


const elGrid = document.querySelector(".grid");
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
    for (var i = 0;i<elGrid.children.length;i++){
      document.getElementById("conducteur_conducteurlines_attributes_"+String(elGrid.children[i].dataset.index)+"_ordre").value=i+1;
      #document.findElementById("conducteur_conducteurlines_attributes_"+String(i+1)+"_ordre").value=document.findElementById("conducteur_conducteurlines_attributes_"+String(i+1)+"_ordre").parentElement.dataset.index
      #.value=document.findElementById("conducteur_conducteurlines_attributes_"+String(i+1)+"_ordre").parentElement.dataset.index
      #document.findElementById("conducteur_conducteurlines_attributes_"+String(i+1)+"_ordre").value=document.findElementById("conducteur_conducteurlines_attributes_"+String(i+1)+"_ordre").parentElement.dataset.index
    }   
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

