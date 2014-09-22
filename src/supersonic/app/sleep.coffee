Promise = require 'bluebird'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.app.sleep"

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
  disable: bug "disable", ->
    new Promise (resolve) ->
      steroids.device.disableSleep(
        {}
        {
          onSuccess: ->
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
  enable: bug "enable", ->
    new Promise (resolve) ->
      steroids.device.enableSleep(
        {}
        {
          onSuccess: ->
            resolve()
        }
      )
      