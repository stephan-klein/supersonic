angular
  .module('steroidsApp', ['supersonic'])
  .controller 'IndexCtrl', ($scope, supersonic) ->

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
