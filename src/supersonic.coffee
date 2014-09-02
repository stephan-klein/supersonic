Promise = require 'bluebird'

supersonic =
  ping: ->
    Promise.resolve "Pong!"

module.exports = supersonic

if (window?)
  window.supersonic = supersonic
