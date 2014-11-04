angular
  .module('data')
  .controller("IndexController", ($scope, Task) ->

    $scope.tasks = []
    $scope.showSpinner = true

    fetchResources = ->
      $scope.showSpinner = true
      Task.findAll().then (tasks)->
        $scope.$apply ->
          $scope.tasks = tasks
          $scope.showSpinner = false

    # Trigger data refresh when this view becomes visible
    supersonic.ui.views.current.whenVisible ->
      fetchResources()
  )