Promise = require 'bluebird'
superify = require '../superify'

###
 # @namespace supersonic.ui
 # @name navigate
 # @function
 # @description
 # Navigates to the given [route](/ui-and-navigation/navigation/routes/) or URL. Alternatively, you can pass in a [StartedView id](/ui-and-navigation/views/started-views/). Shorthand for calling `supersonic.ui.layers.push` with a View or StartedView.
 # @usageJavaScript
 # supersonic.ui.navigate(locationOrId)
 # @type
 # navigate: (
 #   locationOrId: String
 # ) => Promise
 # @define {String} locationOrId: A [route](/ui-and-navigation/navigation/routes/), full URL or [StartedView id](/ui-and-navigation/views/started-views/) to be navigated to. The special `#back` route will go back in the navigation stack, triggering `supersonic.ui.layers.pop` internally. The special `#root` route will go back to the [root view](/ui-and-navigation/views/root-view/).
 # @returnsDescription
 # A promise that will be resolved once the navigation commences. If the target location or id is invalid, the promise will be rejected.
 # @exampleJavaScript
 # // Via route
 # supersonic.ui.navigate("cars#show");
 #
 # // Via id
 # supersonic.ui.navigate("carsShowView");
 #
 # // Via URL
 # supersonic.ui.navigate("http://www.google.com");
 #
 # // Go back to the previous view
 # supersonic.ui.navigate("#back");
 #
 # // Go back to the root view
 # supersonic.ui.navigate("#root");
###

module.exports = (steroids, log) ->
  s = superify 'supersonic.ui.modal', log

  navigate = (locationOrId, params) ->
    params = if params?
      try
        JSON.parse params
      catch e
        supersonic.logger.error "#{e}. Passed params must be JSON that can be parsed."
        throw new Error "#{e}. Passed params must be JSON that can be parsed."

    (new Promise (resolve, reject) ->
      cbObject =
        onSuccess: resolve
        onFailure: reject

      if locationOrId is "#back"
        supersonic.ui.layers.pop {}, cbObject
        return false

      if locationOrId is "#root"
        supersonic.ui.layers.popAll {}, cbObject
        return false

      maybeStartedView = new supersonic.ui.View(
        location: locationOrId
        id: locationOrId
      )

      maybeStartedView.isStarted().then (started)->
        if started
          if params?
            supersonic.logger.log "Sending parameters (#{params}) to view (id: #{maybeStartedView.id})"
            supersonic.data.channel("view-params-#{maybeStartedView.id}").publish(params)
          supersonic.ui.layers.push maybeStartedView, cbObject
        else
          maybeStartedView.setId(null).then ->
            if params?
              maybeStartedView._webView.setParams params
            supersonic.ui.layers.push maybeStartedView, cbObject
    )
