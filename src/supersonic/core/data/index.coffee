
Promise = require 'bluebird'

module.exports = (logger, window) ->
  channel = require('./channel')(window)
  property = require('./storage/property')(logger, window, channel)
  adapters = require('./storage/adapters')(window)

  syncLocalStorage = require('./storage/adapters/sync-local-storage')(window)
  session = require('./session')(syncLocalStorage)

  defaultAsyncStorageAdapter = adapters.localStorage

  model = require('./model')(logger, window, defaultAsyncStorageAdapter, session)
  storage = { adapters, property }

  { channel, model, storage, session }
