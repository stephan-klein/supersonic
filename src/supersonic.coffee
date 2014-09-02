Promise = require 'bluebird'

supersonic =
  ping: ->
    Promise.resolve "Pong!"

module.exports = supersonic

# Export to window as global if we're in the browser
if (window?)
  window.supersonic = supersonic

# Declare the angular module if angular is present
if (angular?)
  require('./supersonic/angular')(angular, supersonic)
