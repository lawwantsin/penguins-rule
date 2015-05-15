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

})

angular.module('bevTest', []);

// angular.module('bevTest').controller('OrderCarouselCtrl', ['$scope', function($scope) {
//
// }]);
//
// angular.module('bevTest').controller('OrderModalCtrl', ['$scope', '$modal', function ($scope, $modal) {
//
//   $scope.openModal = function() {
//     $modal.open({
//       controller: 'ModalInstanceCtrl'
//     })
//   }
//
// }]);
//
// angular.module('bevTest').controller('ModalInstanceCtrl', ['$scope', '$modal', function ($scope, $modalInstance) {
//
//   $scope.closeModal = function() {
//     $modalInstance.close();
//   }
//
// }]);
