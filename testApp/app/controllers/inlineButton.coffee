angular
  .module('inlineButtonApp', ['supersonic'])
  .controller 'IndexCtrl', ($scope, supersonic) ->

    steroids.view.navigationBar.show ""

    backButton = new steroids.buttons.NavigationBarButton()
    backButton.title = "Back"

    steroids.view.navigationBar.update

      backButton: backButton
      title: "Inline Button"
