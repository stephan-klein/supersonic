SuperNavigatePrototype = Object.create HTMLElement.prototype
###
 # @category webComponent
 # @name <super-navigate>
 # @component
 # @description
 # Navigates to a view. Uses `supersonic.ui.layer.push` internally.
 # @syntax
 # <super-navigate location action>
 # @attribute location The route or URL for the view to be shown.
 # @attribute action="click" The action used to trigger the transition.
 # @usageHtml
 # <super-navigate location="cars#index" action="click">Open Cars index</super-navigate>
 # @exampleHtml
 # # External URLs work too.
 # <super-navigate location="http://google.com">Open Google</super-navigate>
 #
 # # "click" is the default action
 # <super-navigate location="cars#show">Show car</super-navigate>
###
SuperNavigatePrototype.createdCallback = ->
  action = this.getAttribute "action" || "click"
  location = this.getAttribute "location"

  if location
    this.addEventListener action, ->
      view = supersonic.ui.view(location)
      supersonic.ui.layer.push(view)

document.registerElement "super-navigate",
  prototype: SuperNavigatePrototype
