
module.exports = (steroids, logger, superglobal, ui, env, global) ->
  router = require('./router')(logger, env)
  drivers = require('./drivers')(steroids, superglobal)

  # Set default driver unless it has been set in a parent frame
  if !drivers.current.get()?
    drivers.current.set(drivers.mpa)

  {
    router
    drivers
    attributes: require('./attributes')(logger, global, superglobal)
    initialModuleElements: require('./initial-module-elements')(logger)
    layers: require('./layers')(logger, router, drivers.current.get)
    modal: require('./modal')(logger, router, drivers.current.get)
    transitions: require('./transitions')(steroids, ui, logger)
  }
