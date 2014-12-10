Bacon = require 'baconjs'

module.exports = (logger, window, channel) ->

  class LocalStorageProperty
    values: null
    _channel: null

    constructor: (@name) ->
      @_channel = channel "supersonic.data.storage.property(#{@name})"
      @values = @_channel.outbound.merge(@_channel.inbound)
        .toProperty(true)
        .map(=>
          @get()
        )

    set: (value) =>
      window.localStorage.setItem @name, JSON.stringify value
      @_channel.publish true
      this

    get: =>
      value = window.localStorage.getItem @name
      if value?
        JSON.parse value
      else
        null

    unset: =>
      window.localStorage.removeItem @name
      @_channel.publish true
      this

  
  return createLocalStorageProperty = (name) ->
    new LocalStorageProperty name
