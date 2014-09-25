Promise = require 'bluebird'

module.exports = (steroids, log) ->
  sleep: require("./sleep")(steroids, log)
  getLaunchURL: require("./getLaunchURL")(steroids, log)
  splashscreen: require("./splashscreen")(steroids, log)
  openURL: require("./openURL")(steroids, log)
  statusBar: require("./statusBar")(steroids, log)
