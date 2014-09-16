angular
  .module('webComponents', ['supersonic'])
  .controller 'DrawerController', ($scope, $element, supersonic) ->

    $scope.openDrawer = ()->
      # Opens a drawer calling its method
      drawer = $element.find('ss-drawer')[0]
      # drawer && drawer.setAttribute("style", "display: block;")
      drawer && drawer.showDrawer()

    $scope.openDrawer2 = ()->
      # Opens a drawer with CSS
      drawer = $element.find('ss-drawer')[0]
      drawer && drawer.setAttribute("style", "display: block;")

    backButton = new steroids.buttons.NavigationBarButton()
    backButton.title = "Back"

    steroids.view.navigationBar.update {
      backButton: backButton
      title: "Drawers"
    }
