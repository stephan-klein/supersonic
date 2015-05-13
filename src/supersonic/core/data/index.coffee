adapters = require './storage/adapters'
Session = require('./session')
Promise = require 'bluebird'

module.exports = (logger, window) ->
  channel = require('./channel')(window)
  property = require('./storage/property')(logger, window, channel)
  session = new Session(window)

  defaultAsyncStorageAdapter = ->
    getItem: (key) -> Promise.resolve window.localStorage.getItem key
    setItem: (key, value) -> Promise.resolve window.localStorage.setItem key, value
    removeItem: (key) -> Promise.resolve window.localStorage.removeItem key

  model = require('./model')(logger, window, defaultAsyncStorageAdapter, session)
  storage = { adapters, property }

  { channel, model, storage, session }
