###
 # @namespace components
 # @name super-navbar
 # @component
 # @description
 # Displays a view-specific native navigation bar. To set a title text and buttons for the navigation bar, use the `<super-navbar-title>` and `<super-navbar-button>` components.
 # @exampleHtml
 # <!-- Navbar with a title -->
 # <super-navbar>
 #
 #   <super-navbar-title>I'm native!</super-navbar-title>
 #
 # </super-navbar>
###


# (Element, [attributeName]) -> Bacon.Property attributes
observeAttributesOnElement = (element, attributes) ->
  supersonic.internal.Bacon.fromBinder((sink) ->
    # Set up MutationObserver for streaming changes
    observer = new MutationObserver (mutations) ->
      changes = {}
      # Collect changes from tracked attributes
      for mutation in mutations when (mutation.type is "attributes") and (mutation.attributeName in attributes)
        changes[attributeName] = mutation.target.getAttribute(attributeName) || ""
      sink changes

    # Start observing changes in the tracked attributes
    observer.observe element, {
      attributes: true
      attributeFilter: attributes
    }

    # Stop listening by disconnecting the observer
    ->
      observer.disconnect()
  ).toProperty(do ->
    # Make sure there's an initial value
    initial = {}
    for attributeName in attributes
      initial[attributeName] = element.getAttribute(attributeName) || ""
    initial
  )

document.registerElement "super-navbar", class SuperNavbar extends HTMLElement
  _leftButtons: null
  _leftButtons: null

  constructor: ->
    @_leftButtons = []
    @_rightButtons = []

  Object.defineProperty @prototype, "title",
    set: (title) ->
      @_title = title
      @onTitleChanged()

    get: ->
      @_title

  Object.defineProperty @prototype, "buttons",
    set: (buttons) ->
      @setButtons buttons

    get: ->
      {
        left: @_leftButtons
        right: @_rightButtons
      }

  Object.defineProperty @prototype, "class",
    set: (className) ->
      className = "" if not className
      @_class = className
      supersonic.ui.navigationBar.setClass(className) unless @isHidden()

    get: ->
      @_class

  Object.defineProperty @prototype, "style",
    set: (inlineStyle) ->
      inlineStyle = "" if not inlineStyle
      @_style = inlineStyle
      supersonic.ui.navigationBar.setStyle(inlineStyle) unless @isHidden()

    get: ->
      @_style

  Object.defineProperty @prototype, "id",
    set: (styleId) ->
      styleId = "" if not styleId
      @_styleId = styleId
      supersonic.ui.navigationBar.setStyleId(styleId) unless @isHidden()

    get: ->
      @_styleId


  isHidden: ->
    style = window.getComputedStyle this
    return true if style.display is "none" or style.visibility is "hidden"

  show: ->
    supersonic.ui.navigationBar.show()

  hide: ->
    supersonic.ui.navigationBar.hide()

  # Update navbar
  updateNavBar: do ->
    # KLUDGE: Update the navbar after 20ms unless there are new updates to apply
    # NOTE: Assuming only one navbar element to update per document
    lazyUpdate = null
    ->
      options = {}
      # Set base for options
      options.title = @getTitleForUpdate()
      options.buttons =
        left: @_leftButtons
        right: @_rightButtons
      # Update UI

      if lazyUpdate?
        clearTimeout lazyUpdate
        lazyUpdate = null

      lazyUpdate = setTimeout ->
        supersonic.ui.navigationBar.update options
      , 20

  # Navbar title

  getTitleForUpdate: ->
    if @title? && @title.length is 0
      @title = " " # hack for not being able to clear the title with empty string
    return @title

  updateNavBarTitle: ->
    @updateNavBar()

  # Methods for navbar buttons

  addButton: (button, side="left") ->
    # Figure out the side where to add button
    if side is "right" then @_rightButtons.push button
    else @_leftButtons.push button
    # Update buttons on UI
    @onButtonsChanged()

  updateButton: (button) ->
    # First check the left side for the button reference
    for candidate, idx in @_leftButtons when candidate is button
      @_leftButtons[idx] = button
      @onButtonsChanged()
      return
    # Check right side for the reference
    for candidate, idx in @_rightButtons when candidate is button
      @_rightButtons[idx] = button
      @onButtonsChanged()
      return

  changeButtonSide: (button, side="left") ->
    @_removeButtonSilently button
    @addButton button, side

  removeButton: (button) ->
    @_removeButtonSilently button
    @onButtonsChanged()

  _removeButtonSilently: (button) ->
    # First check the left side for the button reference
    for candidate, idx in @_leftButtons when candidate is button
      @_leftButtons.splice idx, 1
      return
    # Check right side for the reference
    for candidate, idx in @_rightButtons when candidate is button
      @_rightButtons.splice idx, 1
      return

  # Batch set function
  setButtons: (buttons) ->
    @_leftButtons = buttons.left
    @_rightButtons = buttons.right
    @onButtonsChanged()

  onTitleChanged: ->
    @updateNavBarTitle() unless @isHidden()

  onButtonsChanged: ->
    @updateNavBar() unless @isHidden()

  attachedCallback: ->
    @_unsubscribeFromAttributeChanges = observeAttributesOnElement(this, ["style", "class", "id", "title"])
      .onValue (attributes) =>
        for key, value of attributes
          @[key] = value

    @_unsubscribeFromVisibilityChanges = supersonic.ui.views.current.whenVisible =>
      if @isHidden()
        @hide()
      else
        @updateNavBar()
        @show()

  detachedCallback: ->
    @_unsubscribeFromAttributeChanges()
    @_unsubscribeFromVisibilityChanges()
    # Hide the navbar when this node leaves the DOM
    supersonic.ui.navigationBar.hide()
