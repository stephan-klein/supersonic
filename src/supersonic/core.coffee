module.exports =
  debug: require './core/debug'
  cordova: require './cordova'
  steroids: require './steroids'

# Export to window as global if we're in the browser
if (window?)
  window.supersonic = module.exports
