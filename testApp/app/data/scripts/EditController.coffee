angular
  .module('data')
  .controller("EditController", ($scope, TaskResource)->

    $scope.task = {}
    $scope.showSpinner = true

    # Fetch an object based on id from the database
    TaskResource.find(steroids.view.params.id).then (task)->
      $scope.$apply ->
        $scope.task = task
        $scope.showSpinner = false

    $scope.submitForm = ->
      $scope.showSpinner = true
      TaskResource.update($scope.task.id, $scope.task).then ->
        steroids.modal.hide()

    $scope.cancel = ->
      steroids.modal.hide()

    # Native navigation
    steroids.view.navigationBar.show "Edit Task"
    steroids.view.setBackgroundColor "#FFFFFF"

  )
