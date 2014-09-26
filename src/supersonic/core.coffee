global = if window?
    window
  else
    require './mock/window'

steroids = if global.steroids?
    global.steroids
  else
    require './mock/steroids'

logger = require('./core/logger')(steroids, global)

module.exports = {
  logger
  debug: require('./core/debug')(steroids, logger)
  app: require('./app')(steroids, logger)
  notification: require('./notification')
  device: require('./device')(steroids, logger)
  ui: require('./ui')(steroids, logger)
}

# Export to window as global if we're in the browser
if (window?)
  window.supersonic = module.exports
  window.supersonic.logger.autoFlush()
