Promise = require 'bluebird'

module.exports = (steroids, log) ->
  camera: require("./camera")(steroids, log)

