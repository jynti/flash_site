$(document).ready(function() {
    var deals = $('.deal-buy');

    $.each(deals, function(key, value){
      var id = $(value).data("deal");

      setInterval(function() {
        $.ajax({
          type: "GET",
          url: "/live_deal/" + id
        });
      }, 5000);
    })

});
