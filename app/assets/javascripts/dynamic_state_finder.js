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
        _this.states_dropdown.append()
        for(var i = 0; data.length; i++){
          // $('<option>').val(data)
        }
      }
    });
  });
}
