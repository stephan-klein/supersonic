module.exports =
  steroids:
    schemaVersion: "2.0.0"

  app:
    name: "Supersonic testSpecApp"
    version: "0.1.0"

  # This config flag is enabled for testing the CORS-issue prevention in the native client.
  # X-Feature-Jobs, X-Job-Id, steroidsAppId and steroidsApiKey need to be here for Supersonic Data.
  network:
    extraResponseHeaders:
      "Access-Control-Allow-Origin": "*"
      "Access-Control-Allow-Headers": "Content-Type, X-Requested-With, X-Feature-Jobs, X-Job-Id, steroidsAppId, steroidsApiKey"

  splashscreen:
    autohide: true

  webView:
    viewsIgnoreStatusBar: false
    enableDoubleTapToFocus: false
    disableOverscroll: false
    enableViewportScale: false # kinda harmful?
    enablePopGestureRecognition: true
    allowInlineMediaPlayback: true
