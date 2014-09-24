angular
  .module('ui')
  .controller 'IndexController', ($scope, $q, supersonic) ->

    $scope.navigateTo = (url)->
      v = supersonic.ui.view(url, "myView")
      supersonic.ui.layer.push(v)

    $scope.asLeftDrawer = (url)->
      v = supersonic.ui.view(url)

      v.preload().then ()->
        supersonic.ui.drawer.asLeft(v)

    $scope.asRightDrawer = (url)->
      v = supersonic.ui.view(url)

      v.preload().then ()->
        supersonic.ui.drawer.asRight(v)
