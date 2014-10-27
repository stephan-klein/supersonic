SuperHideModalPrototype = Object.create HTMLElement.prototype
###
 # @category webComponent
 # @name super-hide-modal
 # @component
 # @description
 # Hides an open modal on screen. Uses `supersonic.ui.modal.hide()` internally.
 # @attribute action="click" The action used to trigger the transition.
 # @usageHtml
 # <super-hide-modal action="click">Hide modal</super-hide-modal>
 # @exampleHtml
 # <!-- The action attribute is optional -->
 # <super-hide-modal>Go back</super-hide-modal>
 #
 # <!-- The default action can be overridden -->
 # <super-hide-modal action="touchmove">Hide modal</super-hide-modal>
###
SuperHideModalPrototype.createdCallback = ->
  action = @getAttribute("action") || "click"

  @addEventListener action, ->
    supersonic.ui.modal.hide()

document.registerElement "super-hide-modal",
  prototype: SuperHideModalPrototype
