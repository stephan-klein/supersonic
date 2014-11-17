###
 # @namespace components
 # @name super-navbar-button
 # @component
 # @description
 # When used inside the `<super-navbar>` element, creates a button that will be displayed on the navigation bar. Only text content is supported for the button title.
 # @usageHtml
 # <super-navbar-button onclick="myfunction()" side="left">Title</super-navbar-button>
 # @attribute side="left" Determines the position of the button on the navigation bar. Allowed values are "left" and "right". If multiple buttons are defined for one side, they will be displayed in order.
 # @attribute onclick= When the native button is tapped, a `click` event is fired on the `<super-navbar-button>` element. This means you can use the `onclick` attribute, or any other framework or method that listens for `click` events.
 # @attribute location A route or a URL that will be [navigated to](/ui-and-navigation/navigation/) when the button is tapped. **Note:** If `location` is set, a `click` event will not be fired when the button is tapped.
 # @attribute view-id The id of a started View that will be [navigated to](/ui-and-navigation/navigation/) when the button is tapped. **Note:** If `view-id` is set, `location` will be ignored and a `click` event will not be fired when the button is tapped.

 # @exampleHtml
 # <super-navbar>
 #
 #   <!-- Button using routes -->
 #   <super-navbar-button location="settings#index">Title</super-navbar-button>
 #
 #   <!-- Button using a started View id -->
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
    @_side = side

  get: ->
    @_side

SuperNavbarButtonPrototype.addToNavbar = ->
  @parentNode.addButton @_button, @_side

SuperNavbarButtonPrototype.updatePositionOnNavbar = ->
  @parentNode.changeButtonSide @_button, @_side

SuperNavbarButtonPrototype.removeFromNavbar = ->
  @parentNode.removeButton @_button

SuperNavbarButtonPrototype.updateOnNavbar = ->
  @parentNode.updateButton @_button

SuperNavbarButtonPrototype._setButtonAction = ->
  viewId = @getAttribute "view-id"
  viewId ?= @getAttribute "location"

  if viewId?
    @_button.onTap = () ->
      supersonic.ui.layers.push(viewId)
      .catch (error) ->
        throw new Error "Failed to push view: #{error.message}"
  else
    # Default action: trigger click on the DOM element
    @_button.onTap = () =>
      @click()

SuperNavbarButtonPrototype._setButtonTitle = ->
  @_button.title = @textContent.trim()

# When a new element is detected in the DOM
SuperNavbarButtonPrototype.createdCallback = ->
  # Check for parent element existence
  if @parentNode.nodeName != "SUPER-NAVBAR"
    throw new Error "Component super-navbar-button must be an immediate child of super-navbar component"
    return

SuperNavbarButtonPrototype.attachedCallback = ->
  # Which things to observe
  observerConfiguration =
    childList: true
    attributes: true
    attributeFilter: ["style", "class", "side", "location", "view-id"]
  observer.observe @, observerConfiguration

  # Set side
  @_side = @getAttribute("side")

  # Create button object
  @_button = new supersonic.ui.NavigationBarButton()

  # Location vs click callback
  @_setButtonAction()

  # Set button title
  @_setButtonTitle()

  # Initiate by adding to navbar
  @addToNavbar()


SuperNavbarButtonPrototype.detachedCallback = ->
  # Remove button from navbar
  @removeFromNavbar()
  # Dispose of observer
  observer.disconnect()

document.registerElement "super-navbar-button",
  prototype: SuperNavbarButtonPrototype
