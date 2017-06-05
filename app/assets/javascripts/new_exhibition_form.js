$(document).ready(function(){
  $("#form .btn-primary-bis").css( "opacity", "0" );
  $('#select-artwork .artwork-sample').click(function(){
    $("#form .btn-primary-bis").fadeTo( "slow" , 1);
  })

  $("#form-end .duration-input label").click(function(){
    $("#form-end .duration-input label").removeClass("duration-selected");
    $(this).addClass("duration-selected");
  });
});
