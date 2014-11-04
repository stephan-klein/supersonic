angular
  .module('data')
  .controller("NewController", ($scope, TaskResource) ->
    $scope.task = {}

    $scope.submitForm = ->
      $scope.showSpinner = true
      TaskResource.create($scope.task).then ->
        supersonic.ui.modal.hide()
  )
