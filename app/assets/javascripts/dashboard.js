$(document).ready(function(){
  $('.exhibition-bids').hide();
  $('.view-bids').click(function(){
    $(this).parents(".exhibition").find('.exhibition-bids').slideToggle();
  });
});
