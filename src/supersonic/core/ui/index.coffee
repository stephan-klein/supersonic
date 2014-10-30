Promise = require 'bluebird'

module.exports = (steroids, log) ->
  view: require("./view")(steroids, log)
  views: require("./views")(steroids, log)
  layers: require("./layers")(steroids, log)
  drawer: require("./drawer")(steroids, log)
  modal: require("./modal")(steroids, log)
  navigationBar: require("./navigation-bar")(steroids, log)
  navigationButton: require("./navigation-button")(steroids, log)
  screen: require("./screen")(steroids, log)
  dialog: require("./dialog")
  initialView: require("./initialView")(steroids, log)
