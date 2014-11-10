SuperNavigatePrototype = Object.create HTMLElement.prototype
###
 # @namespace components
 # @name super-navigate
 # @component
 # @description
 # Navigates to a view. Uses `supersonic.ui.layers.push` internally.
 # @attribute location The route or URL for the view to be shown. Either `location` or `view-id` must be set.
 # @attribute view-id The id of a StartedView that will be [navigated to](/ui-and-navigation/navigation/). If `view-id` is set, `location` will be ignored.
 # @attribute action="click" The action used to trigger the transition.
 # @usageHtml
 # <super-navigate location="cars#index" action="click">Open Cars index</super-navigate>
 # @exampleHtml
 # <!-- The action attribute is optional -->
 # <super-navigate location="cars#index">Open Cars index</super-navigate>
 #
 # <!-- Navigating to a StartedView is optional -->
 # <super-navigate view-id="carsShow">Open Cars index</super-navigate>
 # <!-- External URLs work too. -->
 # <super-navigate location="http://google.com">Open Google</super-navigate>
 #
 # <!-- The default action can be overridden -->
 # <super-navigate location="cars#show" action="touchmove">Show car</super-navigate>
###
SuperNavigatePrototype.createdCallback = ->
  action = @getAttribute("action") || "click"

  @addEventListener action, =>
    # By pre-loaded view id
    viewId = @getAttribute "view-id"
    if viewId
      return supersonic.ui.views.find(viewId)
        .then (webview) ->
          supersonic.logger.debug "Pushing preloaded webview #{viewId}"
          supersonic.ui.layers.push(webview)
        .catch (error) ->
          throw new Error "Failed to push view: #{error}"
    # By location
    location = @getAttribute "location"
    if location
      webview = supersonic.ui.view location
      return supersonic.ui.layers.push(webview)
        .catch (error) ->
          throw new Error "Failed to push view: #{error}"
    # None set, error
    throw new Error "Either view-id or location must be set"

document.registerElement "super-navigate",
  prototype: SuperNavigatePrototype
