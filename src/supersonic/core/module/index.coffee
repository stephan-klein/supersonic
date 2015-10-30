
module.exports = (steroids, logger, superglobal, ui, env, global, data, auth) ->
  attributes = require('./attributes')(logger, global, superglobal)
  router = require('./router')(logger, env, global)
  drivers = require('./drivers')(steroids, superglobal, global)

  cordovaSupport = require('./cordova-support')(superglobal, global)
  cordovaSupport.init()

  # Set default driver unless it has been set in a parent frame
  if !drivers.current.get()?
    drivers.current.set(drivers.mpa)

  {
    router
    drivers
    cordovaSupport
    attributes
    tabset: require('./tabset')(global)
    iframes: require('./iframes')(global, superglobal)
    layers: require('./layers')(logger, router, drivers.current.get, global)
    modal: require('./modal')(logger, router, drivers.current.get, global)
    notifications: require('./notifications')(data, attributes, auth)
    transitions: require('./transitions')(steroids, ui, logger)
  }
