SuperHideModalPrototype = Object.create HTMLElement.prototype
###
 # @category webComponent
 # @name <super-hide-modal>
 # @component
 # @description
 # Hides an open modal on screen. Uses `supersonic.ui.modal.hide()` internally.
 # @attribute action="click" The action used to trigger the transition.
 # @usageHtml
 # <super-hide-modal>Hide modal</super-hide-modal>
 # @exampleHtml
 # # External URLs work too.
 # <super-hide-modal>Hide modal</super-hide-modal>
###
SuperHideModalPrototype.createdCallback = ->
  action = @getAttribute("action") || "click"

  @addEventListener action, ->
    supersonic.ui.modal.hide()

document.registerElement "super-hide-modal",
  prototype: SuperHideModalPrototype
