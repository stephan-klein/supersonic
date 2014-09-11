SupersonicPrototype = Object.create HTMLElement.prototype

SupersonicPrototype.createdCallback = ->
  action = this.getAttribute "action"

  if action

    navigate = this.getAttribute "navigate"
    if navigate
      this.addEventListener action, ()->
        steroids.layers.push(
          {
            view: new steroids.views.WebView navigate
            navigationBar: true
          }
          {
            onSuccess: ->
              supersonic.logger.log "Pushed new layer, URL: #{navigate}"
          }
        )

    modal = this.getAttribute "modal"

    if modal == null
    else if modal == "hide"
      this.addEventListener action, ()->
        steroids.modal.hide()
    else
      this.addEventListener action, ()->
        steroids.modal.show(new steroids.views.WebView modal)

document.registerElement "ss-magic",
  prototype: SupersonicPrototype
