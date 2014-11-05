angular
  .module('data')
  .controller("IndexController", ($scope, Task) ->
    $scope.tasks = null
    $scope.showSpinner = true

    supersonic.ui.views.current.whenVisible ->
      Task.all().whenChanged (tasks)->
        $scope.$apply ->
          $scope.tasks = tasks
          $scope.showSpinner = false

  )