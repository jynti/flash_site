function DynamicStateFinder(domElements){
  this.states_dropdown = domElements.state;
  this.country_dropdown = domElements.country;
}

DynamicStateFinder.prototype.init = function(){
  this.onFindStates();
};

DynamicStateFinder.prototype.onFindStates = function(){
  var _this = this;
  this.country_dropdown.on("change", function(event){
    var country_id = $(this).val();
    $.ajax({
      type: 'GET',
      url: '/countries/' + country_id + '/states',
      success: function(data){
        for(var i = 0; i < data.length; i++){
          $('<option />', { value: data[i].id, text: data[i].name }).appendTo(_this.states_dropdown);
        }
      }
    });
  });
}
