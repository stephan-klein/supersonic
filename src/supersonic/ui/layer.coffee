Promise = require 'bluebird'


module.exports = (steroids, log) ->
  # TODO: add bug later
  # bug = log.debuggable "supersonic.ui.layer"

  push: (view)->
    steroids.layers.push(view.getWebView())
