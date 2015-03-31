# KLUDGE: localforage explodes if actually included in node
localforage = switch
  when !window? then {}
  else require 'localforage'

data = require 'ag-data'

module.exports = {
  localforage: -> localforage
  memory: data.storages.memory
}
