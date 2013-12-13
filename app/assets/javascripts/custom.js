$(document).ready(function() {
	//$('#attachform').slideUp();
	//$('#galleryform').slideUp();
	$('#showimage').hide();
	
});

$(function() {
	
	// handle attach file on shop page
	$('#attachtitle').click(function() {
		if ($('#attachform').is(':hidden') == true){
			$('#attachform').slideDown();
		}
		else{
			$('#attachform').slideUp();
		}
			
	});
	
	// handle gallery on shop page
	$('#gallerytitle').click(function() {
		if ($('#galleryform').is(':hidden') == true){
			$('#galleryform').slideDown();
			
		}
		else{
			$('#galleryform').slideUp();
			$('#showimage').slideUp();
		}	
	});
	
	// handle image show
	$('#imageitem li').click(function() {
		$('#showimage').slideDown();
		$('#imagetitle').text($(this).prop('title'));
		$('#imagedescription').text($(this).text());
		$('#imagecontent').prop("src", $(this).find('img').prop('src'));
		
	});
	
});

