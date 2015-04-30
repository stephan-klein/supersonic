adapters = require './storage/adapters'

# TODO Mistä Error tulee ?
class SessionValidationError extends Error

  constructor: (@message, @errors) ->
    Error.call @
    Error.captureStackTrace?(@, @constructor)
    @name = @constructor.name

  toString: ->
    "#{@name}(#{@message}, #{JSON.stringify @errors})"


class Session

  RAW_SESSION_KEY: "__ag:data:session"

  constructor: (window) ->
    @storage = new adapters.JsonLocalStorage(window)
    @rawSession = @storage.getItem @RAW_SESSION_KEY

  ## private

  isValid = (session) ->
    session.access_token? && session.user_details?.id?


  ## public

  set: (rawSession) ->
    unless isValid(rawSession)
      throw new SessionValidationError "Invalid data for session", rawSession

    @storage.setItem @RAW_SESSION_KEY, rawSession
    @rawSession = rawSession

  get: ->
    @rawSession || {}

  clear: ->
    @storage.removeItem @RAW_SESSION_KEY
    @rawSession = null

  getAccessToken: ->
    @get().access_token

  getUserId: ->
    @get().user_details.id


module.exports = Session
