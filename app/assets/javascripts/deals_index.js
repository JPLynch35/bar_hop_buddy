$(".deals.index").ready(function() {
  $("#location-image, #button-box, #horizontal-line, #vertical-line").hide();
  window.onload = getLocation();
  let nearby_bars;
  function getLocation() {
    navigator.geolocation.getCurrentPosition(function (position) {
      $.ajax({
        type: 'POST',
        url: "/location",
        data: {long:position.coords.longitude, lat:position.coords.latitude},
        async:false,
      });
      $.ajax({
        dataType: "text",
        url: "deals.json",
        success: function(data) {
          locations = $.parseJSON(data);
          var user_location = locations[0]
          nearby_bars = locations[1]
          document.getElementById('location-text').innerHTML = user_location;
          $("#location-image, #button-box, #horizontal-line, #vertical-line").show();
          if (nearby_bars.length === 0) {
            lastCard();
            $("#dc-message").html('No happy hour deals found in your area.');
            $("#button-box, #horizontal-line, #vertical-line").hide();
          } else {
            cardFlip(nearby_bars);
          };
        }
      });
    }, function (e) {
        alert("Please enable the location feature in your browser.");
    }, {
      enableHighAccuracy: true
    });
  };
  $("#dislike").click(function() {
    $(".bar-card-after").removeClass("instant").addClass("rotate-left");
    $(".bar-card").removeClass("instant").addClass("shift-left");
    setTimeout(function(){
      $(".bar-card").addClass("instant").removeClass("shift-left");
    }, 290);
    setTimeout(function(){
      $(".bar-card-after").addClass("instant").removeClass("rotate-left");
    }, 300);
    $.ajax({
      type: "DELETE",
      url: "/user_bars",
      data: {
        user_bar: {
          bar_id: nearby_bars[0].id
        }
      },
    });
    nearby_bars.shift();
    if (nearby_bars.length === 0) {
      lastCard();
      $("#button-box, #horizontal-line, #vertical-line").hide();
    } else {
      cardFlip(nearby_bars);
    };
  });
  $("#like").click(function() {
    $(".bar-card-after").removeClass("instant").addClass("rotate-right");
    $(".bar-card").removeClass("instant").addClass("shift-right");
    setTimeout(function(){
      $(".bar-card").addClass("instant").removeClass("shift-right");
    }, 290);
    setTimeout(function(){
      $(".bar-card-after").addClass("instant").removeClass("rotate-right");
    }, 300);
    $.post("/user_bars",{user_bar: {bar_id: nearby_bars[0].id}})
    nearby_bars.shift();
    if (nearby_bars.length === 0) {
      lastCard();
      $("#button-box, #horizontal-line, #vertical-line").hide();
    } else {
      cardFlip(nearby_bars);
    };
  });
  function dayName() {
    var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    var d = new Date();
    return days[d.getDay()];
  };
  function cardFlip(nearby_bars) {
    $("#dc-name").html(nearby_bars[0].name);
    $("#dc-address").html(nearby_bars[0].address);
    $("#dc-hours").html("Hours: " + nearby_bars[0].open[dayName()] + " - " + nearby_bars[0].close[dayName()]);
    $("#dc-hh_hours").html("Happy Hour: " + nearby_bars[0].hh_start[dayName()] + " - " + nearby_bars[0].hh_end[dayName()]);
    $("#dc-message").html(nearby_bars[0].message);
    $("#dc-deals1").html(nearby_bars[0].deals[dayName()][0]);
    $("#dc-deals2").html(nearby_bars[0].deals[dayName()][1]);
    $("#dc-deals3").html(nearby_bars[0].deals[dayName()][2]);
    $("#dc-deals4").html(nearby_bars[0].deals[dayName()][3]);
    $("#dc-deals5").html(nearby_bars[0].deals[dayName()][4]);
  };
  function lastCard() {
    $("#dc-name").html('</br>');
    $("#dc-address").html('</br>');
    $("#dc-hours").html('</br>');
    $("#dc-hh_hours").html('</br>');
    $("#dc-deals1").html('</br>');
    $("#dc-deals2").html('</br>');
    $("#dc-deals3").html('</br>');
    $("#dc-deals4").html('</br>');
    $("#dc-deals5").html('</br>');
    $("#dc-message").html('No more happy hour deals found in your area.');
  };
})
