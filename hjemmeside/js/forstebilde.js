var folder = "galleri/"
var totNum = 76
var thisNum
var thisImage

function forstebilde(){
var image = document.getElementById("gallerifoto")
totNum=76
//thisNum = Math.ceil(Math.random()* totNum) 
thisNum = totNum
var thisImage

thisNumTemp=thisNum.toString()
thisImage= thisNumTemp.concat(".jpg")
thisImage = folder.concat(thisImage)
image.src = thisImage}