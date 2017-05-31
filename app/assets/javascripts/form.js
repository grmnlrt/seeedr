$(document).ready(function(){
  $("#registration-form").hide();
  $("#user_is_company_false").click(function(){
    $("#registration-form").slideUp();
    $(".user_company_name").hide();
    $(".user_first_name, .user_last_name").show();
    $("#registration-form").slideDown();
  });
  $("#user_is_company_true").click(function(){
    $("#registration-form").slideUp();
    $(".user_first_name, .user_last_name").hide();
    $(".user_company_name").show();
    $("#registration-form").slideDown();
  });
});
