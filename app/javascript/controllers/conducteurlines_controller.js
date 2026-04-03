window.onload=function(){
function submitlines(){
var elGrid1 = document.querySelectorAll(".grid [data-index]").length;
    for (var i = 0;i<elGrid1;i++){
      document.querySelectorAll("[id*=conducteur_conducteurlines_attributes][id*=_ordre")[i].value=i+1;
    }

return;
}
}

