SuperShowModalPrototype = Object.create HTMLElement.prototype

SuperShowModalPrototype.createdCallback = ->
  action = this.getAttribute "action"

  if action

    route = this.getAttribute "route"
    if route
      this.addEventListener action, ()->
        view = supersonic.ui.view(route)
        supersonic.ui.modal.show(view)

document.registerElement "super-show-modal",
  prototype: SuperShowModalPrototype
