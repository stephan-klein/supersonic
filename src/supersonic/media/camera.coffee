Promise = require 'bluebird'

{deviceready} = require '../events'
###
   # @category core
   # @module media
   # @name camera
   # @overview
   # @description
   # Provides access to the device's default camera application.
  ###

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.media.camera"

  ###
   # @module camera
   # @name takePicture
   # @function
   # @apiCall supersonic.media.camera.takePicture
   # @description
   # Opens the device's default camera application that allows users to take pictures. Once the user takes the photo, the camera application closes and the application is restored.
   # @type
   # supersonic.supersonic.media.camera.takePicture: (
   #  options?: {
   #   quality?: Integer,
   #   destinationType?: String,
   #   allowEdit?: Boolean,
   #   encodingType?: String,
   #   targetWidth?: Integer,
   #   targetHeight?: Integer,
   #   correctOrientation?: Boolean,
   #   saveToPhotoAlbum?: Boolean,
   #   cameraDirection?: String
   #  }
   # )
   # => Promise: result: String
   # @define {Object} options={} Optional options object.
   # @define {Integer} options.quality=100 Quality of the saved image, expressed as a range of 0-100, where 100 is typically full resolution with no loss from file compression.
   # @define {String} options.destinationType="fileURI" Choose the format of the return value. Available formats:
   #  * "dataURL": Return image as base64-encoded string
   #  * "fileURI": Return image file URI
   #  * "nativeURI": Return image native URI (e.g., assets-library:// on iOS or content:// on Android)
   # @define {Boolean} options.allowEdit=false Allow simple editing of image before selection. Note that Android ignores the `allowEdit parameter.
   # @define {String} options.encodingType="jpeg" Choose the returned image file's encoding. Available encoding types:
   #  * "jpeg": Return JPEG encoded image (default).
   #  * "png": Return PNG encoded image.
   # @define {Integer} options.targetWidth Target width in pixels to scale image. Must be used with options.targetHeight. Aspect ratio remains constant.
   # @define {Integer} options.targetHeight Target height in pixels to scale image. Must be used with options.targetWidth. Aspect ratio remains constant.
   # @define {Boolean} options.correctOrientation=true Rotate the image to correct for the orientation of the device during capture.
   # @define {Boolean} options.saveToPhotoAlbum=false Save the image to the photo album on the device after capture.
   # @define {String} options.cameraDirection="back" Choose the camera to use (front- or back-facing). Note that any `cameraDirection` value results in a back-facing photo on Android. Available directions:
   #  * "back": Use the back-facing camera.
   #  * "front": Use the front-facing camera.
   # @returnsDescription
   # Returns a [Promise](todo) that is resolved with the the image file URI (default) or Base64 encoding of the image data as an argument depending on the destinationType option.
   # @define {=>String} result Image file URI (default) or Base64 encoding of the image data as an argument depending on the destinationType option.
   # @usageCoffeeScript
   # supersonic.media.camera.takePicture options
   # @exampleCoffeeScript
   # options =
   #   quality: 50
   #   allowEdit: true
   #   targetWidth: 300
   #   targetHeight: 300
   #   encodingType: "png"
   #   saveToPhotoAlbum: true
   # supersonic.media.camera.takePicture(options).then (result) ->
   #  # Do something with the image URI
  ###
  takePicture = (options = {}) ->

    getCameraOptions = ->
      destinationType = if options?.destinationType?
        switch options.destinationType
          when "dataURL" then Camera.DestinationType.DATA_URL
          when "fileURI" then Camera.DestinationType.FILE_URI
          when "nativeURI" then Camera.DestinationType.NATIVE_URI
      else
        Camera.DestinationType.FILE_URI
  
      encodingType = if options?.encodingType?
        switch options.encodingType
          when "jpeg" then Camera.EncodingType.JPEG
          when "png" then Camera.EncodingType.PNG
      else
        Camera.EncodingType.JPEG
  
      cameraDirection = if options?.cameraDirection?
        switch options.cameraDirection
          when "back" then Camera.Direction.BACK
          when "front" then Camera.Direction.FRONT
      else
        Camera.Direction.BACK
  
      cameraOptions =
        quality: options?.quality || 100
        destinationType: destinationType
        allowEdit: options?.allowEdit? || false
        encodingType: encodingType
        targetWidth: options?.targetWidth
        targetHeight: options?.targetHeight
        correctOrientation: options?.correctOrientation? || true
        saveToPhotoAlbum: options?.saveToPhotoAlbum? || false
        cameraDirection: cameraDirection
  
    deviceready
      .then(getCameraOptions)
      .then( (cameraOptions) ->
        new Promise (resolve, reject) ->
          navigator.camera.getPicture resolve, reject, cameraOptions
      )

  ###
   # @module camera
   # @name getFromPhotoLibrary
   # @function
   # @apiCall supersonic.media.camera.getFromPhotoLibrary
   # @description
   # Opens the device's default camera application that allows users to take pictures. Once the user takes the photo, the camera application closes and the application is restored.
   # @type
   # supersonic.supersonic.media.camera.getFromPhotoLibrary: (
   #  options?: {
   #   quality?: Integer,
   #   destinationType?: String,
   #   allowEdit?: Boolean,
   #   encodingType?: String,
   #   targetWidth?: Integer,
   #   targetHeight?: Integer,
   #   mediaType?: String,
   #   correctOrientation?: Boolean,
   #  }
   # )
   # => Promise: result: String
   # @define {Object} options={} Optional options object.
   # @define {Integer} options.quality=100 Quality of the saved image, expressed as a range of 0-100, where 100 is typically full resolution with no loss from file compression.
   # @define {String} options.destinationType="fileURI" Choose the format of the return value. Available formats:
   #  * "dataURL": Return image as base64-encoded string
   #  * "fileURI": Return image file URI
   #  * "nativeURI": Return image native URI (e.g., assets-library:// on iOS or content:// on Android)
   # @define {Boolean} options.allowEdit=false Allow simple editing of image before selection. Note that Android ignores the `allowEdit parameter.
   # @define {String} options.encodingType="jpeg" Choose the returned image file's encoding. Available encoding types:
   #  * "jpeg": Return JPEG encoded image.
   #  * "png": Return PNG encoded image.
   # @define {Integer} options.targetWidth Target width in pixels to scale image. Must be used with options.targetHeight. Aspect ratio remains constant.
   # @define {Integer} options.targetHeight Target height in pixels to scale image. Must be used with options.targetWidth. Aspect ratio remains constant.
   # @define {String} options.mediaType="picture" Set the type of media to select from. Available media types:
   #  * "picture": Allow selection of still pictures only.
   #  * "video": Allow selection of video only, will always return "fileURI".
   #  * "allMedia": Allow selection from all media types.
   # @define {Boolean} options.correctOrientation=true Rotate the image to correct for the orientation of the device during capture.
   # @returnsDescription
   # Returns a [Promise](todo) that is resolved with the the image file URI (default) or Base64 encoding of the image data as an argument depending on the destinationType option.
   # @define {=>String} result Image file URI (default) or Base64 encoding of the image data as an argument depending on the destinationType option.
   # @usageCoffeeScript
   # supersonic.media.camera.getFromPhotoLibrary options
   # @exampleCoffeeScript
   # options =
   #   quality: 50
   #   allowEdit: true
   #   targetWidth: 300
   #   targetHeight: 300
   #   encodingType: "png"
   # supersonic.media.camera.getFromPhotoLibrary(options).then (result) ->
   #  # Do something with the image URI
  ###
  getFromPhotoLibrary = (options = {}) ->

    getCameraOptions = ->
      destinationType = if options?.destinationType?
        switch options.destinationType
          when "dataURL" then Camera.DestinationType.DATA_URL
          when "fileURI" then Camera.DestinationType.FILE_URI
          when "nativeURI" then Camera.DestinationType.NATIVE_URI
      else
        Camera.DestinationType.FILE_URI
  
      encodingType = if options?.encodingType?
        switch options.encodingType
          when "jpeg" then Camera.EncodingType.JPEG
          when "png" then Camera.EncodingType.PNG
      else
        Camera.EncodingType.JPEG
  
      mediaType = if options?.mediaType?
        switch options.mediaType
          when "picture" then Camera.MediaType.PICTURE
          when "video" then Camera.MediaType.VIDEO
          when "allMedia" then Camera.MediaType.ALLMEDIA
      else
        Camera.MediaType.PICTURE
  
      cameraOptions =
        sourceType: Camera.PictureSourceType.PHOTOLIBRARY
        quality: options?.quality || 100
        destinationType: destinationType
        allowEdit: options?.allowEdit? || false
        encodingType: encodingType
        targetWidth: options?.targetWidth
        targetHeight: options?.targetHeight
        mediaType: mediaType
        correctOrientation: options?.correctOrientation? || true
      
    deviceready
      .then(getCameraOptions)
      .then( (cameraOptions) ->
        new Promise (resolve, reject) ->
          navigator.camera.getPicture resolve, reject, cameraOptions
      )

   return {takePicture, getFromPhotoLibrary}

  
  