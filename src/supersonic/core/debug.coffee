Promise = require 'bluebird'
logger = require '../core/logger'

module.exports = (steroids) ->
  log = logger steroids

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
   *   supersonic.logger.log response
   * ```
  ###
  ping: ->
    log.debug "supersonic.debug.ping called"

    new Promise (resolve, reject) ->
      steroids.device.ping(
        {}
        {
          onSuccess: ->
            log.debug "supersonic.debug.ping got pong"
            resolve "Pong!"
          onFailure: ->
            log.error "supersonic.debug.ping could not get pong"
            reject()
        }
      )
