onStyleChanged = (node)->
  if node.isHidden()
    node.hideDrawer()
  else
    node.showDrawer()

observer = new MutationObserver (mutations)->
  for mutation in mutations when mutation.type is "attributes" or mutation.attributeName in ["style", "class"]
    onStyleChanged(mutation.target)

SSDrawerPrototype = Object.create HTMLElement.prototype

SSDrawerPrototype.createdCallback = ->
  this.location = this.getAttribute("location")
  this.side = this.getAttribute("side")
  this.drawer = new steroids.views.WebView this.location
  this._preloaded = false

SSDrawerPrototype._preload = (callback)->

  that = this

  preload = (callback)->
    this.drawer.preload {}, {
      onSuccess: ()->
        that._preloaded = true
        callback.apply(that)
      onFailure: ()->
        # steroids.logger.log "FAILURE"
        # steroids.logger.log arguments
    }

  steroids.getApplicationState {}, {
    onSuccess: (state)->
      steroids.logger.log 'app state gotten'
      # steroids.logger.log state.preloads
      # steroids.logger.log that.location
      #find = (data.filter (i) -> i.id is that.location)[0]
      find = (i for i in state.preloads when i.id.indexOf(that.location) != -1)[0]
      if !find
        preload(callback)
      else
        callback.apply(that)
  }

  #if this._preloaded == false
  #else
  #  callback.apply(this)

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

document.registerElement "ss-drawer",
  prototype: SSDrawerPrototype
