/**
*	Custom Javascript functions
*
*/

$(function($){
	setTimeout(function(){
		window.scrollTo(0, 1);
	}, 100);
	
	
	// $("#new-mail-button").click(function(){
	//     
	//     $("section.modal").lightbox_me({
	//       overlayCSS: {"background": "black", "opacity": "0.3"},
	//       modalCSS: {"top": "100px"},
	//       centered: true,
	//       onLoad: function(){
	//         $("input#from").focus();
	//       }
	//     });
	//     
	//     return false;
	//   });
		
	// Keyboard shortcuts	
	$(document).bind("keypress", function(evt){
		switch(evt.which){
			case 98: $("body").toggleClass("grid");
					break;
		}
	});

});
