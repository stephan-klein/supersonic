
module.exports = (steroids, logger, ui, env) ->
  router = require('./router')(logger, env)

  {
    router
    attributes: require('./attributes')(logger)
    initialModuleElements: require('./initial-module-elements')(logger)
    layers: require('./layers')(logger, steroids, router)
    transitions: require('./transitions')(steroids, ui, logger)
  }
