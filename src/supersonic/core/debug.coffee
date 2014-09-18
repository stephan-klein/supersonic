Promise = require 'bluebird'

module.exports = (steroids) ->

  ###*
   * @ngdoc method
   * @name ping
   * @module debug
   * @description
   * Pings the native runtime.
   * @returns {Promise} A promise that gets resolved once the ping is successful. Resolves with the string `"Pong!"`.
   * @usage
   * ```coffeescript
   * supersonic.debug.ping().then (response) ->
   *   supersonic.logger.log response
   * ```
  ###
  ping: ->
    supersonic.logger.log "supersonic.debug.ping called", "debug"

    new Promise (resolve, reject) ->
      steroids.device.ping(
        {}
        {
          onSuccess: ->
            supersonic.logger.log "supersonic.debug.ping got pong", "debug"
            Promise.resolve "Pong!"
          onFailure: ->
            supersonic.logger.log "supersonic.debug.ping could not get pong", "error"
            Promise.reject
        }
      )
