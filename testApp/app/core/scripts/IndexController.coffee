angular
  .module('core')
  .controller 'IndexController', ($scope, supersonic) ->
    $scope.pongs = 0
    $scope.ping = ->
      supersonic.debug.ping().then ->
        $scope.pongs++

    $scope.pongsWithCallback = 0
    $scope.pingWithCallback = ->
      supersonic.debug.ping {
        onSuccess: ->
          $scope.pongsWithCallback++
      }
