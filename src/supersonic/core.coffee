steroids = if window?.steroids?
    window.steroids
  else
    require './steroids.mock'

logger = require('./core/logger')(steroids)

module.exports = {
  logger
  debug: require('./core/debug')(steroids, logger)
  app: require('./app')(steroids, logger)
  cordova: require('./cordova')
}

# Export to window as global if we're in the browser
if (window?)
  window.supersonic = module.exports
  window.supersonic.logger.autoFlush()
