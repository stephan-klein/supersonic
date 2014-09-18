supersonic = require './supersonic/core'

module.exports = supersonic

# Declare the angular module if angular is present
if (window?.angular?)
  require('./supersonic/angular')(window.angular)
