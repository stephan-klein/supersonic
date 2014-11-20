SuperModalShowPrototype = Object.create HTMLElement.prototype
###
 # @namespace components
 # @name super-modal-show
 # @component
 # @description
 # Shows a modal. Uses `supersonic.ui.modal.show` internally.
 # @attribute location The route or URL for the view to be shown.
 # @attribute action="click" The action used to trigger the transition.
 # @exampleHtml
 # <!-- The action attribute is optional -->
 # <super-modal-show location="cars#edit">Edit Car</super-modal-show>
 #
 # <!-- External URLs work too -->
 # <super-modal-show location="http://google.com">Open Google</super-modal-show>
 #
 # <!-- The default action can be overridden -->
 # <super-modal-show location="meeting#details" action="touchmove">Show meeting details</super-modal-show>
###
SuperModalShowPrototype.createdCallback = ->
  action = @getAttribute("action") || "click"

  @addEventListener action, =>
    viewId = @getAttribute "view-id"
    viewId ?= @getAttribute "location"

    unless viewId?
      # None set, error
      throw new Error "Either view-id or location must be set for a super-modal-show element"

    supersonic.ui.modal.show(viewId)
    .catch (error) ->
      throw new Error "Failed to open modal: #{error}"

document.registerElement "super-modal-show",
  prototype: SuperModalShowPrototype
