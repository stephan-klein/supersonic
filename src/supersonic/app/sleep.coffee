Promise = require 'bluebird'

module.exports = (steroids) ->

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
    supersonic.logger.log "supersonic.app.sleep.disable called", "debug"
    new Promise (resolve) ->
      steroids.device.disableSleep(
        {}
        {
          onSuccess: ->
            supersonic.logger.log "supersonic.app.sleep.disable disabled sleep", "debug"
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
    supersonic.logger.log "supersonic.app.sleep.enable called", "debug"
    new Promise (resolve) ->
      steroids.device.enableSleep(
        {}
        {
          onSuccess: ->
            supersonic.logger.log "supersonic.app.sleep.enable enabled sleep", "debug"
            resolve()
        }
      )
      