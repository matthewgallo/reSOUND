$( document ).ready(function() {
   
// AJAX REQUESTS FOR INDEX PAGES

   // Grab input of LOCATION search and perform AJAX request
   // Event index via AJAX
   $(document).on("click", ".location_search", function(){
    var city = $('.user_location').val();
      $.ajax({
        type: "GET",
        url: '/events',
        dataType: 'script',
        data: { user_location: city },
        success: function(){
          $('html, body').animate({ scrollTop: 0 }, 'slow').delay(1000);
        }
      });
   });


  // Grab input of ARTIST search and perform AJAX request
  // Artists index via AJAX
  $(document).on("click", ".artist_search", function(){
    var artist = $('.artist_name').val();
      $.ajax({
        type: "GET",
        url: '/artists',
        dataType: 'script',
        data: { artist_name: artist},
        success: function(){
          $('html, body').animate({ scrollTop: 0 }, 'slow').delay(1000);
        }
      });
   });

  // Grab input of VENUE search and perform AJAX request
  // Venues index via AJAX
  $(document).on("click", '.venue_search', function(){
    var venue = $('.venue_name').val();
      $.ajax({
        type: "GET",
        url: '/venues',
        dataType: 'script',
        data: { venue_name: venue },
        success: function(){
          $('html, body').animate({ scrollTop: 0 }, 'slow').delay(1000);
        }
      });
   });


  // About index via AJAX
  $('.aboutPage').click(function(){
    $.ajax({
      type: "GET",
      url: "/about",
      dataType: "script",
      success: function(){
        $('html, body').animate({
          scrollTop: $("#aboutwrap").offset().top
      }, 1000);
        return false;
      }
    });
  });

  

  
// NAV BAR LINKS

  // Location Wrap Navbar Link
  $('.locationWrapper').click(function(){
    console.log("Render location wrap");
     $.ajax({
      type: 'GET',
      url: '/' + "#locationwrap",
      dataType: "script",
      success: function(data) {
        $('html, body').animate({
          scrollTop: $("#locationwrap").offset().top
          }, 2000);
        return false;
        }
      });
    });

  // Artist Wrap Navbar Link
  $('.artistWrapper').click(function(){
    console.log("Render artist wrap");
     $.ajax({
      type: 'GET',
      url: '/' + "#artistsearchwrap",
      dataType: "script",
      success: function(data) {
        $('html, body').animate({
          scrollTop: $("#artistsearchwrap").offset().top
          }, 2000);
        return false;
        }
      });
    });

  // Venue Wrap Navbar Link
  $('.venueWrapper').click(function(){
    console.log("Render venue wrap");
     $.ajax({
      type: 'GET',
      url: '/' + "#venuesearchwrap",
      dataType: "script",
      success: function(data) {
        $('html, body').animate({
          scrollTop: $("#venuesearchwrap").offset().top
          }, 2000);
        return false;
        }
      });
    });





});