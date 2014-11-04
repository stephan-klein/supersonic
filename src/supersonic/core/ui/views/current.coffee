Bacon = require 'baconjs'

module.exports = (global, log) ->
  visibilityState = if global?.document?
      changes: Bacon.fromEventTarget(global.document, 'visibilitychange')
      defaultState: global.document.visibilityState
    else
      changes: Bacon.once target: visibilitystate: 'visible'
      defaultState: 'hidden'

  visibility = visibilityState.changes
    .map((event) ->
      event.target?.visibilityState
    )
    .toProperty(visibilityState.defaultState)
    .map((stateString) ->
      switch stateString
        when "visible" then true
        when "hidden" then false
        else false
    )

  whenVisible = (f) ->
    visibility.filter((v) -> v).onValue f

  {
    visibility
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