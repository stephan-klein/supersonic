adapters = require './storage/adapters'
Session = require('./session')

module.exports = (logger, window) ->
  channel = require('./channel')(window)
  property = require('./storage/property')(logger, window, channel)
  session = new Session(window)

  defaultAsyncStorageAdapter = adapters.localforage

  model = require('./model')(logger, window, defaultAsyncStorageAdapter, session)
  storage = { adapters, property }

  { channel, model, storage, session }
