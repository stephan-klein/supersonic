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
    Promise.resolve "Pong!"
