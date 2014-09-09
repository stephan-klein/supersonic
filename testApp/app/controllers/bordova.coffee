angular
  .module('bordovaApp', ['supersonic'])
  .controller 'IndexCtrl', ($scope, supersonic) ->

    $scope.dismissedAlerts = 0

    $scope.alertTests = [
      {
        title: "Alert with String as param"
        options: "Just a string value."
      }
      {
        title: "Alert with options object param"
        options:
          title: "Custom Title"
          message: "I'm an alert!"
          buttonLabel: "Close"
      }
      {
        title: "Alert with null options"
        options: null
      }
      {
        title: "Alert without options"
      }
    ]

    $scope.testAlert = (options) ->
      console.log "options in Angular: ", JSON.stringify(options)
      supersonic.cordova.notification.alert(options).then ->
        $scope.dismissedAlerts++
