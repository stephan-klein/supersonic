adapters = require './storage/adapters'

module.exports = (logger, window) ->
  channel = require('./channel')(window)
  property = require('./storage/property')(logger, window, channel)

  model = require('./model')(logger, window, adapters.localforage, ->
    { property }
  )
  storage = { adapters, property }

  { channel, model, storage }
