$(function() {
	// Keyboard shortcuts	
	$(document).bind("keypress", function(evt){
		switch(evt.which){
			case 98: $("body").toggleClass("grid");
					break;
		}
	});
	
	$("table.list a").click(function(){
		$("section.modal").lightbox_me({
		        overlayCSS: {"background": "black", "opacity": "0.3"},
		        modalCSS: {"top": "100px"},
		        centered: true
			});	
	});
	
});