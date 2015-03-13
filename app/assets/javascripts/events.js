$( document ).ready(function() {
   

   // Grab input of location search and perform AJAX request
   // Event index via AJAX
   $('.location_search').click(function(){
    var city = $('.user_location').val();
    $.ajax({
      type: "GET",
      url: '/events',
      dataType: 'script',
      data: { user_location: city }
    });
   });


  // Grab input of artist search and perform AJAX request
  // Artists index via AJAX
  $('.artist_search').click(function(){
    var artist = $('.artist_name').val();
    $.ajax({
      type: "GET",
      url: '/artists',
      dataType: 'script',
      data: { artist_name: artist }
    });
   });

  // Grab input of venue search and perform AJAX request
  // Venues index via AJAX
  $('.venue_search').click(function(){
    var venue = $('.venue_name').val();
    $.ajax({
      type: "GET",
      url: '/venues',
      dataType: 'script',
      data: { venue_name: venue }
    });
   });




// Upcoming events show page AJAX request
$('.well').on('click', '.eventshow', function() {
   var eventShowPage =  $(this).attr('class');
     $.ajax({
      type: 'GET',
      url: '/events/show/?event=' + eventShowpage,
      // data: $(this).id,
      success: function(data) {
        $('body').html(data);
      }
     });
  });




});