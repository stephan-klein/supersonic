SuperHideModalPrototype = Object.create HTMLElement.prototype
###*
 * @type webComponent
 * @name super-hide-modal
 * @description
 * Hides a modal.
 * @attribute action
 * @usage
 * ```coffeescript
 * <super-hide-modal action="click">Open modal</super-hide-modal>
 * ```
###
SuperHideModalPrototype.createdCallback = ->
  action = this.getAttribute "action"

  if action

    this.addEventListener action, ()->
      supersonic.ui.modal.hide()

document.registerElement "super-hide-modal",
  prototype: SuperHideModalPrototype
