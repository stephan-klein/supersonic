angular
  .module('pingApp', ['supersonic'])
  .controller('IndexCtrl', ($scope, supersonic) ->
    $scope.pongs = 0
    $scope.ping = ->
      supersonic.ping().then ->
        $scope.pongs++
  )
