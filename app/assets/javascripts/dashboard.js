$(document).ready(function(){
  $('.exhibition-bids').show();
  $('.dashboard-cta').click(function(){
    $(this).parents(".exhibition").find('.exhibition-bids').slideToggle();
  });
});
