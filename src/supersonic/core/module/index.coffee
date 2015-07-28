
module.exports = (steroids, ui, logger) ->
  attributes: require('./attributes')(logger)
  initialModuleElements: require('./initial-module-elements')(logger)
  router: require('./router')(logger)
  transitions: require('./transitions')(steroids, ui, logger)
