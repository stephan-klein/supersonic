SuperShowModalPrototype = Object.create HTMLElement.prototype
###
 # @category webComponent
 # @name <super-show-modal>
 # @component
 # @description
 # Shows a modal. Uses `supersonic.ui.modal.show` internally.
 # @attribute location The route or URL for the view to be shown.
 # @attribute action="click" The action used to trigger the transition.
 # @usageHtml
 # <super-show-modal location="cars#edit" action="click">Edit Car</super-location>
 # @exampleHtml
 # # External URLs work too.
 # <super-show-modal location="http://google.com">Open Google</super-location>
 #
 # # "click" is the default action
 # <super-show-modal location="meeting#details">Show meeting details</super-location>
###
SuperShowModalPrototype.createdCallback = ->
  action = @getAttribute("action") || null
  location = @getAttribute "location"

  if location
    @addEventListener action, ->
      view = supersonic.ui.view(location)
      supersonic.ui.modal.show(view)

document.registerElement "super-show-modal",
  prototype: SuperShowModalPrototype
