angular
  .module('inlineButtonApp', ['supersonic'])
  .controller 'IndexCtrl', ($scope, supersonic) ->

    steroids.view.navigationBar.show ""

    backButton = new steroids.buttons.NavigationBarButton()
    backButton.title = "My title"

    steroids.view.navigationBar.update

      backButton: backButton
      overrideBackButton: false
      title: "XXX"
    #steroids.view.navigationBar.show "Inline Button"
