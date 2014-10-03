Promise = require 'bluebird'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.ui.screen"

  ###*
   * @category core
   * @module ui
   * @name screen
   * @overview
   * @description
   * Methods and properties to control the visible part of the application.
  ###

  ###*
   * @module screen
   * @name setAllowedRotations
   * @function
   * @description
   * Determine which of the four possible screen rotations are enabled on your device. By default all rotations are allowed, with the exception of custom builds where the build settings have been used to lock the app into a certain rotation scheme. Modals are not affected by setting allowed rotations in other views and conversely setting allowed rotations in a modal does not affect the rest of the app.
   * @params {Array} orientations Shorthand. Possible values "portrait", "portraitUpsideDown", "landscapeLeft", "landscapeRight".
   * @params {Object} options Verbose. Options object with an `orientations` property (Array of accepted rotations)
   * @returns {Promise} Promise that is resolved when the allowed rotations are set.
   * @usage
   * ```coffeescript
   * # Shorthand:
   * supersonic.ui.screen.setAllowedRotations(["landscapeLeft"])
   * # Verbose:
   * options =
   *  orientations: ["portrait", "portraitUpsideDown", "landscapeLeft", "landscapeRight"]
   * supersonic.ui.screen.setAllowedRotations(options)
   * ```
  ###
  setAllowedRotations: bug "setAllowedRotations", (options) ->
    orientations = if options instanceof Array
      options
    else if options?.orientations?
      options.orientations
    else

    new Promise (resolve, reject) ->
      steroids.screen.setAllowedRotations(
        {
          allowedRotations: orientations
        }
        {
          onSuccess: resolve
          onFailure: reject
        }
      )

  ###*
   * @module screen
   * @name rotateTo
   * @function
   * @description
   * Rotate the screen to one of the four preset orientations. Allowed rotations must be set with `supersonic.ui.screen.setAllowedRotations`, or the call to supersonic.ui.screen.rotate will fail.
   * @returns {Promise} Promise that is resolved when the screen is rotated.
   * @params {string} orientation  Shorthand. Possible values "portrait", "portraitUpsideDown", "landscapeLeft", "landscapeRight"
   * @params {Object} options Verbose. Options object with an `orientation` property (string representation of desired orientation)
   * @usage
   * ```coffeescript
   * # Shorthand
   * supersonic.ui.screen.rotateTo("landscapeLeft")
   * #Verbose
   * options =
   *  orientation: "landscapeLeft"
   * supersonic.ui.screen.rotateTo(options)
   * ```
  ###
  rotateTo: bug "rotateTo", (options) ->
    orientations = if typeof options is "string"
      options
    else if options?.orientation?
      options.orientation
    else

    new Promise (resolve, reject) ->
      steroids.screen.rotate(
        {
          orientation: orientations
        }
        {
          onSuccess: resolve
          onFailure: reject
        }
      )
