steroids = if window?.steroids?
    window.steroids
  else
    require './steroids.mock'

module.exports =
  debug: require('./core/debug')(steroids)
  logger: require('./core/logger')(steroids)
  cordova: require('./cordova')
  steroids: require('./steroids')(steroids)

# Export to window as global if we're in the browser
if (window?)
  window.supersonic = module.exports
  window.supersonic.logger.queue.autoFlush(100)
