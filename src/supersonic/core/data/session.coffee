adapters = require './storage/adapters'

class SessionValidationError extends Error

  constructor: (@message, @errors) ->
    Error.call @
    Error.captureStackTrace?(@, @constructor)
    @name = @constructor.name

  toString: ->
    "#{@name}(#{@message}, #{JSON.stringify @errors})"


class Session

  RAW_SESSION_KEY: "__ag:data:session"
  rawSession: null

  constructor: (window) ->
    @storage = new adapters.JsonLocalStorage(window)

  ## private

  isValidRawSession = (session) ->
    session.access_token? && session.user_details?.id?

  validateSession = (rawSession) ->
    unless isValidRawSession(rawSession)
      throw new SessionValidationError "Invalid data for session", rawSession

  ## public

  set: (rawSession) =>
    validateSession rawSession
    @storage.setItem @RAW_SESSION_KEY, rawSession
    @rawSession = rawSession

  get: =>
    @rawSession ?= @storage.getItem @RAW_SESSION_KEY

  clear: =>
    @storage.removeItem @RAW_SESSION_KEY
    @rawSession = null

  getAccessToken: =>
    @get()?.access_token

  getUserId: =>
    @get()?.user_details?.id


module.exports = Session
