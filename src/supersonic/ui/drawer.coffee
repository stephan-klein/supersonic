Promise = require 'bluebird'


module.exports = (steroids, log) ->
  # TODO: add bug later
  # bug = log.debuggable "supersonic.ui.drawer"

  asLeft: (view)->
    supersonic.logger.log "asLeft2"
    webView = view.getWebView()
    steroids.drawers.update {
      left: webView
    }
    supersonic.logger.log "drawers are updated"
    steroids.drawers.show {
      edge: steroids.screen.edges.LEFT
    }, {
      onSuccess: ()->
        supersonic.logger.log "drawer should be shown"
      onFailure: ()->
        supersonic.logger.log "drawer fails"
    }
    return
