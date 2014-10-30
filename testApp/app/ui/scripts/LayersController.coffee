angular
  .module('ui')
  .controller 'LayersController', ($scope, $q, supersonic) ->


    $scope.navigateTo = (url)->
      v = supersonic.ui.view(url, "myView")
      supersonic.ui.layers.push(v).then ()->
        supersonic.logger.log "promise works"

    $scope.pop = ()->
      supersonic.ui.layers.pop().then ()->
        supersonic.logger.log "promise works"

    $scope.popAll = ()->
      supersonic.ui.layers.popAll().then ()->
        supersonic.logger.log "promise works"
