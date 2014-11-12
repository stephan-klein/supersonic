angular
  .module('dialog')
  .controller 'IndexController', ($scope, supersonic) ->
    $scope.dismissedAlerts = 0

    $scope.alertTests = [
      {
        testTitle: "Alert with message as param"
        title: "Just a string value."
      }
      {
        testTitle: "Alert with message and options params"
        title: "I'm an alert!"
        options:
          message: "Custom Message"
          buttonLabel: "Close"
      }
      {
        testTitle: "Alert with null message"
        title: null
      }
      {
        testTitle: "Alert without params"
      }
    ]

    $scope.testAlert = (title, options) ->
      supersonic.ui.dialog.alert(title, options).then ->
        $scope.dismissedAlerts++

    $scope.testAlertWithCallback = ->
      supersonic.ui.dialog.alert
        onSuccess: ->
          $scope.$apply ->
            $scope.dismissedAlerts++
        onFailure: ->
          supersonic.logger.log "Showing an alert failed"

    $scope.confirms = [
      0
      0
      0
    ]

    $scope.confirmTests = [
      {
        testTitle: "Confirm with title string"
        title: "Just a String"
      }
      {
        testTitle: "Alert with title string and options object params"
        title: "I'm a Confirm!"
        options:
          message: "Custom Message"
          buttonLabels: ["Yay","NO!","Third"]
      }
      {
        testTitle: "Confirm with null title"
        title: null
      }
      {
        testTitle: "Confirm without options"
      }
    ]

    $scope.testConfirm = (title, options) ->
      supersonic.ui.dialog.confirm(title, options).then (index) ->
        $scope.confirms[index]++

    $scope.testConfirmWithCallback = ->
      supersonic.ui.dialog.confirm
        onSuccess: (index) ->
          $scope.$apply ->
            $scope.confirms[index]++
        onFailure: ->
          supersonic.logger.log "Showing a confirm dialog failed"

    $scope.buttonIndex = undefined
    $scope.input = undefined

    $scope.promptTests = [
      {
        testTitle: "Prompt with String title as only param"
        title: "String title!"
      }
      {
        testTitle: "Prompt with title String and options object params"
        title: "I am a prompt"
        options:
          message: "Custom Title"
          buttonLabels: ["Yay","NO!","Maybe"]
          defaultText: "Type something"
      }
      {
        testTitle: "Prompt with null title"
        title: null
      }
      {
        testTitle: "Prompt without params"
      }
    ]

    $scope.testPrompt = (title, options) ->
      supersonic.ui.dialog.prompt(title, options).then (result) ->
        $scope.buttonIndex = result.buttonIndex
        $scope.input = result.input

    $scope.testPromptWithCallback = ->
      supersonic.ui.dialog.prompt
        onSuccess: (result) ->
          $scope.$apply ->
            $scope.buttonIndex = result.buttonIndex
            $scope.input = result.input
        onFailure: ->
          supersonic.logger.log "Showing a prompt dialog failed"
