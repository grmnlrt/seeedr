$(document).ready(function(){
  $('.exhibition-bids').hide();
  $('.dashboard-cta').click(function(){
    $(this).parents(".exhibition").find('.exhibition-bids').slideToggle();
  });
});
