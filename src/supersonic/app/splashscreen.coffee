Promise = require 'bluebird'
logger = require '../core/logger'

module.exports = (steroids) ->
  log = logger steroids

  ###*
   * @ngdoc overview
   * @name splashscreen
   * @module app
   * @description
   * The splashscreen is shown in the application startup. The initial splashscreen is hidden automatically after 3 seconds on iOS and on the pageload event on Android. Allows the user to hide and show the splashscreen programmitically. The splashscreen is defined in your project's build configuration.
  ###
  

  ###*
   * @ngdoc method
   * @name show
   * @module splashscreen
   * @description
   * Shows the splashscreen programmatically.
   * @returns {Promise} Promise that is resolved when the splashscreen is shown.
   * @usage
   * ```coffeescript
   * supersonic.app.splashscreen.show()
   * ```
  ###
  show: ->
    log.debug "supersonic.app.splashscreen.show called"
    new Promise (resolve, reject) ->
      steroids.splashscreen.show(
        {}
        {
          onSuccess: ->
            log.debug "supersonic.app.splashscreen.show showed splaschscreen"
            resolve()
          onFailure: ->
            log.error "supersonic.app.splashscreen.show could not show splaschscreen"
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
   * supersonic.app.splashscreen.hide()
   * ```
  ###
  hide: ->
    log.debug "supersonic.app.splashscreen.hide called"
    new Promise (resolve, reject) ->
      steroids.splashscreen.hide(
        {}
        {
          onSuccess: ->
            log.debug "supersonic.app.splashscreen.hide hid splashscreen"
            resolve()
          onFailure: ->
            log.error "supersonic.app.splashscreen.show could not hide splaschscreen"
            reject()
        }
      )
