angular
  .module('app')
  .controller 'IndexController', ($scope, $timeout, supersonic) ->
    $scope.successfulOpens = 0

    $scope.openURLTests = [
      {
        title: "Apple Maps maps://"
        options: "maps://?daddr=San+Francisco,+CA&saddr=cupertino"
      }
      {
        title: "Dolanz dolanz:// (should fail)"
        options: "dolanz://"
      }
    ]

    $scope.testOpenURL = (options) ->
      supersonic.steroids.openURL(options).then(
        () ->
          $scope.successfulOpens++
        (message) ->
          alert "Could not open URL! \n\n #{JSON.stringify(message)}"
      )

    $scope.launchURL = undefined

    $scope.getLaunchURLTests = [
      {
        title: "Get Launch URL"
      }
    ]

    $scope.testGetLaunchURL = (options) ->
      supersonic.app.getLaunchURL().then( 
        (launchURL) ->
          $scope.launchURL = launchURL
        (message) ->
          alert "No launch URL available! \n\n #{JSON.stringify(message)}"
    )

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
    
