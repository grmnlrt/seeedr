$(document).ready(function(){
  $('#fake-stripe-button').click(function(e){
    $('.stripe-button-el').trigger(e)
  });
});
