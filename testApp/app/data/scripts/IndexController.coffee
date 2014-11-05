angular
  .module('data')
  .controller("IndexController", ($scope, Task) ->

    $scope.tasks = []
    $scope.showSpinner = true

    supersonic.ui.views.current.whenVisible ->
      $scope.$apply ->
        $scope.showSpinner = true
        Task.findAll().then (tasks)->
          $scope.$apply ->
            $scope.tasks = tasks
            $scope.showSpinner = false
  )