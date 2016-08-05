$(document).ready(function() {
	$('#goal-submit').click(function() {
		$('#start-background').addClass('blur-background');
		$('#goal-question').fadeOut();
		$('#goal-go').fadeOut();
		$('#sign-in-link').fadeOut();
		$('#sign-in-form').hide();
		$('#box').fadeIn(800);
		$('#sign-up-form').fadeIn(700);	
	});	

	$('#sign-in-link').click(function() {
		$('#start-background').addClass('blur-background');
		$('#goal-question').fadeOut();
		$('#goal-go').fadeOut();
		$('#sign-in-link').fadeOut();
		$('#sign-up-form').hide();
		$('#box').fadeIn(800);
		$('#sign-in-form').fadeIn(700);	
	});

	$('#sign-up-email').click(function() {
		$('#box').fadeOut(200);
		$('#box').fadeOut(function() {
			$('#sign-in-form').hide();
			$('#box').fadeIn(800);
			$('#sign-up-form').fadeIn(700);
		});
	});

	$('#sign-in-email').click(function() {
		$('#box').fadeOut(200);
		$('#box').fadeOut(function() {
			$('#sign-up-form').hide();
			$('#box').fadeIn(800);
			$('#sign-in-form').fadeIn(700);
		});
	});

	$('.blur-background').click(function() {
		$('#box').fadeOut(function(){
			$('#start-background').removeClass('blur-background');			
		});
	});
});