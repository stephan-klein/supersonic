Promise = require 'bluebird'


module.exports = (steroids, log) ->
  # TODO: add bug later
  # bug = log.debuggable "supersonic.ui.drawer"

  asLeft: (view)->
    @show(view, 'left')
    return

  asRight: (view)->
    @show(view, 'right')
    return

  show: (view, side)->
    webView = view.getWebView()
    params = {}
    params[side] = webView
    steroids.drawers.update params
    steroids.drawers.show {
      edge: steroids.screen.edges[side.toUpperCase()]
    }, {
      onSuccess: ()->
        supersonic.logger.log "#{side} drawer should be shown"
      onFailure: ()->
        supersonic.logger.log "#{side} drawer fails"
    }
    return
