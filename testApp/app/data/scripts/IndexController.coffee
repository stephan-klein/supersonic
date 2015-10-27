angular
  .module('data')
  .controller("IndexController", ($scope, Task, supersonic) ->
    $scope.tasks = null
    $scope.showSpinner = true

    stopUpdating = null
    supersonic.ui.views.current.whenVisible ->
      stopUpdating = Task.all().whenChanged (tasks) ->
        $scope.$apply ->
          $scope.tasks = tasks
          $scope.showSpinner = false
    supersonic.ui.views.current.whenHidden ->
      stopUpdating?()
      stopUpdating = null

    supersonic.data.channel("events").subscribe (message) ->
      supersonic.ui.dialog.alert "Received message! #{message}"

    $scope.sendChannelMessage = ->
      supersonic.data.channel('events').publish('you would not believe what just happened')


  )
