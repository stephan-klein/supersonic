Promise = require('bluebird')
data = require 'ag-data'

module.exports = (window) ->
  localStorage = require('./adapters/async-local-storage')(window)

  localforage: -> throw new Error "lol"
  localStorage: -> localStorage
  memory: data.storages.memory
