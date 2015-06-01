function processingRoutine() {
	var swipedElement = document.getElementById(triggerElementID);
	if ( swipeDirection == 'left' ) {
		newphoto(-1)
	} else if ( swipeDirection == 'right' ) {
		newphoto(1)	}
}