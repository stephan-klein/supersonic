SuperNavigateBackPrototype = Object.create HTMLElement.prototype

SuperNavigateBackPrototype.createdCallback = ->
  action = this.getAttribute "action"

  if action

    this.addEventListener action, ()->
      supersonic.ui.layer.pop()

document.registerElement "super-navigate-back",
  prototype: SuperNavigateBackPrototype