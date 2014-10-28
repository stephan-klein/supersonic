SuperNavigatePrototype = Object.create HTMLElement.prototype
###
 # @category webComponent
 # @name super-navigate
 # @component
 # @description
 # Navigates to a view. Uses `supersonic.ui.layer.push` internally.
 # @attribute location The route or URL for the view to be shown. Either location or view-id must be set.
 # @attribute view-id The ID of a preloaded web view. Configure view IDs in config/structure.coffee. If view-id is set, location will be ignored.
 # @attribute action="click" The action used to trigger the transition.
 # @usageHtml
 # <super-navigate location="cars#index" action="click">Open Cars index</super-navigate>
 # @exampleHtml
 # <!-- The action attribute is optional -->
 # <super-navigate location="cars#index">Open Cars index</super-navigate>
 #
 # <!-- External URLs work too. -->
 # <super-navigate location="http://google.com">Open Google</super-navigate>
 #
 # <!-- The default action can be overridden -->
 # <super-navigate location="cars#show" action="touchmove">Show car</super-navigate>
###
SuperNavigatePrototype.createdCallback = ->
  action = @getAttribute("action") || "click"

  @addEventListener action, =>
    # By pre-loaded view ID
    viewId = @getAttribute "view-id"
    if viewId
      return supersonic.ui.views.find(viewId)
        .then (webview) ->
          supersonic.ui.layer.push(webview)
        .catch (error) ->
          throw new Error "Failed to push view: #{error}"
    # By location
    location = @getAttribute "location"
    if location
      webview = supersonic.ui.view location
      return supersonic.ui.layer.push(webview)
        .catch (error) ->
          throw new Error "Failed to push view: #{error}"
    # None set, error
    throw new Error "Either view-id or location must be set"

document.registerElement "super-navigate",
  prototype: SuperNavigatePrototype
