SuperNavigatePrototype = Object.create HTMLElement.prototype
###*
 * @type webComponent
 * @name super-navigate
 * @description
 * Navigates to a view.
 * @attribute action
 * @attribute url url or path to the window.location of the view to be shown as a modal.
 * @usage
 * ```coffeescript
 * <super-navigate action="click" url="http://google.com">Open Google</super-navigate>
 * ```
###
SuperNavigatePrototype.createdCallback = ->
  action = this.getAttribute "action"

  if action

    url = this.getAttribute "url"
    if url
      this.addEventListener action, ()->
        view = supersonic.ui.view(url)
        supersonic.ui.layer.push(view)

    # TODO: 
    # route = this.getAttribute "route" 

document.registerElement "super-navigate",
  prototype: SuperNavigatePrototype
