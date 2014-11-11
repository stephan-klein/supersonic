angular
  .module('angular')
  .controller 'BindTestController', ($scope, supersonic) ->

    $scope.currentId = null
    supersonic.bind $scope, "currentId"

    $scope.$watch "currentId", (newValue, oldValue)->
      alert "New value: #{newValue} \n\n Old value: #{oldValue}"
