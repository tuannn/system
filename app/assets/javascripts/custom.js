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
	
	// for user data grid
	$.ajax({
    		type : 'get',
    		url : "/users/",
    		dataType : 'json',
    		success : function(response) {
    			var obj = {};
    			obj.width = 600;
    			obj.flexHeight = true;
    			obj.title = "Users list";
    			obj.bottomVisible = true;
    			obj.selectionModel = { mode: 'single' };
    			obj.editable = false;
    			obj.columnBorders = true;
    			obj.scrollModel = { horizontal: false };
    			obj.colModel = [
        						{title:"Email", width:200, dataType:"string", dataIndx: "email"},
        						{title:"Roles", width:150, dataType:"string", dataIndx: "role"}
        						];
    			obj.dataModel = {
    				location: 'local',
    				sorting: "local",
    				paging: "local",
    				dataType: "JSON",
    				data:response
    				};
    				
    			$("#grid_user").pqGrid(obj); 
    		}	
    	});
    	 
    // end data grid
    
    // handle for checking email is exited?
    $('#signupform #user_email').keyup(function() {
    	$email = $(this);
    	$.ajax({
    		type : 'get',
    		url : "/users/findemail",
    		data : "email=" + $email.val(),    
    		dataType : 'json',
    		success : function(response) {
    			var count=0;
    			$('#autoresult p').text("");
    			$.each(response, function(userIndex, user) {
    					$('#autoresult p').append(user['email'] + "<br>");
    					count+=1;
    				});
    				
    			if(count == 0){
    				$('#autoresult p').text("Email co the su dung");
    			}
    			else{
    				$('#autoresult p').text("Email da ton tai");
    			}    			
    		}	
    	});
    	
    	    	
    });
    // end of handle check email is existed?
	
});

