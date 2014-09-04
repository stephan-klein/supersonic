
module.exports =
  debug: require './core/debug'

# Export to window as global if we're in the browser
if (window?)
  window.supersonic = module.exports
