Promise = require 'bluebird'

module.exports =
  alert: require("./alert")
  confirm: require("./confirm")
  vibrate: require("./vibrate")
  prompt: require("./prompt")
