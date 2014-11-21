Promise = require 'bluebird'
superify = require '../superify'

module.exports = (steroids, log) ->
  s = superify 'supersonic.debug', log
  ###
   # @namespace supersonic.debug
   # @name ping
   # @function
   # @apiCall supersonic.debug.ping
   # @description
   # Pings the native runtime.
   # @type
   # supersonic.debug.ping : ()
   # => Promise response: String
   # @returnsDescription
   # Returns a Promise that that gets resolved once the ping is successful. Resolves with the string `"Pong!"`.
   # @define {=>String} response The string "Pong!".
   # @supportsCallbacks
   # @exampleCoffeeScript
   # supersonic.debug.ping().then (response) ->
   #   supersonic.logger.log response
   # @exampleJavaScript
   # supersonic.debug.ping().then(function(response) {
   #   supersonic.logger.log(response);
   # });
  ###
  ping = s.promiseF "ping", ->
    new Promise (resolve, reject) ->
      steroids.device.ping(
        {}
        {
          onSuccess: ->
            resolve "Pong!"
          onFailure: ->
            reject new Error "Did not pong :("
        }
      )

  return ping
