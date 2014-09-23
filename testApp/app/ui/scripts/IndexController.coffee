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
          orientations: 
            allowedRotations: 
              orientations: ["portrait", "portraitUpsideDown", "landscapeLeft", "landscapeRight"]
            orientation: 
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
      supersonic.ui.screen.setAllowedRotations(options).then(
        () ->
          orientations = if options.allowedRotations instanceof Array
            options.allowedRotations
          else if options?.allowedRotations?.orientations?
            options.allowedRotations.orientations
          else
          supersonic.logger.log orientations
          $scope.allowedRotations = orientations
          supersonic.ui.screen.rotateTo(options.orientation).then(
            () ->
              alert "Rotated"
            (message) ->
              alert "Could not rotate! \n\n #{JSON.stringify(message)}"
          )

        (message) ->
          alert "Could not set allowed rotations! \n\n #{JSON.stringify(message)}"
      )