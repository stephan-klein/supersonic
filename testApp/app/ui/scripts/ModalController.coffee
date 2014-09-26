angular
  .module('ui')
  .controller 'ModalController', ($scope, $q, supersonic) ->

    $scope.hideModal = ()->
      supersonic.ui.modal.hide()

    $scope.hideAllModals = ()->
      supersonic.ui.modal.hideAll().then ()->
        supersonic.logger.log "promise works"
