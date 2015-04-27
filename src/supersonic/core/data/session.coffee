types = require 'ag-types'

module.exports = (logger, createStoredProperty) ->
  sessionStorage = createStoredProperty "__ag:data:session"

  SessionType = do ({Object, String} = types) ->
    Object
      accessToken: String

  {
    set: (v) -> SessionType(v).map(sessionStorage.set).get()
    get: (v) -> sessionStorage.get()
    unset: -> sessionStorage.unset()
    values: sessionStorage.values
  }
