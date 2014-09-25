Promise = require 'bluebird'

module.exports = (steroids, log) ->
  geolocation: require("./geolocation")(steroids, log)