Promise = require 'bluebird'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.app.sleep"

  ###
   # @category core
   # @module app
   # @name sleep
   # @overview
   # @description
   # Allows the user to turn the device automatic sleep on or off for your app.
  ###
    
  ###
   # @module sleep
   # @name disable
   # @function
   # @description
   # Disables the device automatic sleep for your app.
   # @returns {Promise} Promise that is resolved when the native side has successfully disabled sleep.
   # @usage
   # ```coffeescript
   # supersonic.app.sleep.disable()
   # ```
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
  
  ###
   # @module sleep
   # @name enable
   # @function
   # @description
   # Enables the device automatic sleep for your app.
   # @returns {Promise} Promise that is resolved when the native side has successfully enabled sleep.
   # @usage
   # ```coffeescript
   # supersonic.app.sleep.enable()
   # ```
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
      