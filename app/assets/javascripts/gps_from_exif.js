function ConvertDMSToDD(degrees, minutes, seconds, direction) {
  var dd = degrees + minutes/60 + seconds/(60*60);

  if (direction == "S" || direction == "W") {
    dd = dd * -1;
  } // Don't do anything for N or E
  return dd;
}

$(document).ready(function(){
  $('#submit_new_poi input').attr("disabled", "disabled");
  $('#poi_photo').bind('fileuploaddone', function(e, data) {
    $('#submit_new_poi input').attr("disabled", "disabled");
    $('#map-exif img').removeClass('hidden');
    var url = data.result.url;

    $('#photo-exif-gps').attr('src', url);
    $('#photo-exif-gps').load(function(){
      var img = document.getElementById("photo-exif-gps");
      EXIF.getData(img, function() {
        var lngRef = EXIF.getTag(this, "GPSLongitudeRef");
        var lngDMS = EXIF.getTag(this, "GPSLongitude");

        var latRef = EXIF.getTag(this, "GPSLatitudeRef");
        var latDMS = EXIF.getTag(this, "GPSLatitude");

        var lat = ConvertDMSToDD(latDMS[0], latDMS[1], latDMS[2], latRef)
        var lng = ConvertDMSToDD(lngDMS[0], lngDMS[1], lngDMS[2], lngRef)

        var latLng = lat + ',' + lng;

        $('#poi_latitude').val(lat);
        $('#poi_longitude').val(lng);

        src_img = "https://maps.googleapis.com/maps/api/staticmap?center=" + latLng + "&zoom&size=600x300&maptype=roadmap&markers=color:red%7C" + latLng + "&key=AIzaSyDgrqU48uio8RIG4YFuVbek8I0TKrRowQY"
        $img = $('<img>').attr('src', src_img).attr('id', 'map-preview');
        $('#map-exif').html($img);

        $('#submit_new_poi input').removeAttr("disabled");
      });
    });
  });
});
