SuperNavigatePrototype = Object.create HTMLElement.prototype
###
 # @namespace components
 # @name super-navigate
 # @component
 # @description
 # Navigates to a view. Uses `supersonic.ui.layers.push` internally.
 # @attribute location The route or URL for the view to be shown. Either `location` or `view-id` must be set.
 # @attribute view-id The id of a started View that will be navigated to. If `view-id` is set, `location` will be ignored.
 # @attribute action="click" The action used to trigger the transition.
 # @exampleHtml
 # <!-- The action attribute is optional -->
 # <super-navigate location="cars#index">Open Cars index</super-navigate>
 #
 # <!-- Navigating to a started View is optional -->
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
    locationOrId = @getAttribute "view-id"
    locationOrId ?= @getAttribute "location"

    unless locationOrId?
      # None set, error
      throw new Error "Either view-id or location attribute must be set for a super-navigate element"

    # construct parameters for the pushed view
    params = null
    datasetKeys = Object.keys(@dataset)
    if datasetKeys? and datasetKeys.length
      for dataKey in datasetKeys when /^params/.test(dataKey)
        params = {} unless params?
        key = dataKey.replace(/^params(.*)$/, "$1").toLowerCase()
        params[key] = @dataset[dataKey]

    supersonic.ui.layers.push locationOrId, { params }
    .catch (error) ->
      throw new Error "Failed to push view: #{error}"

document.registerElement "super-navigate",
  prototype: SuperNavigatePrototype
