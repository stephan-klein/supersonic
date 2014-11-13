angular
  .module('webComponents')
  .controller 'NavigateResultController', ($scope, $timeout) ->
    $scope.result = "No value received yet"
    supersonic.ui.views.current.params.onValue (newValue)->
      $timeout ->
        $scope.result = newValue
