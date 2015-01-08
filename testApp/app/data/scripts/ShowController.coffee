angular
  .module('data')
  .controller("ShowController", ($scope, Task) ->
    $scope.task = null
    $scope.showSpinner = true

    stopUpdating = null
    supersonic.ui.views.current.whenVisible ->
      stopUpdating = Task.one(steroids.view.params.id, {interval: 1000}).whenChanged (task) ->
        $scope.$apply ->
          $scope.task = task
          $scope.showSpinner = false

    supersonic.ui.views.current.whenHidden ->
      stopUpdating?()
      stopUpdating = null

    $scope.remove = (id) ->
      $scope.showSpinner = true
      $scope.task.delete().then ->
        supersonic.ui.layers.pop()
  )