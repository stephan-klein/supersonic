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

  whenHidden = (f) ->
    whenVisible = null
    events
      .visibility
      .map((visible) ->
        if not visible
          ->
            whenVisible = f()
        else
          ->
            whenVisible?()
            whenVisible = null
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
     # @define {Function} unsubscribe Stop listening for view visibility.
     # @usageCoffeeScript
     # stopListening = supersonic.ui.views.current.whenVisible ->
     #   supersonic.logger.debug "This view is now visible"
     #   stopListening()
     # @usageJavaScript
     # var stopListening = supersonic.ui.views.current.whenVisible( function() {
     #   supersonic.logger.debug("This view is now visible");
     #   stopListening();
     # });
    ###
    whenVisible
    ###
     # @namespace supersonic.ui.views.current
     # @name whenVisible
     # @function
     # @apiCall supersonic.ui.views.current.whenVisible
     # @description
     # Trigger a listener to when the current view becomes hidden.
     # @type
     # supersonic.ui.views.current.whenHidden: () => unsubscribe: Function
     # @define {Function} unsubscribe Stop listening for view visibility.
     # @usageCoffeeScript
     # stopListening = supersonic.ui.views.current.whenHidden ->
     #   supersonic.logger.debug "This view is now hidden."
     #   stopListening()
     # @usageJavaScript
     # var stopListening = supersonic.ui.views.current.whenHidden( function() {
     #   supersonic.logger.debug("This view is now hidden");
     #   stopListening();
     # });
    ###
    whenHidden
  }
