angular
  .module('device')
  .controller 'IndexController', ($scope, $timeout, supersonic) ->

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

    $scope.testWatchPositionWithCallback = ->
      supersonic.device.geolocation.watchPosition
        onSuccess: (position) ->
          $scope.$apply ->
            $scope.watchPosition = position.timestamp
        onFailure: (error) ->
          alert "Error: #{JSON.stringify error}"

    $scope.latestPosition = undefined

    $scope.getPositionTests = [
      {
        title: "Get latest position"
      }
    ]

    $scope.testGetPosition = (options) ->
      supersonic.device.geolocation.getPosition().then (position) ->
        $scope.latestPosition = position.timestamp

    $scope.testGetPositionWithCallback = ->
      supersonic.device.geolocation.getPosition
        onSuccess: (position) ->
          $scope.latestPosition = position.timestamp
        onFailure: (error) ->
          alert "Error: #{JSON.stringify error}"

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

    $scope.testWatchAccelerationWithCallback = ->
      supersonic.device.accelerometer.watchAcceleration
        onSuccess: (acceleration) ->
          $scope.$apply ->
            $scope.watchAcceleration = acceleration.timestamp
        onFailure: (error) ->
          alert "Error: #{JSON.stringify error}"

    $scope.latestAcceleration = undefined

    $scope.getAccelerationTests = [
      {
        title: "Get latest acceleration"
      }
    ]

    $scope.testGetAcceleration = (options) ->
      supersonic.device.accelerometer.getAcceleration().then (acceleration) ->
        $scope.latestAcceleration = acceleration.timestamp

    $scope.testGetAccelerationWithCallback = ->
      supersonic.device.accelerometer.getAcceleration
        onSuccess: (acceleration) ->
          $scope.latestAcceleration = acceleration.timestamp
        onFailure: (error) ->
          alert "Error: #{JSON.stringify error}"

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

    $scope.testWatchHeadingWithCallback = ->
      supersonic.device.compass.watchHeading
        onSuccess: (heading) ->
          $scope.$apply ->
            $scope.watchHeading = heading.timestamp
        onFailure: (error) ->
          alert "Error: #{JSON.stringify error}"

    $scope.latestHeading = undefined

    $scope.getHeadingTests = [
      {
        title: "Get latest heading"
      }
    ]

    $scope.testGetHeading = (options) ->
      supersonic.device.compass.getHeading().then (heading) ->
        $scope.latestHeading = heading.timestamp

    $scope.testGetHeadingWithCallback = ->
      supersonic.device.compass.getHeading
        onSuccess: (heading) ->
          $scope.latestHeading = heading.timestamp
        onFailure: (error) ->
          alert "Error: #{JSON.stringify error}"

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

    $scope.offlineCount = 0
    $scope.onlineCount = 0
    $scope.listenOfflineAndOnline = ->
      supersonic.device.network.whenOffline ->
        $scope.offlineCount += 1
      supersonic.device.network.whenOnline ->
        $scope.onlineCount += 1

    $scope.backButtonListener = null
    $scope.backButtonPressedCount = 0
    $scope.overrideBackButton = ->
      supersonic.logger.debug "Setting whenPressed.."
      console.log supersonic.device.buttons.back.whenPressed
      $scope.backButtonListener = supersonic.device.buttons.back.whenPressed ->
        $scope.backButtonPressedCount += 1

    $scope.removeBackButtonListener = ->
      $scope.backButtonListener() if $scope.backButtonListener?
      $scope.backButtonListener = null
