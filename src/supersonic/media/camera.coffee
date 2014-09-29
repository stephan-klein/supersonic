Promise = require 'bluebird'

{deviceready} = require '../events'
###*
   * @ngdoc overview
   * @name camera
   * @module media
   * @description
   * Provides access to the device's default camera application.
  ###

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.media.camera"

  ###*
   * @ngdoc method
   * @name takePicture
   * @module camera
   * @description
   * Opens the device's default camera application that allows users to take pictures. Once the user takes the photo, the camera application closes and the application is restored.
   * @param {Object} [options] an options object (optional). The following properties are available:
   * * `quality`: Quality of the saved image (Number), expressed as a range of 0-100, where 100 is typically full resolution with no loss from file compression. Defaults to 100.
   * * `destinationType`: Choose the format of the return value (Number). Available formats:
   *  * "dataURL": Return image as base64-encoded string
   *  * "fileURI": Return image file URI (default)
   *  * "nativeURI": Return image native URI (e.g., assets-library:// on iOS or content:// on Android)
   * * `allowEdit`:  Allow simple editing of image before selection (Boolean). Defaults to `false`. Note that Android ignores the `allowEdit parameter.
   * * `encodingType`: Choose the returned image file's encoding. Available encoding types:
   *  * "jpeg": Return JPEG encoded image (default).
   *  * "png": Return PNG encoded image.
   * * `targetWidth`: Target width in pixels to scale image. Must be used with `targetHeight`. Aspect ratio remains constant.
   * * `targetHeight`: Target height in pixels to scale image. Must be used with `targetWidth`. Aspect ratio remains constant.
   * * `correctOrientation`: Rotate the image to correct for the orientation of the device during capture (Boolean). Defaults to `true`.
   * * `saveToPhotoAlbum`: Save the image to the photo album on the device after capture (Boolean). Defaults to `false`.
   * * `cameraDirection`: Choose the camera to use (front- or back-facing). Note that any `cameraDirection` value results in a back-facing photo on Android. Available directions:
   *  * "back": Use the back-facing camera (default).
   *  * "front": Use the front-facing camera.
   * @returns {Promise} Promise that is resolved with the the image file URI (default) or Base64 encoding of the image data as an argument depending on the `destinationType` option.
   * @usage
   * ```coffeescript
   * # Basic usage
   * supersonic.media.camera.takePicture(300, 300)
   *
   * # With options
   * supersonic.media.camera.takePicture(300, 300 {
   *   quality: 50
   *   allowEdit: true
   *   encodingType: "png"
   *   saveToPhotoAlbum: true
   * })
   * ```
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

  ###*
   * @ngdoc method
   * @name getFromPhotoLibrary
   * @module camera
   * @description
   * Displays a dialog that allows users to select an existing image. Once the user selects the photo, the camera application closes and the application is restored.
   * @param {Object} [options] an options object (optional). The following properties are available:
   * * `quality`: Quality of the saved image (Number), expressed as a range of 0-100, where 100 is typically full resolution with no loss from file compression. Defaults to 100.
   * * `destinationType`: Choose the format of the return value. Available formats:
   *  * "dataURL": Return image as base64-encoded string
   *  * "fileURI": Return image file URI (default)
   *  * "nativeURI": Return image native URI (e.g., assets-library:// on iOS or content:// on Android)
   * * `allowEdit`:  Allow simple editing of image before selection (Boolean). Defaults to `false`. Note that Android ignores the `allowEdit parameter.
   * * `encodingType`: Choose the returned image file's encoding. Available encoding types:
   *  * "jpeg": Return JPEG encoded image (default).
   *  * "png": Return PNG encoded image.
   * * `targetWidth`: Target width in pixels to scale image. Must be used with `targetHeight`. Aspect ratio remains constant.
   * * `targetHeight`: Target height in pixels to scale image. Must be used with `targetWidth`. Aspect ratio remains constant.
   * * `mediaType`: Set the type of media to select from. Available media types:
   *  * "picture": Allow selection of still pictures only (default).
   *  * "video": Allow selection of video only, will always return "fileURI".
   *  * "allMedia": Allow selection from all media types.
   * * `correctOrientation`: Rotate the image to correct for the orientation of the device during capture (Boolean). Defaults to `true`.
   * * `popoverOptions`: NOT SUPPORTED
   * @returns {Promise} Promise that is resolved with the the image file URI (default) or Base64 encoding of the image data as an argument depending on the `destinationType` option.
   * @usage
   * ```coffeescript
   * # Basic usage
   * supersonic.media.camera.getFromPhotoLibrary(300, 300)
   *
   * # With options
   * supersonic.media.camera.getFromPhotoLibrary(300, 300 {
   *   quality: 50
   *   allowEdit: true
   *   encodingType: "png"
   * })
   * ```
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

  
  