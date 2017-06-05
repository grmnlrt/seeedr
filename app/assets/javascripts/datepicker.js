$(document).ready(function(){
  $('#datetimepicker1').datetimepicker({
    format: "YYYY/MM/DD"
  })

  var startDate;
  var duration;


  $("#datetimepicker1").on('dp.change', function(){
    inputDate = $("#datetimepicker1").val();
    inputDuration = $("#exhibition_duration").val();
    startDate = new Date(inputDate);
    duration = parseInt(inputDuration);
    if ( ( inputDate != "" ) && ( inputDuration != "") ) {
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
      var min_price = businessDays * 50;
      $("#exhibition_min_price").val(min_price)
    }
  })


  $("#exhibition_duration").change(function(){
    inputDate = $("#datetimepicker1").val();
    inputDuration = $("#exhibition_duration").val();
    startDate = new Date(inputDate);
    duration = parseInt(inputDuration);
    if ( ( inputDate != "" ) && ( inputDuration != "") ) {
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
      var min_price = businessDays * 50;
      $("#exhibition_min_price").val(min_price)
    }


  })
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
