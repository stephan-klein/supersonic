
module.exports = (steroids, logger, ui, env) ->
  router = require('./router')(logger, env)
  drivers = require('./drivers')(steroids)

  drivers.current.set(drivers.mpa)

  {
    router
    drivers
    attributes: require('./attributes')(logger)
    initialModuleElements: require('./initial-module-elements')(logger)
    layers: require('./layers')(logger, router, drivers.current.get)
    transitions: require('./transitions')(steroids, ui, logger)
  }
