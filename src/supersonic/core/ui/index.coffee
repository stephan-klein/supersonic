
module.exports = (steroids, log, global, superglobal, data) ->
  dialog = require("./dialog")(steroids, log)
  views = require("./views")(steroids, log, global)
  layers = require("./layers")(steroids, log)
  modal = require("./modal")(steroids, log)

  {
    View: require("./View")(steroids, log)

    MediaGallery: require("./MediaGallery")(steroids, log)
    PDFView: require("./PDFView")(steroids, log)

    screen: require("./screen")(steroids, log)
    drawers: require("./drawers")(steroids, log)
    tabs: require("./tabs")(steroids, log)
    initialView: require("./initialView")(steroids, log)

    navigationBar: require("./navigationBar")(steroids, log)
    NavigationBarButton: require("./NavigationBarButton")(steroids, log)

    animate: require("./animate")(steroids, log)
    isDisposable: require("./isDisposable")(global, superglobal, data, dialog, views, layers, modal)

    dialog
    views
    layers
    modal
  }
