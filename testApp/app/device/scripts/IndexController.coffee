angular
  .module('device')
  .controller 'IndexController', ($scope) ->
    $scope.watchPosition = undefined

    $scope.watchPositionTests = [
      {
        title: "Watch position"
      }
    ]

    $scope.testWatchPosition = (options) ->
      supersonic.device.geolocation.watchPosition().onValue (position) ->
        $scope.watchPosition = position.timestamp

    $scope.latestPosition = undefined

    $scope.getPositionTests = [
      {
        title: "Get latest position"
      }
    ]

    $scope.testGetPosition = (options) ->
      supersonic.device.geolocation.getPosition().then (position) ->
        $scope.latestPosition = position.timestamp

 