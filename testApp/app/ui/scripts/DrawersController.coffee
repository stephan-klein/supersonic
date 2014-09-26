angular
  .module('ui')
  .controller 'DrawersController', ($scope, $q, supersonic) ->

    supersonic.ui.drawer.setOptions {
      showShadow: true
      animation: steroids.drawers.defaultAnimations.PARALLAX
    }

    $scope.asLeftDrawer = (url, width)->
      v = supersonic.ui.view(url)

      v.setWidth(width).preload().then ()->
        supersonic.ui.drawer.asLeft(v).then ()->
          supersonic.logger.log "promise works"

    $scope.asRightDrawer = (url, width)->
      v = supersonic.ui.view(url)

      v.setWidth(width).preload().then ()->
        supersonic.ui.drawer.asRight(v)
