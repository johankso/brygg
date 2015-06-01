function forstebilde(){
var image = document.getElementById("balkongfoto")
totNum=16
thisNum = Math.ceil(Math.random()* totNum) 
var thisImage

thisNumTemp=thisNum.toString()
thisImage= thisNumTemp.concat(".jpg")
thisImage = folder.concat(thisImage)
image.src = thisImage}