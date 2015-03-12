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




$('.well').on('click', '.eventShow', function(e) {
  e.preventDefault();
   var eventShowPage =  $(this).attr('class');
     $.ajax({
      type: 'GET',
      url: '/events/show/?event=' + eventShowpage,
      success: function(data) {
        $('body').html(data);
      }
     });
  });




});