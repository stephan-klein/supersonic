Promise = require 'bluebird'

module.exports = (window) ->
  localStorageAdapter = require('./sync-local-storage')(window)

  getItem: (key) -> Promise.resolve localStorageAdapter.getItem key
  setItem: (key, value) -> Promise.resolve localStorageAdapter.setItem key, value
  removeItem: (key) -> Promise.resolve localStorageAdapter.removeItem key
  keys: -> Promise.resolve localStorageAdapter.keys()
