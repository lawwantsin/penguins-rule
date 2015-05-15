// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

  // Initialize Carousel inside modal.  No autoslide.
  $('.carousel').carousel('pause');

  // Move to next slide
  $('.next').click(function() {
    $('.carousel').carousel('next');
  });

  // Move to previous slide
  $('.prev').click(function() {
    $('.carousel').carousel('prev');
  });

  Pusher.log = function(message) {
    if (window.console && window.console.log) {
      window.console.log(message);
    }
  };

  var pusher = new Pusher('e6e4fd981b1a4f8f3fb8');
  var channel = pusher.subscribe('orders');
  channel.bind('new_order', function(data) {
    console.log(data);
  });

})

angular.module('bevTest', []);

angular.module('bevTest').controller('OrderCtrl', ['$scope', '$http', function($scope, $http) {

  $scope.order = {
    quantity: 1
  };

  $scope.submitForm = function() {

    var responsePromise = $http.post("/orders", $scope.order, {});

    responsePromise.success(function(dataFromServer, status, headers, config) {
      console.log(status);
    });

    responsePromise.error(function(data, status, headers, config) {
      console.log(status);
    });

  }

}]);
