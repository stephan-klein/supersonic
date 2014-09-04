angular
  .module('blockButtonApp', ['supersonic'])
  .controller 'IndexCtrl', ($scope, supersonic) ->

    backButton = new steroids.buttons.NavigationBarButton()
    backButton.title = "Back"

    steroids.view.navigationBar.update

      backButton: backButton
      title: "Block Button"
