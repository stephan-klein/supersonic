angular
  .module('supersonic')
  .controller 'IndexController', ($scope, supersonic) ->
    $scope.pongs = 0
    $scope.ping = ->
      supersonic.debug.ping().then ->
        $scope.pongs++
