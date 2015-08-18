global = if window?
    window
  else
    Window = require './mock/window'
    new Window()

superglobal = if window?.top?
    window.top
  else
    global

steroids = if global.top?.steroids?
    global.top?.steroids
  else
    require './mock/steroids'

logger = require('./core/logger')(steroids, global)
data = require('./core/data')(logger, global)
env = require('./core/env')(logger, superglobal)
ui = require('./core/ui')(steroids, logger, global)

module.exports = {
  logger
  data
  env
  ui
  debug: require('./core/debug')(steroids, logger)
  app: require('./core/app')(steroids, logger)
  media: require('./core/media')(steroids, logger)
  module: require('./core/module')(steroids, logger, superglobal, ui, env)
  device: require('./core/device')(steroids, logger)
  data: require('./core/data')(logger, superglobal, env)
  auth: require('./core/auth')(logger, global, data, env)
  internal:
    Promise: require 'bluebird'
    Bacon: require 'baconjs'
}

# Export to window as global if we're in the browser
if (window?)
  window.supersonic = module.exports
  window.supersonic.logger.autoFlush()
