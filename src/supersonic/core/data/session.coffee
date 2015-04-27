types = require 'ag-types'

module.exports = (logger, createStoredProperty) ->
  sessionStorage = createStoredProperty "__ag:data:session"

  SessionType = do ({Object, Optional, String} = types) ->
    Object
      accessToken: String
      user: Object
        id: String

  class SessionValidationError extends Error
    constructor: (@message, @errors) ->
      Error.call @
      Error.captureStackTrace(@, @constructor)
      @name = @constructor.name

    toString: ->
      "#{@name}(#{@message}, #{JSON.stringify @errors})"

  setSession = (v) ->
    SessionType(v).map(sessionStorage.set).fold(
      (errors) -> throw new SessionValidationError "Could not set session", errors
      -> session
    )

  getSession = ->
    sessionStorage.get()

  unsetSession = ->
    sessionStorage.unset()

  return session = {
    set: setSession
    get: getSession
    unset: unsetSession
    values: sessionStorage.values
    getAccessToken: ->
      getSession()?.accessToken
    getUserId: ->
      getSession()?.user.id
  }
