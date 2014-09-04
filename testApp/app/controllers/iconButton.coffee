angular
  .module('iconButtonApp', ['supersonic'])
  .controller 'IndexCtrl', ($scope, supersonic) ->

    backButton = new steroids.buttons.NavigationBarButton()
    backButton.title = "Back"

    steroids.view.navigationBar.update

      backButton: backButton
      title: "Icon Button"
