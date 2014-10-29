angular
  .module('data')
  .controller("NewController", ($scope, TaskResource)->

    $scope.task = {}

    $scope.submitForm = ->
      $scope.showSpinner = true
      TaskResource.create($scope.task).then ->
        steroids.modal.hide()

    $scope.cancel = ->
      steroids.modal.hide()

    # Native navigation
    steroids.view.navigationBar.show "New Task"
    steroids.view.setBackgroundColor "#FFFFFF"
  )
