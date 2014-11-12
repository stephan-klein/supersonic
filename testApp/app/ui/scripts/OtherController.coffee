angular
  .module('ui')
  .controller 'OtherController', ($scope, $q, supersonic) ->

    $scope.showInitialView = ()->
      supersonic.ui.initialView.show()

    $scope.asModal = (url)->
      v = new supersonic.ui.View(url)
      supersonic.ui.modal.show(v, {
        disableAnimation: true
      }).then ()->
        supersonic.logger.log "Modal shown"

    $scope.asModalWithCallback = (url)->
      v = supersonic.ui.view(url)
      supersonic.ui.modal.show v,
        onSuccess: -> 
          supersonic.logger.log "Modal shown with this callback"
        onFailure: ->
          supersonic.logger.log "Modal could not be shown"
