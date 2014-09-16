Promise = require 'bluebird'

module.exports =

  ###*
   * @ngdoc service
   * @name supersonic.debug:ping
   * @function
   *
   * @description
   * Checks promise resolving
  ###
  ping: ->
    steroids.device.ping(
      {}
      {
        onSuccess: Promise.resolve "Pong!"
        onFailure: Promise.reject
      }
    )
