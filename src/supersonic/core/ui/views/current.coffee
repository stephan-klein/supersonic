Bacon = require 'baconjs'
events = require '../../events'

module.exports = (log) ->

  whenVisible = (f) ->
    whenHidden = null
    events
      .visibility
      .map((visible) ->
        if visible
          ->
            whenHidden = f()
        else
          ->
            whenHidden?()
            whenHidden = null
      )
      .onValue (notify) ->
        setTimeout notify, 0

  {
    visibility: events.visibility
    ###
     # @namespace supersonic.ui.views.current
     # @name whenVisible
     # @function
     # @apiCall supersonic.ui.views.current.whenVisible
     # @description
     # Trigger a listener to when the current view becomes visible
     # @type
     # supersonic.ui.views.current.whenVisible: () => unsubscribe: Function
     # @define {Function} unsubscribe Stop listening
     # @usageCoffeeScript
     # stopListening = supersonic.ui.views.current.whenVisible ->
     #   supersonic.logger.log "This view is visible"
     #   stopListening()
    ###
    whenVisible
  }