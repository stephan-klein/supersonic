Promise = require 'bluebird'


module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.ui.navigationBar"

  ###
   # @namespace supersonic.ui
   # @name navigationBar
   # @overview
   # @description
   # Provides methods to work with the native navigation bar. For more information, see the [Navigation Bar guide](/ui-and-tooling/native-components/navigation-bar/)
  ###

  ###
   # @namespace supersonic.ui.navigationBar
   # @name show
   # @function
   # @description
   # Shows the native navigation bar for the current view.
   # @usageJavaScript
   # supersonic.ui.navigationBar.show(options);
   # @type
   # supersonic.ui.navigationBar.show: (
   #   options?:
   #     animated?: Boolean
   # ) => Promise
   # @define {Object} options={} An object of optional parameters which define how the navigation bar will be shown.
   # @define {Boolean} options.animated=true Determines if the navigation bar will be shown with an animation.
   # @returnsDescription
   # A promise that will be resolved after the navigation bar is shown.
   # @exampleCoffeeScript
   # options =
   #   animated: false
   # supersonic.ui.navigationBar.show(options).then ->
   #   supersonic.logger.log "Navigation bar shown without animation."
   # @exampleJavaScript
   # var options = {
   #   animated: false
   # }
   #
   # supersonic.ui.navigationBar.show(options).then( function() {
   #   supersonic.logger.debug("Navigation bar shown without animation.");
   # });
   #
  ###
  show: (params = {})->
    filteredParams =
      animated: params.animated

    new Promise (resolve, reject)->
      steroids.view.navigationBar.show filteredParams, {
        onSuccess: ()->
          supersonic.logger.info "Navigation bar was shown"
          resolve()
        onFailure: (error)->
          supersonic.logger.error "Could not show the navigation bar: #{error.errorDescription}"
          reject()
      }

  ###
   # @namespace supersonic.ui.navigationBar
   # @name hide
   # @function
   # @description
   # Hides the native navigation bar for the current view.
   # @usageJavaScript
   # supersonic.ui.navigationBar.hide();
   # @type
   # supersonic.ui.navigationBar.hide: (
   #   options?:
   #     animated?: Boolean
   # ) => Promise
   # @define {Object} options An object of optional parameters which define how the navigation bar will be hidden.
   # @define {Boolean} animated=true If `false`, the navigation bar will be hidden without an animation.
   # @returnsDescription
   # A promise that will be resolved after the navigation bar is hidden. If the navigation bar cannot be hidden (e.g. it is already hidden), the promise will be rejected.
   # @exampleJavaScript
   # var options = {
   #   animated: true
   # }
   #
   # supersonic.ui.navigationBar.hide(options).then( function() {
   #   supersonic.logger.debug("Navigation bar hidden without animation.");
   # });
  ###
  hide: (params = {})->
    new Promise (resolve, reject)->
      steroids.view.navigationBar.hide params, {
        onSuccess: ()->
          supersonic.logger.info "Navigation bar was hidden"
          resolve()
        onFailure: (error)->
          supersonic.logger.error "Hiding the navigation bar crashed due to the error: #{error.errorDescription}"
          reject()
      }

  ###
   # @namespace supersonic.ui.navigationBar
   # @name update
   # @function
   # @description
   # Updates the navigation bar. Only properties defined in the options object are affected. Other properties will continue to use the previous (or default) value.
   # @usageJavaScript
   # supersonic.ui.navigationBar.update(options);
   # @type
   # supersonic.ui.navigationBar.update: (
   #   options:
   #     backButton?: Boolean
   #     buttons?:
   #       left?: Array<NavigationBarButton>
   #       right?: Array<NavigationBarButton>
   # )
   # @define {Object} options An object of optional parameters which defines how the navigation bar will be updated.
   # @define {Boolean} backButton=true If `false`, the automatic back button will not be shown. If defined, the first left button will be shown on its place.
   # @define {Object} buttons= An object determining the buttons that will be shown on either side of the navigation bar.
   # @define {Array<NavigationBarButton} buttons.left=[] An array of NavigationBarButtons to be shown on the left side of the navigation bar (i.e. left side of the title text/image). Passing an empty array will remove all buttons.
   # @define {Array<NavigationBarButton} buttons.right=[] An array of NavigationBarButtons to be shown on the right side of the navigation bar (i.e. right side of the title text/image). Passing an empty array will remove all buttons.
   # @returnsDescription
   # A promise that will be resolved after the navigation bar has been updated. If the navigation bar cannot be updated, the promise will be rejected.
   # @exampleJavaScript
   # leftButton = new supersonic.ui.NavigationBarButton( {
   #   title: "Left",
   #   onTap: function() {
   #     supersonic.ui.dialog.alert("Left button tapped!");
   #   }
   # });
   #
   # options = {
   #   overrideBackButton: true,
   #   buttons: {
   #     left: [leftButton]
   #   }
   # }
   #
   # supersonic.ui.navigationBar.update(options);
   # @exampleCoffeeScript
   # leftButton = new supersonic.ui.NavigationBarButton
   #   title: "Left"
   #   onTap: ->
   #     supersonic.ui.dialog.alert "Left button tapped!"
   #
   # options =
   #   overrideBackButton: true
   #   buttons:
   #     left: [leftButton]
   #
   # supersonic.ui.navigationBar.update options
  ###
  update: (params)->
    new Promise (resolve, reject)->
      # debugger
      steroids.view.navigationBar.update params, {
        onSuccess: ()->
          supersonic.logger.info "Navigation bar was updated"
          resolve()
        onFailure: ()->
          supersonic.logger.error "Updating the navigation bar chashed"
          reject()
      }

  ###
   # @namespace supersonic.ui.navigationBar
   # @name setClass
   # @function
   # @description
   # Adds a CSS class name to the navigation bar. Any previous CSS classes will be overriden. **Note:** At the moment, setting CSS classes for the navigation bar affects the whole navigation stack, not just the current view.
   # @usageJavaScript
   # supersonic.ui.navigationBar.setClass(className);
   # @type
   # setClass: (
   #   className: String
   # ) => Promise
   # @define {String} className="" A string of one or more CSS class names, separated by spaces.
   # @returnsDescription
   # A promise that will be resolved after the navigation bar CSS class is set.
   # @exampleCoffeeScript
   # supersonic.ui.navigationBar.setClass("my-class").then ()->
   #   supersonic.logger.log "Navigation bar class was set."
   # @exampleJavaScript
   # supersonic.ui.navigationBar.setClass("my-class").then(function() {
   #   supersonic.logger.log("Navigation bar class was set.");
   # });
   #
  ###
  setClass: (className)->
    new Promise (resolve, reject)->
      steroids.view.navigationBar.setStyleClass className, {
        onSuccess: ()->
          supersonic.logger.info "Navigation bar class was set"
          resolve()
        onFailure: (error)->
          supersonic.logger.error "Could not set the navigation bar class name: #{error.errorDescription}"
          reject()
      }

  ###
   # @namespace supersonic.ui.navigationBar
   # @name setStyle
   # @function
   # @description
   # Sets inline CSS styling to the navigation bar. Any previous inline styles are overridden. **Note:** At the moment, setting inline CSS styles for the navigation bar affects the whole navigation stack, not just the current view.
   # @usageJavaScript
   # supersonic.ui.navigationBar.setStyle(inlineCssString);
   # @type
   # setStyle: (
   #   inlineCssString: String
   # ) => Promise
   # @define {String} inlineCssString="" A string of inline CSS styling.
   # @returnsDescription
   # A promise that will be resolved after the navigation bar style is set.
   # @exampleCoffeeScript
   # supersonic.ui.navigationBar.setStyle("background-color: #ff0000;").then ()->
   #   supersonic.logger.log "Navigation bar style was set."
   # @exampleJavaScript
   # supersonic.ui.navigationBar.setStyle("background-color: #ff0000;").then(function() {
   #   supersonic.logger.log("Navigation bar style was set.");
   # });
   #
  ###
  setStyle: (inlineCssString)->
    new Promise (resolve, reject)->
      steroids.view.navigationBar.setStyleCSS inlineCssString, {
        onSuccess: ()->
          supersonic.logger.info "Navigation bar inline style was set"
          resolve()
        onFailure: (error)->
          supersonic.logger.error "Could not set the navigation bar inline style: #{error.errorDescription}"
          reject()
      }

  ###
   # @namespace supersonic.ui.navigationBar
   # @name setStyleId
   # @function
   # @description
   # Sets a CSS style id for navigation bar. Any previous id will be overridden. **Note:** At the moment, setting a CSS style id for the navigation bar affects the whole navigation stack, not just the current view.
   # @apiCall supersonic.ui.navigationBar.setStyleId
   # @usageJavaScript
   # supersonic.ui.navigationBar.setStyleId(id);
   # @type
   # setStyleId: (
   #   id: String
   # ) => Promise
   # @define {String} id="" The style id to set.
   # @returnsDescription
   # A promise that will be resolved after the navigation bar style id is set.
   # @exampleCoffeeScript
   # supersonic.ui.navigationBar.setStyleId("the-button").then ()->
   #   supersonic.logger.log "Navigation bar style id was set."
   # @exampleJavaScript
   # supersonic.ui.navigationBar.setStyleId("the-button").then(function() {
   #   supersonic.logger.log("Navigation bar style id was set.");
   # });
   #
  ###
  setStyleId: (styleId)->
    new Promise (resolve, reject)->
      steroids.view.navigationBar.setStyleId styleId, {
        onSuccess: ()->
          supersonic.logger.info "Navigation bar style id was set"
          resolve()
        onFailure: (error)->
          supersonic.logger.error "Could not set the navigation bar style id: #{error.errorDescription}"
          reject()
      }
