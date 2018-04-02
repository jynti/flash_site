//= require payment_handler.js

$(document).ready(function(){
  var domElements = {
    form: $('#payment-form')
  };

  var payment_handler = new PaymentHandler(domElements);
  payment_handler.init();
});
