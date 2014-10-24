angular
  .module('media')
  .controller 'IndexController', ($scope, supersonic, $q) ->
    $scope.pictureURL = null
    $scope.picturePath = null

    $scope.takePictureTests = [
      {
        title: "Take a picture with null params"
      }
      {
        title: "Take a picture of size 100x100"
        options:
          targetWidth: 100
          targetHeight: 100
      }
      {
        title: "Take a picture of size 100x100 with allowEdit option"
        options:
          targetWidth: 100
          targetHeight: 100
          allowEdit: true
      }
    ]

    $scope.testTakePicture = (options) ->
      supersonic.media.camera.takePicture(options)
        .then(
          (imageURI) ->
            $scope.pictureURL = imageURI
            imageURI
          (message) ->
            alert "Could not take a picture! \n\n #{JSON.stringify(message)}"
        )
        .then(moveFileToUserFiles)
        .then( (file) ->
          $scope.picturePath = "http://localhost/#{file.name}"
        )

    moveFileToUserFiles = (imageURI) ->
      deferred = $q.defer()

      gotFileObject = (file) ->
        # Define a target directory for our file in the user files folder
        # steroids.app variables require the Steroids ready event to be fired, so ensure that
        steroids.on "ready", ->
          targetDirURI = "file://" + steroids.app.absoluteUserFilesPath
          fileName = "image" + ".jpeg"
          window.resolveLocalFileSystemURL(
            targetDirURI
            (directory) ->
              file.moveTo directory, fileName, (file) ->
                deferred.resolve {
                  name: file.name
                  path: "#{targetDirURI}/#{fileName}"
                }
              , deferred.reject
            deferred.reject
          )
      window.resolveLocalFileSystemURL imageURI, gotFileObject, deferred.reject

      deferred.promise

    $scope.fromLibraryURL = null
    $scope.fromLibraryPath = null

    $scope.getFromPhotoLibraryTests = [
      {
        title: "Choose a picture with null params"
      }
      {
        title: "Choose a picture with targetWidth and targetHeight params"
        options:
          targetWidth: 200
          targetHeight: 200
      }
      {
        title: "Choose a picture with targetWidth, targetHeight and allowEdit params"
        options:
          targetWidth: 200
          targetHeight: 200
          allowEdit: true
      }
      {
        title: "Choose a video"
        options:
          mediaType: "video"
      }
    ]

    $scope.testGetFromPhotoLibrary = (options) ->
      supersonic.media.camera.getFromPhotoLibrary(options)
        .then(
          (imageURI) ->
            $scope.fromLibraryURL = imageURI
            imageURI
          (message) ->
            alert "Could not take a picture! \n\n #{JSON.stringify(message)}"
        )
        .then(moveFileToUserFiles)
        .then( (file) ->
          $scope.fromLibraryPath = "http://localhost/#{file.name}"
        )
