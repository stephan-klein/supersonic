Promise = require 'bluebird'

module.exports = (steroids, log) ->
  sleep: require("./sleep")(steroids, log)