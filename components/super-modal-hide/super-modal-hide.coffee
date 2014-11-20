SuperModalHidePrototype = Object.create HTMLElement.prototype
###
 # @namespace components
 # @name super-modal-hide
 # @component
 # @description
 # Hides an open modal on screen. Uses `supersonic.ui.modal.hide()` internally.
 # @attribute action="click" The action used to trigger the transition.
 # @exampleHtml
 # <!-- The action attribute is optional -->
 # <super-modal-hide>Go back</super-modal-hide>
 #
 # <!-- The default action can be overridden -->
 # <super-modal-hide action="touchmove">Hide modal</super-modal-hide>
###
SuperModalHidePrototype.createdCallback = ->
  action = @getAttribute("action") || "click"

  @addEventListener action, ->
    supersonic.ui.modal.hide()

document.registerElement "super-modal-hide",
  prototype: SuperModalHidePrototype
