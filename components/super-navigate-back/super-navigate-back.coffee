SuperNavigateBackPrototype = Object.create HTMLElement.prototype
###
 # @category webComponent
 # @name super-navigate-back
 # @component
 # @description
 # Navigates back to the previous view. Uses `supersonic.ui.layer.pop()` internally.
 # @attribute action="click" The action used to trigger the transition.
 # @usageHtml
 # <super-navigate-back action="click">Go back</super-navigate-back>
 # @exampleHtml
 # <!-- The action attribute is optional -->
 # <super-navigate-back>Go back</super-navigate-back>
 #
 # <!-- The default action can be overridden -->
 # <super-navigate-back action="touchmove">Go back</super-navigate-back>
###
SuperNavigateBackPrototype.createdCallback = ->
  action = @getAttribute("action") || "click"

  @addEventListener action, ->
    supersonic.ui.layer.pop()

document.registerElement "super-navigate-back",
  prototype: SuperNavigateBackPrototype
