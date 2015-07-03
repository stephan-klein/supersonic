Promise = require('bluebird')
data = require 'ag-data'

# KLUDGE: localforage explodes if actually included in node
localforage = switch
  when !window? then { getItem: -> Promise.resolve() }
  else require 'localforage'

module.exports = (window) ->
  localStorage = require('./adapters/async-local-storage')(window)

  localforage: -> localforage
  localStorage: -> localStorage
  memory: data.storages.memory
