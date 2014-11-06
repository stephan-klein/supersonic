angular
  .module('data')
  .controller("ShowController", ($scope, Task) ->
    $scope.task = null
    $scope.showSpinner = true

    supersonic.ui.views.current.whenVisible ->
      Task.find(steroids.view.params.id).then (task)->
        $scope.$apply ->
          $scope.task = task
          $scope.showSpinner = false

    $scope.remove = (id) ->
      $scope.showSpinner = true
      $scope.task.delete().then ->
        supersonic.ui.layers.pop()
  )