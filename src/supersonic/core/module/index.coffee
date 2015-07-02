
module.exports = (steroids, ui, logger) ->
  initialModuleElements: require('./initial-module-elements')(logger)
  attributes: require('./attributes')(logger)
  transitions: require('./transitions')(steroids, ui, logger)
