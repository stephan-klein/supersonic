onContentChanged = (node)->
  node.setParentTitle node.textContent

observer = new MutationObserver (mutations)->
  onContentChanged(mutation.target) for mutation in mutations when mutation.type is "childList"

SSNavigationBarTitlePrototype = Object.create HTMLElement.prototype

SSNavigationBarTitlePrototype.setParentTitle = (title)->
  if this.parentNode.nodeName == "SS-NAVIGATION-BAR"
    this.parentNode.title = title
  else
    throw new Error "No ss-navigation-bar component as parent"

SSNavigationBarTitlePrototype.createdCallback = ->
  observerConfiguration =
    childList: true

  observer.observe this, observerConfiguration

  onContentChanged this

SSNavigationBarTitlePrototype.detachedCallback = ->
  observer.disconnect()

document.registerElement "ss-navigation-bar-title",
  prototype: SSNavigationBarTitlePrototype
