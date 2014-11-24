angular
  .module('ui')
  .controller 'ModalAPIController', ($scope, $q, supersonic) ->

    $scope.showInitialView = ()->
      supersonic.ui.initialView.show()

    $scope.asModal = (url)->
      v = new supersonic.ui.View(url)
      supersonic.ui.modal.show(v, {
        animate: true
      }).then ()->
        supersonic.logger.log "Modal shown"

    $scope.asModalWithoutAnimation = (url)->
      v = new supersonic.ui.View(url)
      supersonic.ui.modal.show(v, {
        animate: false
      }).then ()->
        supersonic.logger.log "Modal shown"

    $scope.asModalWithCallback = (url)->
      v = new supersonic.ui.View(url)
      supersonic.ui.modal.show v,
        onSuccess: -> 
          supersonic.logger.log "Modal shown with this callback"
        onFailure: ->
          supersonic.logger.log "Modal could not be shown"
