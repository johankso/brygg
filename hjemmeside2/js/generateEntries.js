function generateEntries(xmlfile){
/* var image = document.getElementById("gallerifoto") */
var xmlhttp = new XMLHttpRequest();
xmlhttp.onreadystatechange = function() {
if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
  myFunction(xmlhttp);
}
}
xmlhttp.open("GET", xmlfile, true);
xmlhttp.send();

}	
