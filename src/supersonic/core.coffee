global = if window?
    window
  else
    require './mock/window'

steroids = if global.steroids?
    global.steroids
  else
    require './mock/steroids'

logger = require('./core/logger')(steroids, global)
data = require('./core/data')(logger, global)
env = require('./core/env')(logger, global)

module.exports = {
  logger
  data
  env
  debug: require('./core/debug')(steroids, logger)
  app: require('./core/app')(steroids, logger)
  media: require('./core/media')(steroids, logger)
  device: require('./core/device')(steroids, logger)
  ui: require('./core/ui')(steroids, logger, global)
  data: require('./core/data')(logger, global)
  auth: require('./core/auth')(logger, global, data, env)
  internal:
    Promise: require 'bluebird'
    Bacon: require 'baconjs'
}

# Export to window as global if we're in the browser
if (window?)
  window.supersonic = module.exports
  window.supersonic.logger.autoFlush()
