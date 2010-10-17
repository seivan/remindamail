$(function() {
  $('.pagination a').attr('data-remote', 'true');
  
	$("table.list a").click(function(){
		$("section.modal").lightbox_me({
		        overlayCSS: {"background": "black", "opacity": "0.3"},
		        modalCSS: {"top": "100px"},
		        centered: true
			});	
	});
	
});