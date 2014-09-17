# Fake steroids for tests
if !steroids
  steroids =
    device:
      ping: ->

Promise = require 'bluebird'

module.exports =

  ###*
   * @ngdoc method
   * @name ping()
   * @module debug
   * @description
   * Pings the native runtime.
   * @returns {Promise} A promise that gets resolved once the ping is successful. Resolves with the string `"Pong!"`.
   * @usage
   * ```coffeescript
   * supersonic.debug.ping().then (response) ->
   *   console.log response
   * ```
  ###
  ping: ->
    steroids.device.ping(
      {}
      {
        onSuccess: Promise.resolve "Pong!"
        onFailure: Promise.reject
      }
    )
