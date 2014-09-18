Promise = require 'bluebird'
log = require '../core/logger'

module.exports = (steroids) ->
      
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
      log.debug "supersonic.steroids.app.splashscreen.show called"
      new Promise (resolve, reject) ->
        steroids.splashscreen.show(
          {}
          {
            onSuccess: ->
              log.debug "supersonic.steroids.app.splashscreen.show showed splaschscreen"
              resolve()
            onFailure: ->
              log.error "supersonic.steroids.app.splashscreen.show could not show splaschscreen"
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
      log.debug "supersonic.steroids.app.splashscreen.hide called"
      new Promise (resolve, reject) ->
        steroids.splashscreen.hide(
          {}
          {
            onSuccess: ->
              log.debug "supersonic.steroids.app.splashscreen.hide hid splashscreen"
              resolve()
            onFailure: ->
              log.error "supersonic.steroids.app.splashscreen.show could not hide splaschscreen"
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
    log.debug "supersonic.steroids.openURL called"
    new Promise (resolve, reject) ->
      successCallback = ->
        document.addEventListener "resume", ->
          log.debug "supersonic.steroids.openURL opened URL, the app is resumed"
          resolve()

      steroids.openURL(
        { url: url }
        {
          onSuccess: successCallback
          onFailure: ->
            log.error "supersonic.steroids.openURL could not open URL"
            reject()
        }
      )
