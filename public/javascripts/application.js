$(function() {
	// Keyboard shortcuts	
	$(document).bind("keypress", function(evt){
		switch(evt.which){
			case 98: $("body").toggleClass("grid");
					break;
		}
	});
	
	
});