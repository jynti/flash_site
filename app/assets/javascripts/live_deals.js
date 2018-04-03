function LiveDeal(domElements){
  this.deals = domElements.deals;
}

LiveDeal.prototype.init = function(){
  this.sendAjaxForEachDeal();
};

LiveDeal.prototype.sendAjaxForEachDeal = function(){
  $.each(this.deals, function(key, value){
    var id = $(value).data("deal");

    setInterval(function() {
      $.ajax({
        type: "GET",
        url: "/live_deal/" + id
      });
    }, 5000);
  });
};

$(document).ready(function() {
  var deals = $('.deal-buy');

  var domElements = {
    deals: $('.deal-buy')
  }

  var liveDeals = new LiveDeal(domElements);
  liveDeals.init();
});
