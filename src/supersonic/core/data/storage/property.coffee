
module.exports = (logger, window, channel) ->

  class LocalStorageProperty
    constructor: (@name) ->

    set: (value) ->
      window.localStorage.setItem @name, JSON.stringify value
      this

    get: ->
      value = window.localStorage.getItem @name
      if value?
        JSON.parse value
      else
        null

    unset: ->
      localStorage.removeItem @name
      this

  
  return createLocalStorageProperty = (name) ->
    new LocalStorageProperty name