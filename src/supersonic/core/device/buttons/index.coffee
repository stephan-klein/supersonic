###
 # @namespace supersonic.device
 # @name buttons
 # @overview
 # @description The `supersonic.device.buttons.*` namespace provides you access to the device's hardware buttons.
###


module.exports = (steroids, log) ->
  back: require("./back")(steroids, log)
