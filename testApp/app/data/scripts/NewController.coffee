angular
  .module('data')
  .controller("NewController", ($scope, Task) ->
    $scope.task =
      description: "some task"

    $scope.submitForm = ->
      $scope.showSpinner = true
      newTask = new Task($scope.task)
      newTask.save().then ->
        supersonic.ui.modal.hide()
  )
