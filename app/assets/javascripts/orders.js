// All javascript logic lives in this file.

// jQuery onLoad.
$(document).ready(function() {

  // Initialize Carousel inside modal.  No autoslide.
  $('.carousel').carousel('pause');

  // Simple validtion for the presence of input on blur.
  $('input[type=text]').blur(function(e) {
    var input = $(e.target);
    if (empty(input)) invalidateField(input);
    else revalidateField(input);
  });

  // On Enter press in an input.
  $('input[type=text]').keypress(function(e) {
    if (e.keyCode == 13) {
      var step = $(e.target).closest('.item');
      nextSlide(step);
      return false;
    }
  });

  // On Next button click.
  $('.next').click(function(e) {
    var step = $(e.target).closest('.item');
    nextSlide(step);
  });

  // Helper function for clicks and keypresses.
  var nextSlide = function(step) {
    if (valid(step)) {
      $('.carousel').carousel('next');
      $('.carousel').on('slid.bs.carousel', function (e) {
        var nextStep = step.next();
        nextStep.find('input[type=text]:first').focus();
      });
    }
    else {
      step.find('.invalid').first().focus();
    }
  }

  // Validation: Check to see if it's empty.
  var empty = function(input) {
    return ($.trim($(input).val()) == '') ? true : false;
  }

  // Validate a whole step.
  var valid = function(step) {
    var allFields = step.find('input[type=text]');
    var invalidFields = 0;
    allFields.each(function(i, field) {
      if (empty(field)) {
        invalidateField(field);
        invalidFields++;
      }
      else {
        revalidateField(field);
      }
    });
    return (invalidFields == 0 ? true : false);
  }

  // Helper functions
  var invalidateField = function(input) {
    input = $(input);
    input.addClass('invalid');
    input.siblings('label.error').show();
  }

  var revalidateField = function(input) {
    input = $(input);
    input.removeClass('invalid');
    input.siblings('label.error').hide();
  }

  // Move to previous slide
  $('.prev').click(function() {
    $('.carousel').carousel('prev');
  });

  // Just to see it working.
  Pusher.log = function(message) {
    if (window.console && window.console.log) {
      window.console.log(message);
    }
  };

  // Subscribe to new orders.
  var pusher = new Pusher('e6e4fd981b1a4f8f3fb8');
  var channel = pusher.subscribe('orders');
  channel.bind('new_order', function(data) {
    setTimeout(function() {
      addNewOrder(data);
    }, 1000);
  });

  // Clouds animation
  $('.cloud-panel').addClass('breeze');
})

// Quickly jQuery Compile an Egg from push data and an Angular Template.
var addNewOrder = function(data) {
  var html = $('#newOrder').html();
  html = html.replace('{{ created_at }}', $.timeago(data.created_at));
  html = html.replace('{{ quantity }}', data.quantity);
  html = html.replace('{{ first_name }}', data.first_name);
  html = html.replace('{{ shipping_city }}', data.shipping_city);
  html = html.replace('{{ shipping_country }}', data.shipping_country);
  $('.egg-holder').prepend(html);
  if ($('.egg').length > 20) $('.egg-holder').remove('.egg:last');
}

// Instantiate Angular App
angular.module('bevTest', []);

// Controller for the order model and form.
angular.module('bevTest').controller('OrderCtrl', ['$scope', '$http', function($scope, $http) {

  // Default values for color quanities.
  $scope.order = {
    quantity_black: 6,
    quantity_blue: 0,
    quantity_red: 0,
    quantity_green: 0
  };

  // Dynamic price calculation.
  $scope.totalPrice = function() {
    return ($scope.quantity() * window.price);
  }

  // All colors added together for easy calculation.
  $scope.quantity = function() {
    return parseInt($scope.order.quantity_red || 0) +
           parseInt($scope.order.quantity_green || 0) +
           parseInt($scope.order.quantity_blue || 0) +
           parseInt($scope.order.quantity_black || 0);
  }

  // Simple form submission via Angular $http.
  $scope.submitForm = function() {

    var responsePromise = $http.post("/orders", $scope.order, {});

    responsePromise.success(function(dataFromServer, status, headers, config) {
      $('#orderModal').modal('hide');
    });

    responsePromise.error(function(data, status, headers, config) {
      console.log("Server Error");
    });

  }

}]);
