SuperNavigatePrototype = Object.create HTMLElement.prototype

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
