angular
  .module('ui')
  .controller 'IndexController', ($scope) ->

    $scope.allowedRotations = undefined

    $scope.setAllowedRotationsAndRotateTests = [
      {
        title: "Set allowed rotations to landscapeLeft and portrait and rotate to landscapeLeft"
        options:
          allowedRotations: ["landscapeLeft", "portrait"]
          orientation: "landscapeLeft"
      }
      {
        title: "Set allowed rotations to portrait, portraitUpsideDown, landscapeLeft and landscapeRight and rotate to portraitUpsideDown"
        options:
          allowedRotations:["portrait", "portraitUpsideDown", "landscapeLeft", "landscapeRight"]
          orientation:"portraitUpsideDown"
      }
      {
        title: "Set allowed rotations with no params and try to rotate to portraitUpsideDown"
        options:
          allowedRotations: null
          orientation: "portraitUpsideDown"
      }
    ]

    $scope.testSetAllowedRotationsAndRotate = (options) ->
      supersonic.ui.screen.setAllowedRotations(options.allowedRotations)
        .then supersonic.ui.screen.rotateTo options.orientation
        .catch (error) ->
          alert "Error: #{JSON.stringify error}"