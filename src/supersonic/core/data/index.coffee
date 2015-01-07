# KLUDGE: localforage explodes if actually included in node
localforage = switch
  when !window? then {}
  else require 'localforage'

module.exports = (logger, window) ->
  channel = require('./channel')(window)
  model = require('./model')(logger, window, localforage)
  storage =
    adapter:
      localforage
    property: require('./storage/property')(logger, window, channel)
  
  { channel, model, storage }
