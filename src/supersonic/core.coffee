module.exports =
  debug: require './core/debug'
  logger: require './core/logger'
  cordova: require './cordova'
  steroids: require './steroids'

# Export to window as global if we're in the browser
if (window?)
  window.supersonic = module.exports
  window.supersonic.logger.queue.autoFlush(100)
