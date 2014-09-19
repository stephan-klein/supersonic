Promise = require 'bluebird'

module.exports = (steroids, log) ->

  ###*
   * @ngdoc overview
   * @name sleep
   * @module app
   * @description
   * Allows the user to turn the device automatic sleep on or off for your app.
  ###
    
  ###*
   * @ngdoc method
   * @name disable
   * @module sleep
   * @description
   * Disables the device automatic sleep for your app.
   * @returns {Promise} Promise that is resolved when the native side has successfully disabled sleep.
   * @usage
   * ```coffeescript
   * supersonic.app.sleep.disable()
   * ```
  ###
  disable: ->
    log.debug "supersonic.app.sleep.disable called"
    new Promise (resolve) ->
      steroids.device.disableSleep(
        {}
        {
          onSuccess: ->
            log.debug "supersonic.app.sleep.disable disabled sleep"
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
   * supersonic.app.sleep.enable()
   * ```
  ###
  enable: ->
    log.debug "supersonic.app.sleep.enable called"
    new Promise (resolve) ->
      steroids.device.enableSleep(
        {}
        {
          onSuccess: ->
            log.debug "supersonic.app.sleep.enable enabled sleep"
            resolve()
        }
      )
      