
module.exports = (logger) ->
  initialModuleElements: require('./initial-module-elements')(logger)
  attributes: require('./attributes')(logger)
