$(document).ready(function(){
  $('.exhibition-bids').hide();
  $('.fa-comment').click(function(){
    $(this).parents(".exhibition").find('.exhibition-bids').slideToggle();
  });
});
