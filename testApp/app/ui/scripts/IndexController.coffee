angular
  .module('ui')
  .controller 'IndexController', ($scope, $q, supersonic) ->

    $scope.navigateTo = (url)->
      v = supersonic.ui.view(url, "myView")
      supersonic.ui.layer.push(v)

    $scope.navigateWithPreloading = (url)->
      v = supersonic.ui.view(url, "myView2")

      # TODO: Find normal way for qifying
      qify = (f, sc) ->
        () ->
          args = arguments
          # NOTE: It's important to preserve scope!
          $q.when ()->
            f.apply sc, args

      v.preload = qify v.preload, v

      v.preload().then ()->
        supersonic.ui.layer.push(v)
        supersonic.logger.log "preloaded"

    $scope.asDrawer = ()->
      supersonic.ui.drawer.asLeft()
