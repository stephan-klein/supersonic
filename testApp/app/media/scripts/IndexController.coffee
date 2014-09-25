angular
  .module('media')
  .controller 'IndexController', ($scope, supersonic) ->
    $scope.pictureURL = null

    $scope.takePictureTests = [
      {
        title: "Take a picture with null paramters"
        options: null
      }
      {
        title: "Take a picture of size 100x100"
        options:
          targetWidth: 100
          targetHeight: 100
      }
    ]

    $scope.testTakePicture = (options) ->
      supersonic.media.camera.takePicture(options).then(
        (imageURI) ->
          $scope.pictureURL = imageURI
        (message) ->
          alert "Could not take a picture! \n\n #{JSON.stringify(message)}"
      )

    

    
