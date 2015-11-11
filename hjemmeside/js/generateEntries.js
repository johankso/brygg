function generateEntries(xmlfile) {
  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		checkEntries(xmlhttp)
    }
  }
  
  xmlhttp.open("GET", xmlfile, true);
  xmlhttp.send();
  
  
  function checkEntries(xml){
	xmlDoc = xml.responseXML;
	var x = xmlDoc.getElementsByTagName("entry");
    entryStart = "<div class='entry'>"
	entryEnd ="</div>"
	xmlString="";
	
	var date, header, text, images, caption, imageno, imagesrc, xmlString

	for (entry = 0; entry<x.length; entry++){
		date=x[entry].getElementsByTagName("date")[0].childNodes[0].nodeValue
		header=x[entry].getElementsByTagName("header")[0].childNodes[0].nodeValue
		text=x[entry].getElementsByTagName("text")[0].childNodes[0].nodeValue
		images = x[entry].getElementsByTagName("image")
		
		xmlString =xmlString.concat(entryStart)
		xmlString =xmlString.concat("<h3>")
		xmlString =xmlString.concat(header)
		xmlString =xmlString.concat("</h3>")
		xmlString = xmlString.concat("Publisert ")
		xmlString = xmlString.concat(date)
		
		xmlString =xmlString.concat("<p>")
		xmlString =xmlString.concat(text)
		xmlString =xmlString.concat("</p>")
		
		for (imageno = 0; imageno<images.length; imageno++){
			caption = images[imageno].getElementsByTagName("caption")[0].childNodes[0].nodeValue
			imagesrc = images[imageno].getElementsByTagName("file")[0].childNodes[0].nodeValue
			setname = "set"
			setname=setname.concat(entry.toString())
			imageString = "<a href='"
			imageString = imageString.concat(imagesrc)
			imageString = imageString.concat("' data-lightbox='")
			imageString=imageString.concat(setname)
			imageString=imageString.concat("' data-title='")
			imageString= imageString.concat(caption)
			imageString =imageString.concat("'><img class='thumbnail' src='")
			imageString = imageString.concat(imagesrc)
			imageString = imageString.concat("'/></a>")
		xmlString = xmlString.concat(imageString)
		}

		xmlString = xmlString.concat(entryEnd)
		

	}
	
	var entriesdiv = document.getElementById("entries") 	
	entriesdiv.innerHTML = xmlString
  }
}
