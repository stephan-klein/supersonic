
supersonic = require './supersonic/core'

module.exports = supersonic

# Declare the angular module if angular is present
if (angular?)
  require('./supersonic/angular')(angular)
