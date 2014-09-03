Promise = require 'bluebird'

core =
  ping: ->
    Promise.resolve "Pong!"

module.exports = core

# Export to window as global if we're in the browser
if (window?)
  window.supersonic = core
