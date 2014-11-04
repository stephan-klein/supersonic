angular
  .module('data')
  .controller("ShowController", ($scope, Task) ->
    $scope.task = null
    $scope.showSpinner = true

    # Fetch an object based on id
    fetchResource = ->
      $scope.showSpinner = true
      Task.find(steroids.view.params.id).then (task)->
        $scope.$apply ->
          $scope.task = task
          $scope.showSpinner = false

    supersonic.ui.views.current.whenVisible ->
      fetchResource()

    $scope.remove = (id) ->
      $scope.showSpinner = true
      $scope.task.delete().then ->
        supersonic.ui.layers.pop()
  )