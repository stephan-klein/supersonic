angular
  .module('ui')
  .controller 'IndexController', ($scope, $q, supersonic) ->

    supersonic.ui.drawer.setOptions {
      showShadow: true
      animation: steroids.drawers.defaultAnimations.PARALLAX
    }

    $scope.navigateTo = (url)->
      v = supersonic.ui.view(url, "myView")
      supersonic.ui.layer.push(v)

    $scope.hideInitialView = ()->
      supersonic.ui.layer.hideInitial()

    $scope.asLeftDrawer = (url, width)->
      v = supersonic.ui.view(url)

      v.setWidth(width).preload().then ()->
        supersonic.ui.drawer.asLeft(v)

    $scope.asRightDrawer = (url, width)->
      v = supersonic.ui.view(url)

      v.setWidth(width).preload().then ()->
        supersonic.ui.drawer.asRight(v)
