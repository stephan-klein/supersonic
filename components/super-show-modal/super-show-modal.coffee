SuperShowModalPrototype = Object.create HTMLElement.prototype
###*
 * @category webComponent
 * @name super-show-modal
 * @description
 * Shows a modal.
 * @attribute action
 * @attribute route path to the location of the view to be shown as a modal.
 * @usage
 * ```html
 * <super-show-modal action="click" route="cars#modalView">Open modal</super-show-modal>
 * ```
###
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
