Promise = require 'bluebird'

module.exports = (steroids, log) ->
  animate: require("./animate")(steroids, log)
  view: require("./view")(steroids, log)
  views: require("./views")(steroids, log)
  layers: require("./layers")(steroids, log)
  drawers: require("./drawers")(steroids, log)
  modal: require("./modal")(steroids, log)
  navigationBar: require("./navigationBar")(steroids, log)
  NavigationBarButton: require("./NavigationBarButton")(steroids, log)
  screen: require("./screen")(steroids, log)
  tabs: require("./tabs")(steroids, log)
  dialog: require("./dialog")
  initialView: require("./initialView")(steroids, log)
