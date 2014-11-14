Promise = require 'bluebird'

{deviceready} = require '../events'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.device.ready"

  ###
   # @namespace supersonic.device
   # @name ready
   # @function
   # @apiCall supersonic.device.ready
   # @description
   # Find out when device is ready for plugins etc.
   # @type
   # supersonic.device.ready : => Promise
   # @usageCoffeeScript
   # supersonic.device.ready.then ->
   # @usageJavaScript
   # supersonic.device.ready.then( function() {});
   # @exampleCoffeeScript
   # supersonic.device.ready.then ->
   #   supersonic.logger.log "READY!"
   # @exampleJavaScript
   # supersonic.device.ready.then( function() {
   #   supersonic.logger.log("READY!");
   # });
  ###
  return deviceready
