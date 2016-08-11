$(document).on('turbolinks:load', function() {
	$('.sign-up-questions').fadeIn(900);
	
	$("#nickname-input").keypress(function(event){
    if(event.keyCode == 13){
      $("#sign-up-continue").click();
    	return false;
    }
	});

	$("#birthday-input").keypress(function(event){
    if(event.keyCode == 13){
      $("#sign-up-continue-2").click();
    	return false;
    }
	});

	$('#sign-up-continue').click(function() {
		$('#nickname-question').fadeOut(function() {
			$('#birthday-question').fadeIn(800);
			if ($('#birthday-input')[0].type != 'date'){
					$('#birthday-input').attr("placeholder", "DD/MM/YYYY");
				}
		});
	});

	$('#sign-up-continue-2').click(function() {
		$('#birthday-question').fadeOut(function() {
			$('#financial-goal-question').fadeIn(800);
		});
	});

});
