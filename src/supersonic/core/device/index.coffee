Promise = require 'bluebird'

module.exports = (steroids, log) ->
  geolocation: require("./geolocation")(steroids, log)
  accelerometer: require("./accelerometer")(steroids, log)
  compass: require("./compass")(steroids, log)
  network: require("./network")(steroids, log)
  platform: require("./platform")(steroids, log)
  vibrate: require("./vibrate")(steroids, log)
  ready: require("./ready")(steroids, log)
  buttons: require("./buttons")(steroids, log)
    
