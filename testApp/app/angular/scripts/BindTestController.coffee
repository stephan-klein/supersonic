angular
  .module('angular')
  .controller 'BindTestController', ($timeout, $scope, supersonic) ->

    $scope.currentId = null
    supersonic.bind $scope, "currentId"

    $scope.$watch "currentId", (newValue, oldValue)->
      # see https://docs.angularjs.org/api/ng/type/$rootScope.Scope
      #
      # After a watcher is registered with the scope, the listener fn is called
      # asynchronously (via $evalAsync) to initialize the watcher.
      # In rare cases, this is undesirable because the listener is called when
      # the result of watchExpression didn't change. To detect this scenario
      # within the listener fn, you can compare the newVal and oldVal.
      # If these two values are identical (===) then the listener was called due
      # to initialization."
      unless newValue == oldValue
        supersonic.ui.dialog.alert "New value: #{newValue} Old value: #{oldValue}"
