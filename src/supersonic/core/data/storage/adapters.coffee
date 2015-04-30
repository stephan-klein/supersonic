Promise = require('bluebird')

# KLUDGE: localforage explodes if actually included in node
localforage = switch
  when !window? then { getItem: -> Promise.resolve() }
  else require 'localforage'

data = require 'ag-data'

JsonLocalStorage = require './adapters/JsonLocalStorage'

module.exports = {
  localforage: -> localforage
  memory: data.storages.memory
  JsonLocalStorage
}
