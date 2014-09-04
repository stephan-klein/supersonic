Promise = require 'bluebird'

module.exports =
  ping: ->
    Promise.resolve "Pong!"
