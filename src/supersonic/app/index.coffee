Promise = require 'bluebird'

module.exports = (steroids) ->
  sleep: require("./sleep")(steroids, log)
  getLaunchURL: require("./getLaunchURL")(steroids, log)
  splashscreen: require("./splashscreen")(steroids, log)
  openURL: require("./openURL")(steroids, log)
