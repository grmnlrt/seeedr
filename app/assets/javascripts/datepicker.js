$(document).ready(function(){
  $('#datetimepicker1').datetimepicker({
    format: "YYYY/MM/DD"
  })

  // var startDate;
  // var duration;



  $("#datetimepicker1").on('dp.change', function(){
    var inputDate = $("#datetimepicker1").val();
    var inputDuration = $('.duration-selected').find('input').val();
    var inputPack = $('.pack-selected').find('input').val();
    var startDate = new Date(inputDate);
    var duration = parseInt(inputDuration);
    var pack = parseInt(inputPack);
    if ( ( inputDate != "" ) && ( inputDuration != "") && ( inputPack != "") ) {
      var endDate = new Date(inputDate)
      // $.post( "/exhibition-price", { start_date: startDate, duration: duration } );
      if ((startDate.getMonth() + duration) < 12) {
        var endDate = new Date(endDate.setMonth(startDate.getMonth() + duration));
      }
      else {
        var endDate = new Date(endDate.setMonth(startDate.getMonth() - 12 + duration));
        endDate = new Date(endDate.setYear(endDate.getFullYear() + 1));
      }
      var businessDays = calcBusinessDays(startDate, endDate);
      var min_price = businessDays * pack;
      $("#exhibition_min_price").text(min_price);
      var price = $("#exhibition_min_price").text();
      $('input[name="selected_price"]').val(price);
    }
  });


  $(".exhibition_duration .duration-input label").change(function(){
    var inputDate = $("#datetimepicker1").val();
    var inputDuration = $('.duration-selected').find('input').val();
    var inputPack = $('.pack-selected').find('input').val();
    var startDate = new Date(inputDate);
    var duration = parseInt(inputDuration);
    var pack = parseInt(inputPack);
    if ( ( inputDate != "" ) && ( inputDuration != "") && ( inputPack != "") ) {
      var endDate = new Date(inputDate)
      // $.post( "/exhibition-price", { start_date: startDate, duration: duration } );
      if ((startDate.getMonth() + duration) < 12) {
        var endDate = new Date(endDate.setMonth(startDate.getMonth() + duration));
      }
      else {
        endDate = new Date(endDate.setMonth(startDate.getMonth() - 12 + duration));
        endDate = new Date(endDate.setYear(endDate.getFullYear() + 1));
      }
      var businessDays = calcBusinessDays(startDate, endDate);
      var min_price = businessDays * pack ;
      $("#exhibition_min_price").text(min_price);
      var price = $("#exhibition_min_price").text();
      $('input[name="selected_price"]').val(price);
    }
  });

  $(".exhibition_pack .pack-input label").change(function(){
    var inputDate = $("#datetimepicker1").val();
    var inputDuration = $('.duration-selected').find('input').val();
    var inputPack = $('.pack-selected').find('input').val();
    var startDate = new Date(inputDate);
    var duration = parseInt(inputDuration);
    var pack = parseInt(inputPack);
    if ( ( inputDate != "" ) && ( inputDuration != "") && ( inputPack != "") ) {
      var endDate = new Date(inputDate)
      // $.post( "/exhibition-price", { start_date: startDate, duration: duration } );
      if ((startDate.getMonth() + duration) < 12) {
        var endDate = new Date(endDate.setMonth(startDate.getMonth() + duration));
      }
      else {
        endDate = new Date(endDate.setMonth(startDate.getMonth() - 12 + duration));
        endDate = new Date(endDate.setYear(endDate.getFullYear() + 1));
      }
      var businessDays = calcBusinessDays(startDate, endDate);
      var min_price = businessDays * pack ;
      $("#exhibition_min_price").text(min_price);
      var price = $("#exhibition_min_price").text();
      $('input[name="selected_price"]').val(price);
    }
  });


  function calcBusinessDays(startDate, endDate){
    var weeks, dateDiff, adjust = 0
    var weekDay1 = startDate.getDay();
    var weekDay2 = endDate.getDay();
    weekDay1 = (weekDay1 == 0) ? 7 : weekDay1;
    weekDay2 = (weekDay2 == 0) ? 7 : weekDay2;
    if ((weekDay1 > 5) && (weekDay2 > 5)) {
      adjust = 1;
    }
    weekDay1 = (weekDay1 > 5) ? 5 : weekDay1;
    weekDay2 = (weekDay2 > 5) ? 5 : weekDay2;
    weeks = Math.floor((endDate.getTime() - startDate.getTime()) / 604800000)

    if (weekDay1 <= weekDay2) {
      dateDiff = (weeks * 5) + (weekDay2 - weekDay1)
    } else {
      dateDiff = ((weeks + 1) * 5) - (weekDay1- weekDay2)
    }
    dateDiff -= adjust
    return (dateDiff + 1);
  };
});
