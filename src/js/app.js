App = {
  web3Provider: null,
  contracts: {},

  init: async function() {
   console.log("Hello raghav!");
   $("#before-load").show();
   $("#after-load").hide();
    
    var ret = await App.initWeb3();
    
    $("#before-load").hide();
    $("#after-load").show();
    
    return ret;

  },

  initWeb3: async function() {
    
    
    return App.initContract();
  },

  initContract: function() {
    /*
     * Replace me...
     */

    return App.bindEvents();
  },

  bindEvents: function() {
    $(document).on('click', '.btn-adopt', App.handleAdopt);
  },

  markAdopted: function(adopters, account) {
    /*
     * Replace me...
     */
  },

  handleAdopt: function(event) {
    event.preventDefault();

    var petId = parseInt($(event.target).data('id'));

    /*
     * Replace me...
     */
  }

};

$(function() {
  $(window).load(function() {
    App.init();
  });
});
