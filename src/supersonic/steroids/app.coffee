Promise = require 'bluebird'

module.exports = (steroids) ->

  ###*
   * @ngdoc method
   * @name getLaunchURL
   * @module app
   * @description
   * Returns the string that was used to launch the application with URL scheme.
   * @returns {Promise} Promise that is resolved with the launch URL string as an argument when the application was launched using an URL schema.
   * @usage
   * ```coffeescript
   * supersonic.steroids.app.getLaunchURL()
   * ```
  ###
  getLaunchURL: ->
    supersonic.logger.log "supersonic.steroids.app.getLaunchURL called", "debug"
    new Promise (resolve, reject) ->
      launchURL = steroids.app.getLaunchURL()
      if launchURL?
        supersonic.logger.log "supersonic.steroids.app.getLaunchURL got #{launchURL}", "debug"
        resolve launchURL
      else
        supersonic.logger.log "supersonic.steroids.debug.ping didn't get a launch URL", "error"
        reject()

  ###*
   * @ngdoc overview
   * @name sleep
   * @module app
   * @description
   * Allows the user to turn the device automatic sleep on or off for your app.
  ###
  sleep:
    
    ###*
     * @ngdoc method
     * @name disable
     * @module sleep
     * @description
     * Disables the device automatic sleep for your app.
     * @returns {Promise} Promise that is resolved when the native side has successfully disabled sleep.
     * @usage
     * ```coffeescript
     * supersonic.steroids.app.sleep.disable()
     * ```
    ###
    disable: ->
      supersonic.logger.log "supersonic.steroids.app.sleep.disable called", "debug"
      new Promise (resolve) ->
        steroids.device.disableSleep(
          {}
          {
            onSuccess: ->
              supersonic.logger.log "supersonic.steroids.app.sleep.disable disabled sleep", "debug"
              resolve()
          }
        )

    ###*
     * @ngdoc method
     * @name enable
     * @module sleep
     * @description
     * Enables the device automatic sleep for your app.
     * @returns {Promise} Promise that is resolved when the native side has successfully enabled sleep.
     * @usage
     * ```coffeescript
     * supersonic.steroids.app.sleep.enable()
     * ```
    ###
    enable: ->
      supersonic.logger.log "supersonic.steroids.app.sleep.enable called", "debug"
      new Promise (resolve) ->
        steroids.device.enableSleep(
          {}
          {
            onSuccess: ->
              supersonic.logger.log "supersonic.steroids.app.sleep.enable enabled sleep", "debug"
              resolve()
          }
        )
      
  ###*
   * @ngdoc overview
   * @name splashscreen
   * @module app
   * @description
   * The splashscreen is shown in the application startup. The initial splashscreen is hidden automatically after 3 seconds on iOS and on the pageload event on Android. Allows the user to hide and show the splashscreen programmitically. The splashscreen is defined in your project's build configuration.
  ###
  splashscreen:

    ###*
     * @ngdoc method
     * @name show
     * @module splashscreen
     * @description
     * Shows the splashscreen programmatically.
     * @returns {Promise} Promise that is resolved when the splashscreen is shown.
     * @usage
     * ```coffeescript
     * supersonic.steroids.app.splashscreen.show()
     * ```
    ###
    show: ->
      supersonic.logger.log "supersonic.steroids.app.splashscreen.show called", "debug"
      new Promise (resolve, reject) ->
        steroids.splashscreen.show(
          {}
          {
            onSuccess: ->
              supersonic.logger.log "supersonic.steroids.app.splashscreen.show showed splaschscreen", "debug"
              resolve()
            onFailure: ->
              supersonic.logger.log "supersonic.steroids.app.splashscreen.show could not show splaschscreen", "error"
              reject()
          }
        )

    ###*
     * @ngdoc method
     * @name hide
     * @module splashscreen
     * @description
     * Hides the splashscreen programmatically.
     * @returns {Promise} Promise that is resolved when the splashscreen is hidden.
     * @usage
     * ```coffeescript
     * supersonic.steroids.app.splashscreen.hide()
     * ```
    ###
    hide: ->
      supersonic.logger.log "supersonic.steroids.app.splashscreen.hide called", "debug"
      new Promise (resolve, reject) ->
        steroids.splashscreen.hide(
          {}
          {
            onSuccess: ->
              supersonic.logger.log "supersonic.steroids.app.splashscreen.hide hid splashscreen", "debug"
              resolve()
            onFailure: ->
              supersonic.logger.log "supersonic.steroids.app.splashscreen.show could not hide splaschscreen", "error"
              reject()
          }
        )

  ###*
   * @ngdoc method
   * @name openURL
   * @module app
   * @description
   * Launches browser to open the URL or any external application with that applications URL scheme.
   * @param {string} URL to open. URLs starting with "http(s)://" will be opened in the device's browser.
   * @returns {Promise} Promise that is resolved when the application is resumed.
   * @usage
   * ```coffeescript
   * supersonic.app.openURL("http://www.google.com")
   * supersonic.app.openURL("otherapp://?foo=1&bar=2")
   * ```
  ###
  openURL: (url) ->
    supersonic.logger.log "supersonic.steroids.openURL called", "debug"
    new Promise (resolve, reject) ->
      successCallback = ->
        document.addEventListener "resume", ->
          supersonic.logger.log "supersonic.steroids.openURL opened URL, the app is resumed", "debug"
          resolve()

      steroids.openURL(
        { url: url }
        {
          onSuccess: successCallback
          onFailure: ->
            supersonic.logger.log "supersonic.steroids.openURL could not open URL", "error"
            reject()
        }
      )
