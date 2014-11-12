angular
  .module('angular')
  .controller 'IndexController', ($scope, supersonic) ->

    $scope.currentId = null
    supersonic.bind $scope, "currentId"

    $scope.testBind = ->
      $scope.currentId = "#{Math.random()}"
      supersonic.ui.views.find("angular#bindTest").then (view)->
        supersonic.ui.layers.push view
