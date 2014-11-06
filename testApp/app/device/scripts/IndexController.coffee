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
        $scope.$apply ->
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

    $scope.watchHeading = undefined

    $scope.watchHeadingTests = [
      {
        title: "Watch heading with no params"
      }
      {
        title: "Watch heading with frequency param"
        options:
          frequency: 200
      }
      {
        title: "Watch heading with filter param"
        options:
          frequency: 200
          filter: 5
      }
    ]

    $scope.testWatchHeading = (options) ->
      supersonic.device.compass.watchHeading(options).onValue (heading) ->
        $scope.$apply ->
          $scope.watchHeading = heading.timestamp

    $scope.latestHeading = undefined

    $scope.getHeadingTests = [
      {
        title: "Get latest heading"
      }
    ]

    $scope.testGetHeading = (options) ->
      supersonic.device.compass.getHeading().then (heading) ->
        $scope.latestHeading = heading.timestamp

    $scope.platformName = undefined
    $scope.platformVersion = undefined

    $scope.platformTests = [
      {
        title: "Get platform name and version and device's model"
      }
    ]

    $scope.testPlatform = () ->
      supersonic.device.platform().then (platform) ->
        $scope.platformName = platform.name
        $scope.platformVersion = platform.version
        $scope.platformModel = platform.model

    $scope.vibrations = 0

    $scope.vibrateTests = [
      {
        title: "Vibrate"
      }
    ]

    $scope.testVibrate = () ->
      supersonic.device.vibrate().then ->
        $scope.vibrations++

    $scope.deviceReady = ->
      supersonic.device.ready.then ->
        alert "Yep."
      , ->
        alert "Nope."
