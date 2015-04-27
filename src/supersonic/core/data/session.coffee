types = require 'ag-types'

module.exports = (logger, createStoredProperty) ->
  sessionStorage = createStoredProperty "__ag:data:session"

  SessionType = do ({Object, Optional, Any, String} = types) ->
    Object
      accessToken: String

  setSession = (v) ->
    SessionType(v).map(sessionStorage.set).get()

  getSession = ->
    sessionStorage.get()

  unsetSession = ->
    sessionStorage.unset()

  {
    set: setSession
    get: getSession
    unset: unsetSession
    values: sessionStorage.values
    getAccessToken: ->
      getSession()?.accessToken
  }
