$(document).ready(function() {
  var exhibition_address = $('#exhibition_address').get(0);

  if (exhibition_address) {
    var autocomplete = new google.maps.places.Autocomplete(exhibition_address, { types: ['geocode'] });
    google.maps.event.addDomListener(flat_address, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});
