Promise = require 'bluebird'
superify = require '../superify'

module.exports = (steroids, log) ->
  s = superify 'supersonic.app.sleep', log
  ###
   # @namespace supersonic.app
   # @name sleep
   # @overview
   # @description
   # Allows the user to turn the device automatic sleep on or off for your app.
  ###

  ###
   # @namespace supersonic.app.sleep
   # @name disable
   # @function
   # @apiCall supersonic.app.sleep.disable
   # @description
   # Disables the device automatic sleep for your app.
   # @type
   # supersonic.app.sleep.disable: () =>
   #   Promise
   # @returnsDescription
   # A promise that is resolved when the native side has successfully disabled automatic sleep.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # supersonic.app.sleep.disable()
   # @exampleJavaScript
   # supersonic.app.sleep.disable();
  ###
  disable: s.promiseF "disable", ->
    new Promise (resolve) ->
      steroids.device.disableSleep(
        {}
        {
          onSuccess: ->
            resolve()
        }
      )

  ###
   # @namespace supersonic.app.sleep
   # @name enable
   # @function
   # @apiCall supersonic.app.sleep.enable
   # @description
   # enables the device automatic sleep for your app.
   # @type
   # supersonic.app.sleep.enable: () =>
   #   Promise
   # @returnsDescription
   # A promise that is resolved when the native side has successfully enabled automatic sleep.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # supersonic.app.sleep.enable()
   # @exampleJavaScript
   # supersonic.app.sleep.enable();
  ###
  enable: s.promiseF "enable", ->
    new Promise (resolve) ->
      steroids.device.enableSleep(
        {}
        {
          onSuccess: ->
            resolve()
        }
      )
