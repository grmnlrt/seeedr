$(document).ready(function(){
  $('#carrousel li').hide();
  $('#carrousel li').first().show();

  window.setInterval(function(){
    var visibleSlide = $('#carrousel li:visible');
    var lastSlide = $('#carrousel li').last();
    if (visibleSlide.html() === lastSlide.html()) {
      visibleSlide.hide();
      $('#carrousel li').first().show();
    } else {
      visibleSlide.hide();
      visibleSlide.next('li').show();
    }
  }, 5000);
});
