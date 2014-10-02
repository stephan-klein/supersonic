SuperHideModalPrototype = Object.create HTMLElement.prototype

SuperHideModalPrototype.createdCallback = ->
  action = this.getAttribute "action"

  if action

    this.addEventListener action, ()->
      supersonic.ui.modal.hide()

document.registerElement "super-hide-modal",
  prototype: SuperHideModalPrototype
