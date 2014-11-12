angular
  .module('data')
  .controller("IndexController", ($scope, Task, supersonic) ->
    $scope.tasks = null
    $scope.showSpinner = true

    supersonic.ui.views.current.whenVisible ->
      Task.all().whenChanged (tasks)->
        $scope.$apply ->
          window.TASKIT = tasks
          $scope.tasks = tasks
          $scope.showSpinner = false

    supersonic.data.channel("events").subscribe (message)->
      alert "Received message! #{message}"

    $scope.sendChannelMessage = ->
      supersonic.data.channel('events').publish('you would not believe what just happened')


  )
