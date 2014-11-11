angular
  .module('data')
  .controller("IndexController", ($scope, Task) ->
    $scope.tasks = null
    $scope.showSpinner = true

    supersonic.ui.views.current.whenVisible ->
      Task.all().whenChanged (tasks)->
        $scope.$apply ->
          window.TASKIT = tasks
          $scope.tasks = tasks
          $scope.showSpinner = false

  )
