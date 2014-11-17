Promise = require 'bluebird'
superify = require '../superify'

module.exports = (steroids, log) ->
  s = superify 'supersonic.ui.drawers', log

  ###
   # @namespace supersonic.ui
   # @name drawers
   # @overview
   # @description The `supersonic.ui.drawers` namespace provides methods to work with drawers.
  ###

  ###
   # @namespace supersonic.ui.drawers
   # @name init
   # @function
   # @description
   # Initializes a View as a drawer on the given side.
   # @usageJavaScript
   # supersonic.ui.drawers.init(view, options);
   # @usageCoffeeScript
   # supersonic.ui.drawers.init view, options
   # @type
   # supersonic.ui.drawers.init: (
   #  view: View
   #  options?:
   #    side: String
   #    width: Integer
   # ) => Promise
   # @define {View} view View object to be shown as a drawer.
   # @define {Object} options Options object to define how the drawer will be shown.
   # @define {String} options.side="left" The side on which the drawer will be shown. Possible values are `left` and `right`
   # @define {String} options.width=200 The width of drawer.
   # @returnsDescription
   # A promise that will be resolved once the drawer has been initialized.
   # @exampleJavaScript
   # var view = new supersonic.ui.View("drawers#left");
   # var options = {
   #   side: "left"
   # }
   #
   # supersonic.ui.drawers.init(view, options);
   #
   # // You can also pass in a started View
   # supersonic.ui.views.find("leftDrawer").then( function(leftDrawer) {
   #   supersonic.ui.drawers.init(leftDrawer);
   # });
   # @exampleCoffeeScript
   # view = new supersonic.ui.View "drawers#left"
   # options =
   #   side: left
   #   width: 150
   #
   # supersonic.ui.drawers.init view, options
   #
   # # You can also pass in a started View
   # supersonic.ui.views.find("leftDrawer").then (leftDrawer)->
   #   supersonic.ui.drawers.init leftDrawer
  ###

  init: s.promiseF "init", (view, options={})->
    new Promise (resolve, reject)->
      if steroids.nativeBridge.constructor.name is "FreshAndroidBridge"
        reject new Error "Android does not support enabling drawers on runtime."
        return

      _doInit = (drawerView)->
        params = {}
        webview = drawerView._webView
        side = if options.side? then options.side else "right"

        if options?.width?
          webview.widthOfDrawerInPixels = options.width

        params[side] = webview

        steroids.drawers.update params,
          onSuccess: resolve
          onFailure: (error)->
            reject new Error error.errorDescription

      view.isStarted().then (started)->
        if started
          _doInit(view)
        else
          view.start().then ->
            _doInit(view)

  ###
   # @namespace supersonic.ui.drawers
   # @name open
   # @function
   # @description
   # Opens the drawer on the given side.
   # @usageJavaScript
   # supersonic.ui.drawers.open(side);
   # @usageCoffeeScript
   # supersonic.ui.drawers.open side
   # @type
   # supersonic.ui.drawers.open: (
   #  side?: String
   # ) => Promise
   # @define {String} side=left The side of the drawer to be opened. Valid values are `left` and `right`.
   # @returnsDescription
   # A promise that will be resolved once the drawer has been opened. If there is no drawer initialized on the given side, the promise will be rejected.
   # @exampleJavaScript
   # supersonic.ui.drawers.open("left").then( function() {
   #   supersonic.logger.debug("Drawer was shown");
   # });
   # @exampleCoffeeScript
   # supersonic.ui.drawers.open("left").then ->
   #   supersonic.logger.debug "Drawer was shown"
  ###

  open: s.promiseF "open", (side="left", options)->
    edge = if side is "right"
      steroids.screen.edges.RIGHT
    else
      steroids.screen.edges.LEFT

    new Promise (resolve, reject)->
      steroids.drawers.show {
        edge: edge
      }, {
        onSuccess: resolve
        onFailure: reject
      }

  ###
   # @namespace supersonic.ui.drawers
   # @name close
   # @function
   # @description
   # Closes an open drawer.
   # @usageJavaScript
   # supersonic.ui.drawers.close();
   # @usageCoffeeScript
   # supersonic.ui.drawers.close()
   # @type
   # supersonic.ui.drawers.close: () => Promise
   # @returnsDescription
   # A promise that will be resolved once the drawer has been closed. If there are no open drawers, the promise will be rejected.
   # @exampleJavaScript
   # supersonic.ui.drawers.close().then( function() {
   #   supersonic.logger.debug("Drawer was closed");
   # });
   # @exampleCoffeeScript
   # supersonic.ui.drawers.close().then ->
   #   supersonic.logger.debug "Drawer was closed"
  ###

  close: s.promiseF "close", ->
    new Promise (resolve, reject)->
      steroids.drawers.hide {},
        onSuccess: resolve
        onFailure: reject

  ###
   # @namespace supersonic.ui.drawers
   # @name updateOptions
   # @function
   # @description
   # Updates options for drawers.
   # @usageJavaScript
   # supersonic.ui.drawers.updateOptions(options);
   # @type
   # supersonic.ui.drawers.updateOptions: (
   #   options:
   #     shadow: Boolean
   #     animation:
   #       type: String
   #       duration: Number
   #     gestures:
   #       open: Array<String>
   #       close: Array<String>
   # ) => Promise
   #
   # @define {Boolean} shadow=true If `true`, a shadow effect will be rendered in the drawer.
   # @define {Object} animation **iOS-only.** An object defining the type and duration of the animation shown when opening or closing the drawer.
   # @define {String} animation.type=slide The animation type. Valid values are: `slide`, `slideAndScale`, `swingingDoor` and `parallax`
   # @define {Number} animation.duration=0.8 The duration (in seconds) of the animation. Applies only when the drawer is opened or closed programmatically or with a tap gesture. With swipe gestures, the animation follows the user's finger.
   # @define {Object} gestures An object defining the gestures that can be used for opening or closing the drawer. Passing a null or empty `gestures` object disables all drawer gestures.
   # @define {Array<String>} gestures.open An array of gesture types that can be used to open the drawer, e.g. `["PanNavBar", "PanCenterView"]`. Available gestures are:
   # <ul>
   #   <li>`PanNavBar`: Open the drawer by panning (swiping) on the navigation bar.
   #   <li>`PanBezelCenterView`: Open the drawer by panning from the edge of the center view. The area that catches the gesture is 20 dips (device-independent pixels) from the edge of the device screen.
   #   <li>`PanCenterView`: Open the drawer by panning anywhere in the center view.
   # </ul>
   # @define {Array<String>} gestures.close An array of gesture types that can be used to close the drawer, e.g. `["TapNavBar", "TapCenterView"]`. Available gestures are:
   # <ul>
   #   <li>`PanNavBar`: As with `gestures.open`.
   #   <li>`PanBezelCenterView`:  As with `gestures.open`.
   #   <li>`PanCenterView`: As with `gestures.open`.
   #   <li>`TapNavBar`: Close the drawer by tapping on the navigation bar of the center view.
   #   <li>`TapCenterView`:  Close the drawer by tapping anywhere in the center view.
   #   <li>`PanDrawerView`: Close the drawer by panning (swiping) anywhere in the drawer view.
   # </ul>
   # @exampleJavaScript
   # supersonic.ui.drawers.updateOptions({
   #   shadow: true,
   #   animation: {
   #     type: "slide",
   #     duration: 1.0
   #   },
   #   gestures: {
   #     open: ["PanNavBar", "PanCenterView"],
   #     close: ["TapNavBar", "TapCenterview"]
   #   }
   # });
  ###
  updateOptions: s.promiseF "updateOptions", (options)->
    config = {}

    if options?.animation?
      animation_type = if typeof options.animation is "string"
        options.animation
      else
        options.animation.type

      animation = switch animation_type
        when "slide" then steroids.drawers.defaultAnimations.SLIDE
        when "slideAndScale" then steroids.drawers.defaultAnimations.SLIDE_AND_SCALE
        when "swingingDoor" then steroids.drawers.defaultAnimations.SWINGING_DOOR
        when "parallax" then steroids.drawers.defaultAnimations.PARALLAX

      if options?.animation?.duration?
        animation.duration = animation.reversedDuration = options.animation.duration

      config.animation = animation

    if options?.shadow?
      config.showShadow = options.shadow

    if options?.gestures?.open?
      config.openGestures = options.gestures.open

    if options?.gestures?.close?
      config.closeGestures = options.gestures.close

    new Promise (resolve, reject)->
      steroids.drawers.update options: config,
        onSuccess: resolve
        onFailure: reject

  ###
   # @namespace supersonic.ui.drawers
   # @name whenWillShow
   # @function
   # @apiCall supersonic.ui.drawers.whenWillShow
   # @description
   # Detect when drawer will show
   # @type
   # supersonic.ui.drawers.whenWillShow: () => unsubscribe: Function
   # @define {Function} unsubscribe Stop listening
   # @usageCoffeeScript
   # supersonic.ui.drawers.whenWillShow()
   # @usageJavaScript
   # supersonic.ui.drawers.whenWillShow();
   # @exampleCoffeeScript
   # supersonic.ui.drawers.whenWillShow().then ->
   #   steroids.logger.log("Drawers will show")
   # @exampleJavaScript
   # supersonic.ui.drawers.whenWillShow().then( function() {
   #   steroids.logger.log("Drawers will show");
   # });
  ###
  whenWillShow: (f)->
    id = steroids.drawers.on "willshow", f
    ->
      steroids.drawers.off "willshow", id

  ###
   # @namespace supersonic.ui.drawers
   # @name whenDidShow
   # @function
   # @apiCall supersonic.ui.drawers.whenDidShow
   # @description
   # Detect when drawer did show
   # @type
   # supersonic.ui.drawers.whenDidShow: () => unsubscribe: Function
   # @define {Function} unsubscribe Stop listening
   # @usageCoffeeScript
   # supersonic.ui.drawers.whenDidShow()
   # @usageJavaScript
   # supersonic.ui.drawers.whenDidShow();
   # @exampleCoffeeScript
   # supersonic.ui.drawers.whenDidShow().then ->
   #   steroids.logger.log("Drawers did show")
   # @exampleJavaScript
   # supersonic.ui.drawers.whenDidShow().then( function() {
   #   steroids.logger.log("Drawers did show");
   # });
  ###
  whenDidShow: (f)->
    id = steroids.drawers.on "didshow", f
    ->
      steroids.drawers.off "didshow", id

  ###
   # @namespace supersonic.ui.drawers
   # @name whenWillClose
   # @function
   # @apiCall supersonic.ui.drawers.whenWillClose
   # @description
   # Detect when drawer will close
   # @type
   # supersonic.ui.drawers.whenWillClose: () => unsubscribe: Function
   # @define {Function} unsubscribe Stop listening
   # @usageCoffeeScript
   # supersonic.ui.drawers.whenWillClose()
   # @usageJavaScript
   # supersonic.ui.drawers.whenWillClose();
   # @exampleCoffeeScript
   # supersonic.ui.drawers.whenWillClose().then ->
   #   steroids.logger.log("Drawers will close")
   # @exampleJavaScript
   # supersonic.ui.drawers.whenWillClose().then( function() {
   #   steroids.logger.log("Drawers will close");
   # });
  ###
  whenWillClose: (f)->
    id = steroids.drawers.on "willclose", f
    ->
      steroids.drawers.off "willclose", id

  ###
   # @namespace supersonic.ui.drawers
   # @name whenDidClose
   # @function
   # @apiCall supersonic.ui.drawers.whenDidClose
   # @description
   # Detect when drawer did close
   # @type
   # supersonic.ui.drawers.whenDidClose: () => unsubscribe: Function
   # @define {Function} unsubscribe Stop listening
   # @usageCoffeeScript
   # supersonic.ui.drawers.whenDidClose()
   # @usageJavaScript
   # supersonic.ui.drawers.whenDidClose()
   # @exampleCoffeeScript
   # supersonic.ui.drawers.whenDidClose().then ->
   #   steroids.logger.log("Drawers did close")
   # @exampleJavaScript
   # supersonic.ui.drawers.whenDidClose().then( function() {
   #   steroids.logger.log("Drawers did close");
   # });
  ###
  whenDidClose: (f)->
    id = steroids.drawers.on "didclose", f
    ->
      steroids.drawers.off "didclose", id
