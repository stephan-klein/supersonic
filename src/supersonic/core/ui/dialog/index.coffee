Promise = require 'bluebird'

###
 # @namespace supersonic.ui
 # @name dialog
 # @overview
 # @description The `supersonic.ui.dialog.*` namespace provides you with APIs for presenting different kinds of dialogs for the user.
###


module.exports =
  alert: require("./alert")
  confirm: require("./confirm")
  prompt: require("./prompt")
