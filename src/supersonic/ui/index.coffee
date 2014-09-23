Promise = require 'bluebird'

module.exports = (steroids, log) ->
  view: require("./view")(steroids, log)
