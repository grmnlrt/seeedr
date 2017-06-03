$(document).ready(function(){
  var $current, $next, $slides = $("#slideshow .slide");
  function doSlideShow () {
    $current = $slides.filter(".slide.current");
    $next = $current.next(".slide");
    if ($next.length < 1) {
      $next = $slides.first();
    }
    $slides.removeClass("previous");
    $current.addClass("previous").removeClass("current");
    $next.addClass("current");
    window.setTimeout(doSlideShow, 5000);
  }
  window.setTimeout(doSlideShow, 5000);
});
