angular
  .module('ui')
  .controller 'LayersController', ($scope, $q, supersonic) ->


    $scope.navigateTo = (url)->
      v = supersonic.ui.view(url, "myView")
      supersonic.ui.layer.push(v).then ()->
        supersonic.logger.log "promise works"

    $scope.pop = ()->
      supersonic.ui.layer.pop().then ()->
        supersonic.logger.log "promise works"

    $scope.popAll = ()->
      supersonic.ui.layer.popAll().then ()->
        supersonic.logger.log "promise works"
