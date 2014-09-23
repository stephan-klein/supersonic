Promise = require 'bluebird'

module.exports = (steroids, log) ->
  views: require("./views")(steroids, log)
