SSDrawerPrototype = Object.create HTMLElement.prototype

SSDrawerPrototype.createdCallback = ->
  this.location = this.getAttribute("location")
  this.side = this.getAttribute("side")
  this.drawer = new steroids.views.WebView this.location
  this._preloaded = false

SSDrawerPrototype._preload = (callback)->

  if this._preloaded == false
    that = this
    this.drawer.preload {}, {
      onSuccess: ()->
        that._preloaded = true
        callback.apply(that)
    }
  else
    callback.apply(this)

SSDrawerPrototype.showDrawer = ->
  that = this
  this._preload that._openDrawer

SSDrawerPrototype._openDrawer = ->
  side = this.side
  drawer = this.drawer
  params = {}
  params[side] = drawer
  steroids.drawers.update params
  steroids.drawers.show({
    edge: steroids.screen.edges[side.toUpperCase()]
  })

document.registerElement "ss-drawer",
  prototype: SSDrawerPrototype
