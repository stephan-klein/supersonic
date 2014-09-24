structurePath = require.resolve("./structure")
delete require.cache[structurePath] if require.cache[structurePath]

structure = require "./structure"

module.exports =
  steroids:
    schemaVersion: "2.0.0"

  app:
    name: "superdemo"
    version: "0.1.0"

  splashscreen:
    autohide: false

  webView:
    viewsIgnoreStatusBar: false
    enableDoubleTapToFocus: false
    disableOverscroll: false
    enableViewportScale: true # kinda harmful?
    enablePopGestureRecognition: true

  keyboard:
    shrinksView: false
    hideAccessoryBar: false
    displayRequiresUserAction: true

  structure: structure
