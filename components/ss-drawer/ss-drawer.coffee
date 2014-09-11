SSDrawerPrototype = Object.create HTMLElement.prototype

SSDrawerPrototype.createdCallback = ->
  this.location = this.getAttribute("location")
  this.side = this.getAttribute("side")
  this._preload()

SSDrawerPrototype._preload = ->
  this.drawer = new steroids.views.WebView this.location

SSDrawerPrototype.showDrawer = ->
  side = this.side
  drawer = this.drawer
  this.drawer.preload {}, {
    onSuccess: ()->
      steroids.logger.log "drawer preloaded"
      params = {}
      params[side] = drawer
      steroids.drawers.update params
      steroids.drawers.show({
        edge: steroids.screen.edges[side.toUpperCase()]
      })
  }

document.registerElement "ss-drawer",
  prototype: SSDrawerPrototype
