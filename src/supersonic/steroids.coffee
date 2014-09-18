module.exports = (steroids) ->
  openURL: require('./steroids/openURL')(steroids)
  app: require('./steroids/app')(steroids)
