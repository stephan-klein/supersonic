Promise = require 'bluebird'

{deviceready} = require '../events'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.device.platform"

  ###
   # @namespace supersonic.device
   # @name vibrate
   # @function
   # @apiCall supersonic.device.vibrate
   # @description
   # Vibrates the device.
   # @type
   # supersonic.device.vibrate : ()
   # @usageCoffeeScript
   # supersonic.device.vibrate()
   # @usageJavaScript
   # supersonic.device.vibrate();
  ###

  vibrate = (ms=1000)->
    deviceready.then ->
      navigator.notification.vibrate(ms)

  return vibrate
