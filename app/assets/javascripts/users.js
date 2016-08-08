$(document).ready(function() {
	$('.sign-up-questions').fadeIn(900);

	$("#nickname-input").keypress(function(event){
    if(event.keyCode == 13){
      $("#sign-up-continue").click();
    	return false;
    }
	});

	$('#sign-up-continue').click(function() {
		$('#nickname-question').fadeOut(function() {
			$('#birthday-question').fadeIn(800);
		});
	});

});
