angular
  .module('app')
  .controller 'IndexController', ($scope, $timeout, $q, supersonic) ->
    $scope.successfulOpens = 0

    $scope.openURLTests = [
      {
        title: "Apple Maps maps:// (iOS)"
        options: "maps://?daddr=San+Francisco,+CA&saddr=cupertino"
      }
      {
        title: "Google Maps geo: (Android)"
        options: "geo:42,2?z=8"
      }
      {
        title: "Dolanz dolanz:// (should fail)"
        options: "dolanz://"
      }
    ]

    $scope.testOpenURL = (options) ->
      supersonic.app.openURL(options).then(
        () ->
          $scope.successfulOpens++
        (message) ->
          supersonic.ui.dialog.alert "Could not open URL! \n\n #{JSON.stringify(message)}"
      )

    $scope.testOpenURLWithCallback = ->
      supersonic.app.openURL "http://appgyver.com",
        onSuccess: ->
          $scope.successfulOpens++
        onFailure: (message) ->
          supersonic.ui.dialog.alert "Could not open URL! \n\n #{JSON.stringify(message)}"

    $scope.launchURL = undefined

    $scope.getLaunchURLTests = [
      {
        title: "Get Launch URL"
      }
    ]

    $scope.testGetLaunchURL = (options) ->
      $scope.launchURL = supersonic.app.getLaunchURL()

    $scope.sleepDisabled = 0
    $scope.sleepEnabled = 0

    $scope.disableAndEnableSleepTests = [
      {
        title: "Disable and Enable Sleep"
      }
    ]

    $scope.testDisableAndEnableSleep = (options) ->
      supersonic.app.sleep.disable().then ->
        $scope.sleepDisabled++
        supersonic.app.sleep.enable().then ->
         $scope.sleepEnabled++

    $scope.testDisableAndEnableSleepWithCallbacks = ->
      supersonic.app.sleep.disable
        onSuccess: ->
          $scope.sleepDisabled++
          enableSleep()
        onFailure: (message) ->
          supersonic.ui.dialog.alert "Could not disable sleep! \n\n #{JSON.stringify(message)}"

    enableSleep = ->
      supersonic.app.sleep.enable
        onSuccess: ->
          $scope.sleepEnabled++
        onFailure: (message) ->
          supersonic.ui.dialog.alert "Could not enable sleep! \n\n #{JSON.stringify(message)}"

    $scope.splashscreenShown = 0
    $scope.splashscreenHidden = 0

    $scope.showAndHideSplashscreenTests = [
      {
        title: "Show Splashscreen and Hide in 5000 ms"
      }
    ]

    $scope.testShowAndHideSplashscreen = (options) ->
      supersonic.app.splashscreen.show().then(
        () ->
          $scope.splashscreenShown++
          $timeout ->
            supersonic.app.splashscreen.hide().then(
              () ->
                $scope.splashscreenHidden++
              (message) ->
                supersonic.ui.dialog.alert "Could not hide splashscreen! \n\n #{JSON.stringify(message)}"
            )
          , 5000
        (message) ->
          supersonic.ui.dialog.alert "Could not show splashscreen! \n\n #{JSON.stringify(message)}"
      )

    $scope.testShowAndHideSplashscreenWithCallbacks = ->
      supersonic.app.splashscreen.show
        onSuccess: ->
          $scope.splashscreenShown++
          hideSplashscreen()
        onFailure: (message) ->
          supersonic.ui.dialog.alert "Could not show splashscreen! \n\n #{JSON.stringify(message)}"

    hideSplashscreen = ->
      supersonic.app.splashscreen.hide
        onSuccess: ->
          $scope.splashscreenHidden++
        onFailure: (message) ->
          supersonic.ui.dialog.alert "Could not hide splashscreen! \n\n #{JSON.stringify(message)}"

    $scope.statusBarHidden = 0
    $scope.statusBarShown = 0

    $scope.hideAndShowStatusBarTests = [
      {
        title: "Hide and show status bar without params"
        options: null
      }
      {
        title: "Hide and show status bar with a string param"
        options: "light"
      }
      {
        title: "Hide and show status bar with an object param"
        options:
          style: "light"
      }
    ]

    $scope.testHideAndShowStatusBar = (options) ->
      supersonic.app.statusBar.hide().then(
        () ->
          $scope.statusBarHidden++
          supersonic.app.statusBar.show(options).then(
            () ->
              $scope.statusBarShown++
            (message) ->
              supersonic.ui.dialog.alert "Could not hide status bar! \n\n #{JSON.stringify(message)}"
          )
        (message) ->
          supersonic.ui.dialog.alert "Could not hide status bar! \n\n #{JSON.stringify(message)}"
      )

    $scope.testHideAndShowStatusBarWithCallbacks = ->
      supersonic.app.statusBar.hide
        onSuccess: ->
          $scope.statusBarHidden++
          showStatusBar()
        onFailure: (message) ->
          supersonic.ui.dialog.alert "Could not hide statusBar! \n\n #{JSON.stringify(message)}"

    showStatusBar = ->
      supersonic.app.statusBar.show
        onSuccess: ->
          $scope.statusBarShown++
        onFailure: (message) ->
          supersonic.ui.dialog.alert "Could not show statusBar! \n\n #{JSON.stringify(message)}"

    $scope.pausedCount = 0
    $scope.resumedCount = 0
    pausedListener = null
    resumedListener = null
    $scope.setPausedAndResumedListeners = ->
      pausedListener = supersonic.app.whenPaused -> $scope.pausedCount += 1
      resumedListener = supersonic.app.whenResumed -> $scope.resumedCount += 1

    $scope.removePausedAndResumedListeners = ->
      pausedListener()
      resumedListener()
