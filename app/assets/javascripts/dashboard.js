$(document).ready(function(){
  $('.exhibition-bids').hide();
  $('.btn-new-small').click(function(){
    $(this).parents(".exhibition").find('.exhibition-bids').slideToggle();
  });
});
