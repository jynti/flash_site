//= require dynamic_state_finder.js

$(document).ready(function(){
  var domElements = {
    state: $('#address_state_id'),
    country: $('#address_country_id')
  };

  var dynamicStateFinder = new DynamicStateFinder(domElements);
  dynamicStateFinder.init();
});
