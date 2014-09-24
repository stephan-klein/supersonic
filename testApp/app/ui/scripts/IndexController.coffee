angular
  .module('ui')
  .controller 'IndexController', ($scope, $q, supersonic) ->

    $scope.navigateTo = (url)->
      v = supersonic.ui.view(url, "myView")
      supersonic.ui.layer.push(v)

    $scope.asDrawer = (url)->
      v = supersonic.ui.view(url, "myView3")

      # TODO: Find normal way for qifying
      qify = (f, sc) ->
        () ->
          args = arguments
          # NOTE: It's important to preserve scope!
          $q.when ()->
            f.apply sc, args

      v.preload = qify v.preload, v

      # v.preload().then ()->
      supersonic.logger.log "webView gotten"
      location = url
      webView = new steroids.views.WebView( { location: "app/webComponents/drawerIndex.html" } )

      supersonic.logger.log "not loaded2"
      webView.preload {}, {
        onSuccess: ()->
          supersonic.logger.log "preloaded"
          steroids.drawers.update {
            left: webView
          }
          supersonic.logger.log "drawers are updated"
          steroids.drawers.show {
            edge: steroids.screen.edges.LEFT
          }, {
            onSuccess: ()->
              supersonic.logger.log "drawer should be shown"
            onFailure: ()->
              supersonic.logger.log "drawer fails"
          }
          # supersonic.ui.drawer.asLeft(v)
      }
      #
      # webView.preload ()->
      #   supersonic.logger.log "preloaded"
      #   steroids.drawers.update {
      #     left: webView
      #   }
      #   supersonic.logger.log "drawers are updated"
      #   steroids.drawers.show {
      #     edge: steroids.screen.edges.LEFT
      #   }, {
      #     onSuccess: ()->
      #       supersonic.logger.log "drawer should be shown"
      #     onFailure: ()->
      #       supersonic.logger.log "drawer fails"
      #   }
      #   # supersonic.ui.drawer.asLeft(v)
