SuperNavigatePrototype = Object.create HTMLElement.prototype
###
 # @category webComponent
 # @name super-navigate
 # @component
 # @description
 # Navigates to a view.
 # @attribute action="click" The action used to trigger the transition.
 # @attribute location The route or URL for the view to be shown.
 # @usageHtml
 # <super-navigate location="cars#index">Open Cars index</super-navigate>
 # @exampleHtml
 # # External URLs work too
 # <super-navigate action="click" location="http://google.com">Open Google</super-navigate>
###
SuperNavigatePrototype.createdCallback = ->
  action = this.getAttribute "action" || "click"
  location = this.getAttribute "location"

  if location
    this.addEventListener action, ()->
      view = supersonic.ui.view(location)
      supersonic.ui.layer.push(view)

document.registerElement "super-navigate",
  prototype: SuperNavigatePrototype
