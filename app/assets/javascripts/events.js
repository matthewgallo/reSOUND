$( document ).ready(function() {
   
   $('.location_search').click(function(){
    var city = $('.user_location').val();
    $.ajax({
      type: "GET",
      url: '/events',
      dataType: 'script',
      data: { user_location: city }
    });
   });

   // var upcoming_events = $('location_api').val();





















});