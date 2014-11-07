Promise = require 'bluebird'

{network} = require '../events'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.device.network"

  ###
   # @namespace supersonic.device.network
   # @name whenOffline
   # @function
   # @apiCall supersonic.device.network.whenOffline
   # @description
   # Detect when device goes offline
   # @type
   # supersonic.device.network.whenOffline: () => unsubscribe: Function
   # @define {Function} unsubscribe Stop listening
   # @usageCoffeeScript
   # supersonic.device.network.whenOffline()
   # @exampleCoffeeScript
   # supersonic.device.network.whenOffline().then ->
   #   steroids.logger.log("Device is offline")
  ###
  whenOffline: (f)->
    whenOffline = null
    network
      .map((status) ->
        if status
          ->
            whenOffline?()
            whenOffline = null
        else
          ->
            whenOffline = f()

      )
      .onValue (notify) ->
        setTimeout notify, 0

  ###
   # @namespace supersonic.device.network
   # @name whenOnline
   # @function
   # @apiCall supersonic.device.network.whenOnline
   # @description
   # Detect when device goes online
   # @type
   # supersonic.device.network.whenOnline: () => unsubscribe: Function
   # @define {Function} unsubscribe Stop listening
   # @usageCoffeeScript
   # supersonic.device.network.whenOnline()
   # @exampleCoffeeScript
   # supersonic.device.network.whenOnline().then ->
   #   steroids.logger.log("Device is online")
  ###
  whenOnline: (f)->
    whenOnline = null
    network
      .map((status) ->
        if status
          ->
            whenOnline = f()
        else
          ->
            whenOnline?()
            whenOnline = null
      )
      .onValue (notify) ->
        setTimeout notify, 0
