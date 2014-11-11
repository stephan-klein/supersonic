angular
  .module('ui')
  .controller 'ModalController', ($scope, $q, supersonic) ->

    $scope.hideModal = ()->
      supersonic.ui.modal.hide().then ->
        supersonic.logger.log "Modal is hidden"

    $scope.hideAllModals = ()->
      supersonic.ui.modal.hideAll().then ()->
        supersonic.logger.log "All the modals are hidden"

    $scope.hideModalWithCallback = ->
      supersonic.ui.modal.hide
        onSuccess: -> 
          supersonic.logger.log "Modal hidden with this callback"
        onFailure: ->
          supersonic.logger.log "Modal could not be hidden"

    $scope.hideAllModalsWithCallback = ->
      supersonic.ui.modal.hideAll
        onSuccess: -> 
          supersonic.logger.log "All the modals are hidden with this callback"
        onFailure: ->
          supersonic.logger.log "Modal could not be hidden"

