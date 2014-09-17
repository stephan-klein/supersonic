# Fake steroids for tests
if !steroids
  steroids = {
    app:
      host:
        getURL: ->
      getMode: ->
  }

class Logger

  constructor: ->
    @messages = []
    @queue = new LogMessageQueue
    steroids.app.host.getURL {},
      onSuccess: (url) =>
        @logEndpoint = "#{url}/__appgyver/logger"

  log: (type, message)->
    if !(message)
      message = type
      type = 'info'

    logMessage = new LogMessage(type, message)
    steroids.app.getMode {},
      onSuccess: (mode) =>
        return unless mode == "scanner"
        @queue.push logMessage

  info: (message)->
    @log('info', message)

  warn: (message)->
    @log('warn', message)

  error: (message)->
    @log('error', message)

  class LogMessage

    constructor: (@type, @message) ->
      @location = window.location.href
      @screen_id = window.AG_SCREEN_ID
      @layer_id = window.AG_LAYER_ID
      @view_id = window.AG_VIEW_ID

      @date = new Date()

    asJSON: ->
      try
        messageJSON = JSON.stringify(@message)
      catch err
        messageJSON = err.toString()

      obj =
        message: messageJSON
        level: @type
        location: @location
        date: @date.toJSON()
        screen_id: @screen_id
        layer_id: @layer_id
        view_id: @view_id

      return obj

  class LogMessageQueue

    constructor: ->
      @messageQueue = []

    push: (logMessage)->
      @messageQueue.push logMessage

    flush: ->
      return false unless supersonic.logger.logEndpoint?

      while( logMessage = @messageQueue.pop() )
        xhr = new XMLHttpRequest()
        xhr.open "POST", supersonic.logger.logEndpoint, true
        xhr.setRequestHeader "Content-Type", "application/json;charset=UTF-8"
        xhr.send JSON.stringify(logMessage.asJSON())

      return true

    autoFlush: (every) ->
      steroids.app.getMode {},
        onSuccess: (mode) ->
          return unless mode == "scanner"

          supersonic.logger.queue.startFlushing(every)

    startFlushing: (every) ->
      return false if @flushingInterval?

      @flushingInterval = window.setInterval =>
        @flush()
      , every

      return true

    stopFlushing: ->
      return false unless @flushingInterval?

      window.clearInterval(@flushingInterval)
      @flushingInterval = undefined

      return true

    getLength: ->
      @messageQueue.length

module.exports = new Logger
