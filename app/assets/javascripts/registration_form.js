$(document).ready(function(){
  $("#registration-form").hide();
  $('#account-selector > span > label').addClass('account-before-choice');

  $("#user_is_company_false").click(function(){
    $('#account-selector > span > label').removeClass();
    $("#login-title").slideUp();

    $("#registration-form").fadeTo("fast", 0).promise().done(function(){
      $(".user_company_name").hide();
      $(".user_first_name, .user_last_name").show();
      $('#facebook-connect').show();
      $("#registration-form").fadeTo("fast", 1);
    })

    $("#new_user").addClass('show-login-form');
  });

  $("#user_is_company_true").click(function(){
    $('#account-selector > span > label').removeClass();
    $("#login-title").slideUp();

    $("#registration-form").fadeTo("fast", 0).promise().done(function(){
      $('#facebook-connect').hide();
      $(".user_first_name, .user_last_name").hide();
      $(".user_company_name").show();
      $("#registration-form").fadeTo("fast", 1);
    })

    $("#new_user").addClass('show-login-form');
  });

    $('#account-selector > span > label').click(function(){
      $('#account-selector > span > label').removeClass('account-select');
      $(this).addClass('account-select');
    });
});
