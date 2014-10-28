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
   # @apiCall supersonic.app.sleep.disable
   # @description
   # Disables the device automatic sleep for your app.
   # @type
   # supersonic.app.sleep.disable: ()
   # => Promise
   # @returnsDescription
   # [Promise](todo) that is resolved when the native side has successfully disabled sleep.
   # @usageCoffeeScript
   # supersonic.app.sleep.disable()
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
   # @apiCall supersonic.app.sleep.enable
   # @description
   # enables the device automatic sleep for your app.
   # @type
   # supersonic.app.sleep.enable: ()
   # => Promise
   # @returnsDescription
   # [Promise](todo) that is resolved when the native side has successfully enabled sleep.
   # @usageCoffeeScript
   # supersonic.app.sleep.enable()
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
      