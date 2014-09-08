SupersonicPrototype = Object.create HTMLElement.prototype

SupersonicPrototype.createdCallback = ->
  action = this.getAttribute "action"

  if action == "click"

    navigate = this.getAttribute "navigate"
    if navigate
      this.addEventListener "click", ()->
        steroids.layers.push
          view: new steroids.views.WebView navigate
          navigationBar: true

    modal = this.getAttribute "modal"

    if modal == null
    else if modal == "hide"
      this.addEventListener "click", ()->
        steroids.modal.hide()
    else
      this.addEventListener "click", ()->
        steroids.modal.show(new steroids.views.WebView modal)

document.registerElement "ss-magic",
  prototype: SupersonicPrototype
