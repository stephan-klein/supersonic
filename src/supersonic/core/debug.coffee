Promise = require 'bluebird'

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.debug"

  ###*
   * @category core
   * @module debug
   * @name ping
   * @function
   * @description
   * Pings the native runtime.
   * @returns {Promise} A promise that gets resolved once the ping is successful. Resolves with the string `"Pong!"`.
   * @usage
   * ```coffeescript
   * supersonic.debug.ping().then (response) ->
   *   supersonic.logger.log response
   * ```
  ###
  ping: bug "ping", ->
    new Promise (resolve, reject) ->
      steroids.device.ping(
        {}
        {
          onSuccess: ->
            resolve "Pong!"
          onFailure: ->
            reject()
        }
      )
