SuperShowModalPrototype = Object.create HTMLElement.prototype
###
 # @category webComponent
 # @name super-show-modal
 # @component
 # @description
 # Shows a modal. Uses `supersonic.ui.modal.show` internally.
 # @attribute location The route or URL for the view to be shown.
 # @attribute action="click" The action used to trigger the transition.
 # @usageHtml
 # <super-show-modal location="cars#edit" action="click">Edit Car</super-show-modal>
 # @exampleHtml
 # <!-- The action attribute is optional -->
 # <super-show-modal location="cars#edit">Edit Car</super-show-modal>
 #
 # <!-- External URLs work too -->
 # <super-show-modal location="http://google.com">Open Google</super-show-modal>
 #
 # <!-- The default action can be overridden -->
 # <super-show-modal location="meeting#details" action="touchmove">Show meeting details</super-show-modal>
###
SuperShowModalPrototype.createdCallback = ->
  action = @getAttribute("action") || "click"

  @addEventListener action, =>
    location = @getAttribute "location"
    if location
      view = supersonic.ui.view(location)
      supersonic.ui.modal.show view

document.registerElement "super-show-modal",
  prototype: SuperShowModalPrototype
