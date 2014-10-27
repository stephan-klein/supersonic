###
 # @category webComponent
 # @name <super-navbar-button>
 # @component
 # @description
 # A button that will be displayed on the view navbar.
 # @attribute side="left" Used to set button position on navbar. Allowed values are "left" and "right".
 # @attribute location="moduleName#viewName" Simple way to use Supersonic UI navigation with your navbar button. If this is not set, any attached "click" callback will be used instead.
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

###
CREATE ELEMENT
###

SuperNavbarButtonPrototype = Object.create HTMLElement.prototype

###
DEFINE PROPERTIES
###

Object.defineProperty SuperNavbarButtonPrototype, "side",
  set: (side) ->
    this._side = side

  get: ->
    this._side

###
DEFINE METHODS
###

SuperNavbarButtonPrototype.addToNavbar = ->
  this._parent.addButton @_button, @_side

SuperNavbarButtonPrototype.updatePositionOnNavbar = ->
  this._parent.changeButtonSide @_button, @_side

SuperNavbarButtonPrototype.removeFromNavbar = ->
  this._parent.removeButton @_button

SuperNavbarButtonPrototype.updateOnNavbar = ->
  this._parent.updateButton @_button

###
INTERNAL METHODS
###

SuperNavbarButtonPrototype._setButtonAction = ->
  if this.getAttribute("location") and this.getAttribute("location").match(/.+#.+/i)
    view = supersonic.ui.view this.getAttribute("location")
    view.start()
    this._button.onTap = () ->
      supersonic.ui.layer.push view
  else
    this._button.onTap = () =>
      this.click()

SuperNavbarButtonPrototype._setButtonTitle = ->
  this._button.title = this.textContent

###
DEFINE CALLBACKS
###

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
    attributeFilter: ["style", "class", "side", "location"]
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

###
REGISTER ELEMENT
###

document.registerElement "super-navbar-button",
  prototype: SuperNavbarButtonPrototype
