var folder = "galleri/"
var totNum = 18
var thisNum
var thisImage

function nyttbilde(d){
	var image = document.getElementById("gallerifoto")
	thisNum = thisNum + d
	
	if (thisNum > totNum){
		thisNum = thisNum-totNum;}
	else if (thisNum < 1){
		thisNum = totNum+thisNum}
		
	thisNumTemp=thisNum.toString()
	
	thisImage= thisNumTemp.concat(".jpg")
	
	thisImage = folder.concat(thisImage)
	image.src = thisImage
}	
