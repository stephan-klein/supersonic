angular
  .module('device')
  .controller 'IndexController', ($scope, supersonic) ->

    $scope.watchPosition = undefined

    $scope.watchPositionTests = [
      {
        title: "Watch position"
      }
    ]

    $scope.testWatchPosition = (options) ->
      supersonic.device.geolocation.watchPosition().onValue (position) ->
        $scope.$apply ->
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

    $scope.watchAcceleration = undefined

    $scope.watchAccelerationTests = [
      {
        title: "Watch acceleration"
      }
    ]

    $scope.testWatchAcceleration = (options) ->
      supersonic.device.accelerometer.watchAcceleration().onValue (acceleration) ->
        $scope.watchAcceleration = acceleration.timestamp

    $scope.latestAcceleration = undefined

    $scope.getAccelerationTests = [
      {
        title: "Get latest acceleration"
      }
    ]

    $scope.testGetAcceleration = (options) ->
      supersonic.device.accelerometer.getAcceleration().then (acceleration) ->
        $scope.latestAcceleration = acceleration.timestamp

 