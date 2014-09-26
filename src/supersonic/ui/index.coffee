Promise = require 'bluebird'

module.exports = (steroids, log) ->
  view: require("./view")(steroids, log)
  layer: require("./layer")(steroids, log)
  drawer: require("./drawer")(steroids, log)
  modal: require("./modal")(steroids, log)
  navigationBar: require("./navigation-bar")(steroids, log)
  navigationButton: require("./navigation-button")(steroids, log)
