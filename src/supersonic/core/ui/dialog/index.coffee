
###
 # @namespace supersonic.ui
 # @name dialog
 # @overview
 # @description The `supersonic.ui.dialog.*` namespace provides you with APIs for presenting different kinds of dialogs for the user.
###


module.exports = (steroids, log) ->
  alert: require("./alert")(steroids, log)
  confirm: require("./confirm")(steroids, log)
  prompt: require("./prompt")(steroids, log)
