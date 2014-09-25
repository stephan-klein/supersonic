module.exports =
  steroids:
    schemaVersion: "2.0.0"

  app:
    name: "superdemo"
    version: "0.1.0"

  splashscreen:
    autohide: true

  webView:
    viewsIgnoreStatusBar: false
    enableDoubleTapToFocus: false
    disableOverscroll: false
    enableViewportScale: false # kinda harmful?
    enablePopGestureRecognition: true
    allowInlineMediaPlayback: true

  keyboard:
    shrinksView: false
    hideAccessoryBar: false
    displayRequiresUserAction: true
