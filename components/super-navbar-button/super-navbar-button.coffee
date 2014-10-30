###
 # @namespace components
 # @name super-navbar-button
 # @component
 # @description
 # A button that will be displayed on the view navbar.
 # @attribute side="left" Used to set button position on navbar. Allowed values are "left" and "right".
 # @attribute location="moduleName#viewName" Simple way to use Supersonic UI navigation with your navbar button. Can contain a route or a URL. If neither this of view-id is set, any attached "click" callback will be used instead.
 # @attribute view-id The ID of a preloaded web view. Configure view IDs in config/structure.coffee. If view-id is set, location will be ignored.
 # @usageHtml
 # <super-navbar-button location="moduleName#viewName" side="left">Title<super-navbar-button>
 # @exampleHtml
 # <super-navbar>
 #
 #   <!-- Button using Supersonic UI navigation -->
 #   <super-navbar-button location="moduleName#viewName">Title<super-navbar-button>
 #
 #   <!-- Button using Angular callback -->
 #   <super-navbar-button ng-click="myFunction()">Title<super-navbar-button>
 #
 #   <!-- Button on right side of navbar -->
 #   <super-navbar-button side="right">Title<super-navbar-button>
 #
 # </super-navbar>
###
observer = new MutationObserver (mutations) ->
  for mutation in mutations
    # If content changed
    if mutation.type is "childList"
      mutation.target._setButtonTitle()
      mutation.target.updateOnNavbar()
    # If attribute changed
    if mutation.type is "attributes"
      console.log "mutation", mutation
      # Side
      if mutation.attributeName is "side"
        mutation.target._side = mutation.target.getAttribute("side")
        mutation.target.updatePositionOnNavbar()
        return
      # On-tap
      if mutation.attributeName is "location"
        mutation.target._setButtonAction()
        mutation.target.updateOnNavbar()
        return

SuperNavbarButtonPrototype = Object.create HTMLElement.prototype


Object.defineProperty SuperNavbarButtonPrototype, "side",
  set: (side) ->
    this._side = side

  get: ->
    this._side

SuperNavbarButtonPrototype.addToNavbar = ->
  this._parent.addButton @_button, @_side

SuperNavbarButtonPrototype.updatePositionOnNavbar = ->
  this._parent.changeButtonSide @_button, @_side

SuperNavbarButtonPrototype.removeFromNavbar = ->
  this._parent.removeButton @_button

SuperNavbarButtonPrototype.updateOnNavbar = ->
  this._parent.updateButton @_button

SuperNavbarButtonPrototype._setButtonAction = ->

  # Check if view-id is set
  viewId = @getAttribute "view-id"
  if viewId
    @_button.onTap = () ->
      supersonic.ui.views.find(viewId)
        .then (webview) ->
          supersonic.ui.layer.push(webview)
        .catch (error) ->
          throw new Error "Failed to push view: #{error}"
    return

  # Check if location is set
  location = @getAttribute "location"
  if location
    webview = supersonic.ui.view location
    @_button.onTap = () ->
      supersonic.ui.layer.push(webview)
        .catch (error) ->
          throw new Error "Failed to push view: #{error}"
    return

  # Default action: trigger click on the DOM element
  @_button.onTap = () =>
    @click()

SuperNavbarButtonPrototype._setButtonTitle = ->
  this._button.title = this.textContent


# When a new element is detected in the DOM
SuperNavbarButtonPrototype.createdCallback = ->
  # Check for parent element existence
  if this.parentNode.nodeName != "SUPER-NAVBAR"
    throw new Error "Component super-navbar-button must be an immediate child of super-navbar component"
    return
  this._parent = this.parentNode

  # Which things to observe
  observerConfiguration =
    childList: true
    attributes: true
    attributeFilter: ["style", "class", "side", "location", "view-id"]
  observer.observe this, observerConfiguration

  # Set side
  this._side = this.getAttribute("side")

  # Create button object
  this._button = new supersonic.ui.navigationButton()

  # Location vs click callback
  this._setButtonAction()

  # Set button title
  this._setButtonTitle()

  # Initiate by adding to navbar
  this.addToNavbar()

  # Trigger an initial event
  #onContentChanged this

SuperNavbarButtonPrototype.detachedCallback = ->
  # Remvoe button from navbar
  this.removeFromNavbar()
  # Dispose of observer
  observer.disconnect()

document.registerElement "super-navbar-button",
  prototype: SuperNavbarButtonPrototype
