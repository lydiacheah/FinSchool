$(document).ready(function() {
	$('.sign-up-questions').fadeIn(900);

	$('#sign-up-continue').click(function() {
		$('#nickname-question').fadeOut(function() {
			$('#birthday-question').fadeIn(800);
		});
	})
});