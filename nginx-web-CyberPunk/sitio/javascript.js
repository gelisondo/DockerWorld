
// Cambia de Css con esta funsión
function cambiarArchivoCss(archivo) {
    document.getElementById('cssArchivo').href=archivo;
    }

//Menú colapsable
function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
      x.className += " responsive";
    } else {
      x.className = "topnav";
    }
  } 

