SuperNavigateBackPrototype = Object.create HTMLElement.prototype
###*
 * @category webComponent
 * @name super-navigate-back
 * @description
 * Navigates back to the previous view.
 * @attribute action
 * @usage
 * ```html
 * <super-navigate-back action="click">Go back</super-navigate-back>
 * ```
###
SuperNavigateBackPrototype.createdCallback = ->
  action = this.getAttribute "action"

  if action

    this.addEventListener action, ()->
      supersonic.ui.layer.pop()

document.registerElement "super-navigate-back",
  prototype: SuperNavigateBackPrototype
