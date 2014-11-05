Promise = require 'bluebird'

module.exports = (steroids, global, log) ->
  animate: require("./animate")(steroids, log)
  view: require("./view")(steroids, log)
  views: require("./views")(steroids, global, log)
  layers: require("./layers")(steroids, log)
  drawer: require("./drawer")(steroids, log)
  modal: require("./modal")(steroids, log)
  navigationBar: require("./navigationBar")(steroids, log)
  NavigationBarButton: require("./NavigationBarButton")(steroids, log)
  screen: require("./screen")(steroids, log)
  dialog: require("./dialog")
  initialView: require("./initialView")(steroids, log)
