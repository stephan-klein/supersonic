angular.module("initial")
  .controller 'IndexController', ($scope, $q, supersonic) ->

    $scope.showInitialView = ->
      supersonic.ui.initialView.show()

    $scope.dismissInitialView = ->
      supersonic.ui.initialView.dismiss()
