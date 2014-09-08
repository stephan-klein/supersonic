SupersonicPrototype = Object.create HTMLElement.prototype

SupersonicPrototype.createdCallback = ->
  action = this.getAttribute "action"

  if action == "click"
    url = this.getAttribute "navigate"
    this.addEventListener "click", ()->
      steroids.layers.push
        view: new steroids.views.WebView url
        navigationBar: true

document.registerElement "ss-magic",
  prototype: SupersonicPrototype
