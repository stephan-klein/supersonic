angular
  .module('data')
  .controller("IndexController", ($scope, Task, supersonic) ->
    $scope.tasks = null
    $scope.showSpinner = true

    supersonic.ui.views.current.whenVisible ->
      Task.all().whenChanged (tasks)->
        $scope.$apply ->
          $scope.tasks = tasks
          $scope.showSpinner = false

    supersonic.data.channel("events").subscribe (message)->
      supersonic.ui.dialog.alert "Received message! #{message}"

    $scope.sendChannelMessage = ->
      supersonic.data.channel('events').publish('you would not believe what just happened')


  )
