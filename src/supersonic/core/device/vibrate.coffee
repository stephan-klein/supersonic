Promise = require 'bluebird'

{deviceready} = require '../events'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.device.platform"

  ###
   # @namespace core.device
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

  vibrate = ->
    deviceready.then ->
      navigator.notification.vibrate()

  return vibrate
