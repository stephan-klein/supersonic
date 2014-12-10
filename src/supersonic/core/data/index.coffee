
module.exports = (logger, window) ->
  channel = require('./channel')(window)
  model = require('./model')(logger, window)
  storage =
    property: require('./storage/property')(logger, window, channel)
  
  { channel, model, storage }
