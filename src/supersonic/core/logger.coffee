Promise = require 'bluebird'
Bacon = require 'baconjs'

# (window) -> (level: string) -> (message: object) -> LeveledLogMessageEnvelope
logMessageEnvelope = (window) -> (level) -> (message) ->
  {
    message: try
        JSON.stringify message
      catch e
        e.toString()
    date: new Date().toString()
    level: level
    location: window.location.href
    screen_id: window.AG_SCREEN_ID
    layer_id: window.AG_LAYER_ID
    view_id: window.AG_VIEW_ID
  }

# (messageStream: Bacon.Bus(LogMessageEnvelope)) -> stopFlushing
startFlushing = (messageStream, sink) ->
  messageStream.onValue sink

# (object -> LogMessageEnvelope) -> {in: (object) -> (), out: Bacon.Bus(LogMessageEnvelope) }
logMessageStream = (toEnvelope) ->
  stream = new Bacon.Bus
  in: (message) -> stream.push message
  out: stream.map(toEnvelope)

module.exports = (steroids) -> do (window) ->
  defaultLogEndPoint = ->
    new Promise (resolve) ->
      steroids.app.host.getURL {},
        onSuccess: (url) ->
          resolve "#{url}/__appgyver/logger"

  shouldAutoFlush = ->
    new Promise (resolve, reject) ->
      steroids.app.getMode {},
        onSuccess: (mode) ->
          if mode is "scanner"
            resolve("Inside Scanner, autoflush allowed")
          else
            reject("Not in a Scanner app, disabling autoflush for logging")

  # (logEndPoint: string) -> (LogMessageEnvelope) -> XMLHttpRequest
  sendToEndPoint = (logEndPoint) -> (envelope) ->
    xhr = new window.XMLHttpRequest()
    xhr.open "POST", logEndPoint, true
    xhr.setRequestHeader "Content-Type", "application/json;charset=UTF-8"
    xhr.send JSON.stringify(envelope)
    xhr

  # (messageStream: Bacon.Bus(LogMessageEnvelope)) -> () -> Promise stopFlushing
  autoFlush = (messageStream) -> () ->
    shouldAutoFlush().then(
      ->
        defaultLogEndPoint().then (endPoint) ->
          startFlushing(messageStream, sendToEndPoint endPoint)
      (reason) ->
        console.log reason
    )

  do (toEnvelopeForLevel = logMessageEnvelope window) ->
    messages = new Bacon.Bus

    streamsPerLogLevel =
      info: logMessageStream toEnvelopeForLevel 'info'
      warn: logMessageStream toEnvelopeForLevel 'warn'
      error: logMessageStream toEnvelopeForLevel 'error'
      debug: logMessageStream toEnvelopeForLevel 'debug'

    messages.plug streamsPerLogLevel.info.out
    messages.plug streamsPerLogLevel.warn.out
    messages.plug streamsPerLogLevel.error.out
    messages.plug streamsPerLogLevel.debug.out

    {
      # Don't expose messages, qify for angular goes haywire
      autoFlush: autoFlush messages
      log: streamsPerLogLevel.info.in
      info: streamsPerLogLevel.info.in
      warn: streamsPerLogLevel.warn.in
      error: streamsPerLogLevel.error.in
      debug: streamsPerLogLevel.debug.in
    }