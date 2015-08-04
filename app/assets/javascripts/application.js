// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

function getGeoLocation() {
  navigator.geolocation.getCurrentPosition(setGeoCookie);
}

function setGeoCookie(position) {
  var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
  document.cookie = "lat_lng=" + escape(cookie_val);
}

$(function() {
  $("#close-cookies").click(function() {
  	$("#cookie-notice").css("display", "none")
  });

  $("#update-location").click(function() {
    getGeoLocation();
    $(this).addClass("btn-success");
  });

  $('body').bind('beforeunload',function(){
     $("#update-location").removeClass("btn-success");
  });

  $('.view-prefs').on('click', function() {
      $(this).closest(".friend").toggleClass("friend-active");
      $(this).siblings('.friend-food-pref').fadeToggle(200);
  });

  $(".fav-recipe-button").on('click', function() {
      $(".fav-recipes-collage").toggle();

      $(".dietary-prefs").hide();
  });

  $(".diet-button").on('click', function() {
      $(".dietary-prefs").show();

      $(".fav-recipes-collage").hide();
  });

})

