onStyleChanged = (node)->
  if node.isHidden()
    steroids.logger.log "HIDDEN"
    node.hideDrawer()
  else
    steroids.logger.log "SHOW"
    node.showDrawer()

observer = new MutationObserver (mutations)->
  for mutation in mutations when mutation.type is "attributes" or mutation.attributeName in ["style", "class"]
    onStyleChanged(mutation.target)

SSDrawerPrototype = Object.create HTMLElement.prototype

SSDrawerPrototype.createdCallback = ->
  location = this.getAttribute("location")
  this.side = this.getAttribute("side")

  this.drawer = new steroids.views.WebView location
  this._preloaded = false
  this.preload()

SSDrawerPrototype.preload = (callback)->
  that = this
  if !this._preloaded
    this.drawer.preload {}, {
      onSuccess: ()->
        steroids.logger.log "preloaded"
        that._preloaded = true
        params = {}
        params[that.side] = this.drawer
        steroids.drawers.update params
        callback && callback()
    }
  else
    callback && callback()

SSDrawerPrototype.showDrawer = ->
  steroids.logger.log 222
  side = this.side.toUpperCase() || "LEFT"
  steroids.logger.log side
  this.preload ()->
    steroids.logger.log "trying to show"
    steroids.drawers.show({
      edge: steroids.screen.edges[side]
    })

SSDrawerPrototype.hideDrawer = ->
  steroids.logger.log "hiding method"

SSDrawerPrototype.isHidden = ->
  style = window.getComputedStyle this
  return true if style.display is "none" or style.visibility is "hidden"

SSDrawerPrototype.attachedCallback = ->
  # Observe attributes style and class
  observerConfiguration =
    attributes: true
    attributeFilter: ["style", "class"]

  observer.observe this, observerConfiguration

  onStyleChanged this

SSDrawerPrototype.detachedCallback = ->
  observer.disconnect()
  # Hide the drawer when this node leaves the DOM
  ## steroids.view.navigationBar.hide()

document.registerElement "ss-drawer",
  prototype: SSDrawerPrototype
