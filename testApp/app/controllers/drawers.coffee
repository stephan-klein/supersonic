angular
  .module('drawersApp', ['supersonic'])
  .controller 'IndexCtrl', ($scope, $element, supersonic) ->

    $scope.openDrawer = ()->
      drawer = $element.find('ss-drawer')[0]
      drawer && drawer.setAttribute("style", "display: block;")

    $scope.openDrawerCtrl = ()->
      drawer = new steroids.views.WebView "/views/components/index.html"
      side = "left"
      drawer.preload {}, {
        onSuccess: ()->
          steroids.logger.log "drawer preloaded"
          params = {}
          params[side] = drawer
          steroids.drawers.update params
          steroids.drawers.show({
            edge: steroids.screen.edges[side.toUpperCase()]
          })
      }

    backButton = new steroids.buttons.NavigationBarButton()
    backButton.title = "Back"

    steroids.view.navigationBar.update {
      backButton: backButton
      title: "Drawers"
    }
