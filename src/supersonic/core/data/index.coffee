adapters = require './storage/adapters'

module.exports = (logger, window) ->
  channel = require('./channel')(window)
  model = require('./model')(logger, window, adapters.localforage)
  storage =
    adapters: adapters
    property: require('./storage/property')(logger, window, channel)

  { channel, model, storage }
