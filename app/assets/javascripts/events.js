$( document ).ready(function() {
   
// AJAX REQUESTS FOR INDEX PAGES

   // Grab input of LOCATION search and perform AJAX request
   // Event index via AJAX
   $('.location_search').click(function(){
    var city = $('.user_location').val();
      $.ajax({
        type: "GET",
        url: '/events',
        dataType: 'script',
        data: { user_location: city },
        success: function(){
          $('html, body').animate({ scrollTop: 0 }, 'slow');
        }
      });
   });
  

  // Grab input of ARTIST search and perform AJAX request
  // Artists index via AJAX
  $('.artist_search').click(function(){
    var artist = $('.artist_name').val();
      $.ajax({
        type: "GET",
        url: '/artists',
        dataType: 'script',
        data: { artist_name: artist },
        success: function(){
          $('html, body').animate({ scrollTop: 0 }, 'slow');
        }
      });
   });

  // Grab input of VENUE search and perform AJAX request
  // Venues index via AJAX
  $('.venue_search').click(function(){
    var venue = $('.venue_name').val();
      $.ajax({
        type: "GET",
        url: '/venues',
        dataType: 'script',
        data: { venue_name: venue },
        success: function(){
          $('html, body').animate({ scrollTop: 0 }, 'slow');
        }
      });
   });


  // About index via AJAX
  $('.aboutPage').click(function(){
    $.ajax({
      type: "GET",
      url: "/about",
      dataType: "script"
    });

  });
// AJAX REQUESTS FOR SHOW PAGES
  

  // $("#eventList ")

  // Upcoming LOCATION events show page AJAX request
  // $('.well').on('click', '.eventshow', function() {
  //    var eventShowPage =  $(this).attr('class');
  //      $.ajax({
  //       type: 'GET',
  //       url: '/events/show/?event=' + eventShowpage,
  //       success: function(data) {
  //         $('body').html(data);
  //       }
  //      });
  //   });

});