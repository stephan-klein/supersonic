angular
  .module('notification')
  .controller 'IndexController', ($scope) ->
    $scope.dismissedAlerts = 0

    $scope.alertTests = [
      {
        title: "Alert with message as param"
        message: "Just a string value."
      }
      {
        title: "Alert with message and options params"
        message: "I'm an alert!"
        options:
          title: "Custom Title"
          buttonLabel: "Close"
      }
      {
        title: "Alert with null message"
        message: null
      }
      {
        title: "Alert without params"
      }
    ]

    $scope.testAlert = (message, options) ->
      supersonic.notification.alert(message, options).then ->
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
      supersonic.notification.confirm(options).then (index) ->
        $scope.confirms[index]++

    $scope.vibrations = 0

    $scope.vibrateTests = [
      {
        title: "Vibrate for 2500 ms"
        options: 2500
      }
      {
        title: "Vibrate"
        options: null
      }
    ]

    $scope.testVibrate = (options) ->
      supersonic.notification.vibrate(options).then ->
        $scope.vibrations++

    $scope.buttonIndex = undefined
    $scope.input = undefined

    $scope.promptTests = [
      {
        title: "Prompt with String as param"
        options: "Just a string value."
      }
      {
        title: "Prompt with options object param"
        options:
          title: "Custom Title" 
          message: "I am a prompt"
          buttonLabels: ["Yay","NO!","Maybe"]
          defaultText: "Type something"
      }
      {
        title: "Prompt with null options"
        options: null
      }
      {
        title: "Prompt without options"
      }
    ]

    $scope.testPrompt = (options) ->
      supersonic.notification.prompt(options).then (result) ->
        $scope.buttonIndex = result.buttonIndex
        $scope.input = result.input

