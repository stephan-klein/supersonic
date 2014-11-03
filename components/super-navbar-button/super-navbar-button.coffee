###
 # @namespace components
 # @name super-navbar-button
 # @component
 # @description
 # When used inside the `<super-navbar>` element, creates a button that will be displayed on the navigation bar. Only text content is supported for the button title.
 # @usageHtml
 # <super-navbar-button onclick="myfunction()" side="left">Title<super-navbar-button>
 # @attribute side="left" Determines the position of the button on the navigation bar. Allowed values are "left" and "right". If multiple buttons are defined for one side, they will be displayed in order.
 # @attribute onclick= When the native button is tapped, a `click` event is fired on the `<super-navbar-button>` element. This means you can use the `onclick` attribute, or any other framework or method that listens for `click` events.
 # @attribute location A route or a URL that will be [navigated to](/ui-and-navigation/navigation/) when the button is tapped. **Note:** If `location` is set, a `click` event will not be fired when the button is tapped.
 # @attribute view-id The id of a StartedView that will be [navigated to](/ui-and-navigation/navigation/) when the button is tapped. **Note:** If `view-id` is set, `location` will be ignored and a `click` event will not be fired when the button is tapped.

 # @exampleHtml
 # <super-navbar>
 #
 #   <!-- Button using routes -->
 #   <super-navbar-button location="settings#index">Title</super-navbar-button>
 #
 #   <!-- Button using a StartedView id -->
 #   <super-navbar-button view-id="settingsView">Title</super-navbar-button>
 #
 #   <!-- Button with an AngularJS callback -->
 #   <super-navbar-button ng-click="myFunction()">Click me!</super-navbar-button>
 #
 #   <!-- Button on right side of the navigation bar -->
 #   <super-navbar-button side="right">Settings</super-navbar-button>
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
          supersonic.ui.layers.push(webview)
        .catch (error) ->
          throw new Error "Failed to push view: #{error}"
    return

  # Check if location is set
  location = @getAttribute "location"
  if location
    webview = supersonic.ui.view location
    @_button.onTap = () ->
      supersonic.ui.layers.push(webview)
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
  this._button = new supersonic.ui.NavigationBarButton()

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
