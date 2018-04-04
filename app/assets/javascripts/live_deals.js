function LiveDeal(domElements){
  this.deals = domElements.deals;
}

LiveDeal.prototype.init = function(){
  this.sendAjaxForEachDeal();
};

LiveDeal.prototype.sendAjaxForEachDeal = function(){
  setInterval(function() {
    $.ajax({
      type: "GET",
      url: "/live_deal"
    });
  }, 10000);
};

$(document).ready(function() {
  var domElements = {
    deals: $('.deal-buy')
  }

  var liveDeals = new LiveDeal(domElements);
  liveDeals.init();
});
