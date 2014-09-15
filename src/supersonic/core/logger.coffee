class Logger

  constructor: ->
    @messages = []
    @queue = new LogMessageQueue

  log: (type, message)->
    if !(message)
      message = type
      type = 'silly'

    logMessage = new LogMessage(message)
    steroids.logger.log message

  info: (message)->
    @log('info', message)

  warn: (message)->
    @log('warn', message)

  error: (message)->
    @log('error', message)

  class LogMessage

    constructor: (@message)->
      steroids.logger.log "constructor Run"

  class LogMessageQueue
    constructor: ->
      @messageQueue = []

module.exports = new Logger
