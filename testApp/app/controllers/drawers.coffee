angular
  .module('drawersApp', ['supersonic'])
  .controller 'IndexCtrl', ($scope, $element, supersonic) ->

    $scope.openDrawer = ()->
      drawer = $element.find('ss-drawer')[0]
      drawer && drawer.setAttribute("style", "display: block;")

    backButton = new steroids.buttons.NavigationBarButton()
    backButton.title = "Back"

    steroids.view.navigationBar.update {
      backButton: backButton
      title: "Drawers"
    }
