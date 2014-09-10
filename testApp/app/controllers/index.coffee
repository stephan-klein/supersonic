angular
  .module('indexApp', ['supersonic'])
  .controller 'IndexCtrl', ($scope, supersonic) ->

    steroids.view.navigationBar.show "Basic CSS components"

    opened = false

    $scope.openDrawer = ->
      steroids.logger.log "openDrawer"

      open = ->
        steroids.logger.log "open"
        steroids.drawers.show {
          edge: steroids.screen.edges.LEFT
        }

      if !opened
        leftDrawer = new steroids.views.WebView("/views/components/index.html")

        leftDrawer.preload {}, {
          onSuccess: ()->
            steroids.drawers.update {
              left: leftDrawer
            }
            open()
        }
        opened = true
      else
        open()
