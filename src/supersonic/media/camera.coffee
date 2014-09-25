Promise = require 'bluebird'

{deviceready} = require '../events'

###*
 * @ngdoc method
 * @name prompt
 * @module notification
 * @description
 * Shows a native prompt dialog.
 * @param {string} message confirm message.
 * @param {Object} options an options object (optionals). The following properties are available:
 * * `title`: dialog title (optional, defaults to "Confirm")
 * * `buttonLabels`: array of strings specifying button labels (optional, defaults to ["OK","Cancel"]).
 * * `defaultText`: default textbox input value (optional, defaults to an empty string)
 * @returns {Promise} Promise that is resolved with an object as an argument. The argument object has the following properties:
 * * `buttonIndex`: index of the pressed button
 * * `input`: input string
 * @usage
 * ```coffeescript
 * # Basic usage
 * supersonic.notification.prompt("This is a prompt. Type something")
 *
 * # With options
 * supersonic.notification.prompt("I'm a prompt!", {
 *   title: "Custom Title"
 *   buttonLabels: ["Yes", "No", "Cancel"]
 *   defaultText: "Type here"
 * })
 * ```
###
module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.media.camera"

  takePicture = (options = {}) ->
    cameraOptions =
      quality: options?.quality? || 100
      destinationType: Camera.DestinationType.FILE_URI
      allowEdit: options?.allowEdit? || false
      encodingType: Camera.EncodingType.JPEG
      targetWidth: options.targetWidth
      targetHeight: options.targetHeight
      mediaType: 0
      correctOrientation: true
      saveToPhotoAlbum: options?.saveToPhotoAlbum? || false
      cameraDirection: options?.cameraDirection? || null
  
    deviceready
      .then(->
        new Promise (resolve, reject) ->
          navigator.camera.getPicture resolve, reject, cameraOptions
      )

  getFromPhotoLibrary = (options = {}) ->
    cameraOptions =
      quality: options?.quality? || 100
      destinationType: options?.destinationType? || Camera.DestinationType.FILE_URI
      sourceType: Camera.PictureSourceType.PHOTOLIBRARY
      allowEdit: options?.allowEdit? || false
      encodingType: Camera.EncodingType.JPEG
      targetWidth: options.targetWidth
      targetHeight: options.targetHeight
      mediaType: options?.mediaType? || 0
      correctOrientation: true
      saveToPhotoAlbum: options?.saveToPhotoAlbum? || false
      popoverOptions: {}
  
    deviceready
      .then(->
        new Promise (resolve, reject) ->
          navigator.camera.getPicture resolve, reject, cameraOptions
      )

   return {takePicture, getFromPhotoLibrary}

  
  