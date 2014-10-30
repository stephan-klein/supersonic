angular
  .module('ui')
  .controller 'OtherController', ($scope, $q, supersonic) ->

    $scope.hideInitialView = ()->
      supersonic.ui.layers.hideInitial()

    $scope.asModal = (url)->
      v = supersonic.ui.view(url)
      supersonic.ui.modal.show(v, {
        disableAnimation: true
      }).then ()->
        supersonic.logger.log "promise works"
