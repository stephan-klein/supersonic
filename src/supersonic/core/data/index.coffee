adapters = require './storage/adapters'

module.exports = (logger, window) ->
  channel = require('./channel')(window)
  property = require('./storage/property')(logger, window, channel)
  session = require('./session')(logger, property)

  defaultAsyncStorageAdapter = adapters.localforage
  getDefaultSession = -> session

  model = require('./model')(logger, window, defaultAsyncStorageAdapter, getDefaultSession)
  storage = { adapters, property }

  { channel, model, storage, session }
