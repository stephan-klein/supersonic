angular
  .module('data')
  .controller("NewController", ($scope, Task)->

    $scope.task = new Task

    $scope.submitForm = ->
      $scope.showSpinner = true
      $scope.task.save().then ->
        steroids.modal.hide()

    $scope.cancel = ->
      steroids.modal.hide()

    # Native navigation
    steroids.view.navigationBar.show "New Task"
    steroids.view.setBackgroundColor "#FFFFFF"
  )
