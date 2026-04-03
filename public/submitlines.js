
if (document.querySelectorAll("[id*=conducteur_conducteurlines_attributes][id*=_ordre").length > 0){
function submitlines(){
var elGrid1 = document.querySelectorAll(".grid [data-index]").length;
    for (var i = 0;i<elGrid1;i++){
      document.querySelectorAll("[id*=conducteur_conducteurlines_attributes][id*=_ordre]")[i].value=i+1;
    }

//myformconducteur.submit();
return false;
}
}

if (document.querySelectorAll("[id*=fiche_technique_plan_de_scene_dessins_attributes][id*=_ordre").length > 0){
function submitfichelines(){
var elGrid1 = document.querySelectorAll(".grid [data-index]").length;
    for (var i = 0;i<elGrid1;i++){
      document.querySelectorAll("[id*=fiche_technique_plan_de_scene_dessins_attributes][id*=_ordre]")[i].value=i+1;
    }
//myformfiche.submit();
return false;
}
}

