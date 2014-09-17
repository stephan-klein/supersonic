supersonic = require './supersonic/core'

module.exports = supersonic

if !window
  window =
    supersonic: supersonic
# TODO: Think about moving this into class
window.supersonic.logger.queue.autoFlush(100)

# Declare the angular module if angular is present
if (angular?)
  require('./supersonic/angular')(angular)
