// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
function openNav() {
  document.getElementById("mySidenav").style.width = "400px";
  document.getElementById("main").style.marginLeft = "400px";
  // document.getElementById("open-navbar-button").style.marginLeft = "400px";
  // document.getElementById("open-navbar-button").innerHTML = "<"; 
}

//  Set the width of the side navigation to 0 and the left margin of the page content to 0 
function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft = "0";
  // document.getElementById('open-navbar-button').style.marginLeft = "0";
  // document.getElementById("open-navbar-button").innerHTML = ">"; 
}

// $(document).ready(function() {
// 	$('#open-navbar-button').toggle(function() {
// 		$('#mySidenav').width('400px');
// 		$('#main').css({'margin-left':'400px'});
// 		$('#open-navbar-button').css({'margin-left':'400px'});
// 		$('#open-navbar-button').text('<');
// 	});
	
	// $('#open-navbar-button').click(function() {
	// 	$('#mySidenav').width('0');
	// 	$('#main').css({'margin-left':"0"});
	// 	$('#open-navbar-button').css({'margin-left':'0'});
	// 	$('#open-navbar-button').text('>');
	// })
// });