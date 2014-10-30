Promise = require 'bluebird'


module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.ui.drawer"

  ###
   # @namespace core.ui
   # @name drawer
   # @overview
   # @description The `supersonic.ui.drawer` namespace provides methods to work with drawers.
  ###

  ###
   # @namespace core.ui.drawer
   # @name init
   # @function
   # @description
   # Initializes a View or a StartedView as a drawer on the given side.
   # @usageJavaScript
   # supersonic.ui.drawer.init(view, options);
   # @usageCoffeeScript
   # supersonic.ui.drawer.init view, options
   # @type
   # supersonic.ui.drawer.init: (
   #  view: View|StartedView
   #  options?:
   #    side: String
   # ) => Promise
   # @define {View|StartedView} view View or StartedView object to be shown as a drawer.
   # @define {Object} options Options object to define how the drawer will be shown.
   # @define {String} options.side="left" The side on which the drawer will be shown. Possible values are `left` and `right`
   # @returnsDescription
   # A promise that will be resolved once the drawer has been initialized.
   # @exampleJavaScript
   # var view = supersonic.ui.view("drawers#left");
   # var options = {
   #   side: "left"
   # }
   #
   # supersonic.ui.drawer.init(view, options);
   #
   # // You can also pass in a StartedView
   # supersonic.ui.views.find("leftDrawer").then( function(leftDrawer) {
   #   supersonic.ui.drawer.init(leftDrawer);
   # });
   # @exampleCoffeeScript
   # view = supersonic.ui.view "drawers#left"
   # options =
   #   side: left
   #
   # supersonic.ui.drawer.show view, options
   #
   # # You can also pass in a StartedView
   # supersonic.ui.views.find("leftDrawer").then (leftDrawer)->
   #   supersonic.ui.drawer.init leftDrawer
  ###

  ###
   # @namespace core.ui.drawer
   # @name open
   # @function
   # @description
   # Opens the drawer on the given side.
   # @usageJavaScript
   # supersonic.ui.drawer.open(side);
   # @usageCoffeeScript
   # supersonic.ui.drawer.open side
   # @type
   # supersonic.ui.drawer.open: (
   #  side?: String
   #  options?:
   #    width?: Integer
   # ) => Promise
   # @define {String} side=left The side of the drawer to be opened. Valid values are `left` and `right`.
   # @define {Object} options Options object for defining the properties of the drawer to be opened.
   # @define {Integer} options.width The width of the drawer in pixels.
   # @returnsDescription
   # A promise that will be resolved once the drawer has been opened. If there is no drawer initialized on the given side, the promise will be rejected.
   # @exampleJavaScript
   # supersonic.ui.drawer.open("left").then( function() {
   #   supersonic.logger.debug("Drawer was shown");
   # });
   # @exampleCoffeeScript
   # supersonic.ui.drawer.open("left").then ->
   #   supersonic.logger.debug "Drawer was shown"
  ###

  ###
   # @namespace core.ui.drawer
   # @name close
   # @function
   # @description
   # Closes an open drawer.
   # @usageJavaScript
   # supersonic.ui.drawer.close();
   # @usageCoffeeScript
   # supersonic.ui.drawer.close()
   # @type
   # supersonic.ui.drawer.close: () => Promise
   # @returnsDescription
   # A promise that will be resolved once the drawer has been closed. If there are no open drawers, the promise will be rejected.
   # @exampleJavaScript
   # supersonic.ui.drawer.close().then( function() {
   #   supersonic.logger.debug("Drawer was closed");
   # });
   # @exampleCoffeeScript
   # supersonic.ui.drawer.close().then ->
   #   supersonic.logger.debug "Drawer was closed"
  ###

  ###
   # @namespace core.ui.drawer
   # @name updateOptions
   # @function
   # @description
   # Updates options for drawers.
   # @usageJavaScript
   # supersonic.ui.drawer.updateOptions(options);
   # @type
   # supersonic.ui.drawer.updateOptions: (
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
   #   <li>`PanBezelCenterView`: Open the drawer by panning from the edge of the center view. The area that catches the gesture is 20 dips [(device-independent pixels)](/ui-and-navigation/overview/device-independent-pixels/) from the edge of the device screen.
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
   # supersonic.ui.drawer.updateOptions({
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

  asLeft: (view)->
    new Promise (resolve, reject) =>
      @show(view, 'left').then ->
        resolve()

  asRight: (view)->
    new Promise (resolve, reject)->
      @show(view, 'right').then ()->
        resolve()





  show: (view, options={})->
    new Promise (resolve, reject)->
      webView = view._getWebView()
      if options.side?
      params[side] = webView
      steroids.drawers.update params
      steroids.drawers.show {
        edge: steroids.screen.edges[side.toUpperCase()]
      }, {
        onSuccess: ()->
          supersonic.logger.info "#{side} drawer should be shown"
          resolve()
        onFailure: ()->
          supersonic.logger.error "#{side} drawer fails"
          reject()
      }

  # TODO: Finish the method
  hide: ()->
    new Promise (resolve, reject)->
      steroids.drawers.hide {
      }, {
        onSuccess: ()->
          supersonic.logger.info "Drawer was hidden"
          resolve()
        onFailure: ()->
          supersonic.logger.error "Hiding a drawer crached"
          reject()
      }


  setOptions: (options)->
    steroids.drawers.update {
      options: options
    }
