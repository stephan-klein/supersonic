SuperNavigatePrototype = Object.create HTMLElement.prototype
###
 # @category webComponent
 # @name super-navigate
 # @component
 # @description
 # Navigates to a view. Uses `supersonic.ui.layer.push` internally.
 # @attribute location The route or URL for the view to be shown.
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
    location = @getAttribute "location"
    if location
      view = supersonic.ui.view location
      supersonic.ui.layer.push view

document.registerElement "super-navigate",
  prototype: SuperNavigatePrototype
