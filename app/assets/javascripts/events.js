$( document ).ready(function() {
   $('').click(function(){

    var city = $('.location_search').val();
    $.ajax({
      type: "GET",
      url: '/events',
      dataType: 'script',
      data: { location: city }
    });

   });
});