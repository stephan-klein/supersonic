onStyleChanged = (node)->
  if node.isHidden()
    node.hideNavBar()
  else
    node.showNavBar()

observer = new MutationObserver (mutations)->
  for mutation in mutations when mutation.type is "attributes" or mutation.attributeName in ["style", "class"]
    onStyleChanged(mutation.target)

SSNavigationBarPrototype = Object.create HTMLElement.prototype

Object.defineProperty SSNavigationBarPrototype, "title",
  set: (title)->
    this._title = title
    this.onTitleChanged()

  get: ->
    this._title

SSNavigationBarPrototype.isHidden = ->
  style = window.getComputedStyle this
  return true if style.display is "none" or style.visibility is "hidden"

SSNavigationBarPrototype.showNavBar = ->
  if this.title? && this.title.length is 0
    this.title = " " # hack for not being able to clear the title with empty string
  steroids.view.navigationBar.show(this.title)

SSNavigationBarPrototype.hideNavBar = ->
  steroids.view.navigationBar.hide()

SSNavigationBarPrototype.onTitleChanged = ->
  this.showNavBar() unless this.isHidden()

SSNavigationBarPrototype.attachedCallback = ->
  observerConfiguration =
    attributes: true
    attributeFilter: ["style", "class"]

  observer.observe this, observerConfiguration

  onStyleChanged this

SSNavigationBarPrototype.createdCallback = ->
  #console.log "Navigation bar createCallback"

SSNavigationBarPrototype.detachedCallback = ->
  #console.log "Navigation bar detachedCallback"
  observer.disconnect()
  steroids.view.navigationBar.hide()

document.registerElement "ss-navigation-bar",
  prototype: SSNavigationBarPrototype
