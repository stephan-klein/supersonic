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
      supersonic.cordova.notification.alert(options).then ->
        $scope.dismissedAlerts++

    $scope.confirms = [
      0
      0
      0
    ]

    $scope.confirmTests = [
      {
        title: "Confirm with String as param"
        options: "Just a string value."
      }
      {
        title: "Alert with options object param"
        options:
          title: "Custom Title"
          message: "I'm a Confirm!"
          buttonLabels: ["Yay","NO!","third"]
      }
      {
        title: "Confirm with null options"
        options: null
      }
      {
        title: "Confirm without options"
      }
    ]

    $scope.testConfirm = (options) ->
      supersonic.cordova.notification.confirm(options).then (index) ->
        $scope.confirms[index]++
