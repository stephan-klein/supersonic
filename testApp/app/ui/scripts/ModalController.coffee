angular
  .module('ui')
  .controller 'ModalController', ($scope, $q, supersonic) ->

    $scope.hideModal = ()->
      supersonic.ui.modal.hide()
