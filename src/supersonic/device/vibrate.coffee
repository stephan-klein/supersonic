Promise = require 'bluebird'

{deviceready} = require '../events'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.device.platform"

  ###
   # @category core
   # @module device
   # @name vibrate
   # @function
   # @apiCall supersonic.device.vibrate
   # @description
   # Vibrates the device.
   # @type
   # supersonic.device.vibrate : ()
   # @usageCoffeeScript
   # supersonic.device.vibrate()
  ###

  vibrate = ->
    deviceready.then ->
      navigator.notification.vibrate()

  return vibrate
