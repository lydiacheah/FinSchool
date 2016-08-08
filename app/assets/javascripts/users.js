$(document).ready(function() {
	$('.sign-up-questions').fadeIn(900);
	
	$("#edit-user-form").on('keyup keypress', function(e) {
	  var keyCode = e.keyCode || e.which;
	  if (keyCode === 13) { 
	    e.preventDefault();
	    return false;
	  }
	});

	$("#nickname-input").keyup(function(event){
    if(event.keyCode == 13){
    	event.preventDefault();
      $("#sign-up-continue").click();
    }
	});

	$('#sign-up-continue').click(function() {
		$('#nickname-question').fadeOut(function() {
			$('#birthday-question').fadeIn(800);
		});
	});

});
