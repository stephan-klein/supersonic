Promise = require 'bluebird'
superify = require '../superify'

###
 # @namespace supersonic.ui
 # @name navigate
 # @function
 # @description
 # Navigates to the given Supersonic route or URL. Alternatively, you can pass in an id for a started View. Uses `supersonic.ui.layers.push` internally.
 # @type
 # navigate: (
 #   locationOrId: String
 #   params?: String|Object
 # ) => Promise
 # @define {String} locationOrId A Supersonic route, full URL or View id to be navigated to. There are also special routes:
 # <ul>
 #   <li>`#back` – goes back in the navigation stack, triggering `supersonic.ui.layers.pop` internally.</li>
 #   <li>`#root` – goes back to the root view, triggering `supersonic.ui.layers.popAll` internally.</li>
 # </ul>
 # @define {String|Object} params On object or JSON string of optional parameters to be passed to the target View, accessible via `supersonic.ui.views.params.current`.
 # @returnsDescription
 # A promise that will be resolved once the navigation commences. If the target location or id is invalid, the promise will be rejected.
 # @exampleCoffeeScript
 # # Via route
 # supersonic.ui.navigate "cars#show"
 #
 # # Via id
 # supersonic.ui.navigate "carsShowView"
 #
 # # Via URL
 # supersonic.ui.navigate "http://www.google.com"
 #
 # # Go back to the previous view
 # supersonic.ui.navigate "#back"
 #
 # # Go back to the root view
 # supersonic.ui.navigate "#root"
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
  s = superify 'supersonic.ui.navigate', log

  navigate = (locationOrId, params) ->
    if params?
      params = if typeof params is "object"
        params
      else
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
