$( document ).ready(function() {

// Add the pointer cursor when hovering over About link in the navbar. 
  $('.aboutPage').css('cursor', 'pointer');

// Slow scroll to wrap sections....
  // Scroll to Location Search
  $(".locationWrapper").click(function() {
      $('html, body').animate({
          scrollTop: $("#locationwrap").offset().top
      }, 2000);
      return false;
  });

  // Scroll to Artist Search
  $(".artistWrapper").click(function() {
      $('html, body').animate({
          scrollTop: $("#artistsearchwrap").offset().top
      }, 2000);
      return false;
  });

  // Scroll to Venue Search
  $(".venueWrapper").click(function() {
      $('html, body').animate({
          scrollTop: $("#venuesearchwrap").offset().top
      }, 2000);
      return false;
  });

  // Scroll to Home
  $(".home").click(function() {
      $('html, body').animate({ scrollTop: 0 }, 'slow');
      // return false;
  });

    // Scroll to Home
  $(".resound").click(function() {
     $('html, body').animate({ scrollTop: 0 }, 'slow');
     // return false;
  });


});