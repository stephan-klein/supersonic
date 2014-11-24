Promise = require("bluebird")
superify = require '../superify'

module.exports = (steroids, log) ->
  s = superify 'supersonic.ui.initialView', log
  
  ###
   # @namespace supersonic.ui
   # @name initialView
   # @overview
   # @description
   # Methods for showing and dismissing the Initial View. The Initial View is a special view that is defined in `config/structure.coffee` and is shown before any other views in your app are loaded. For more information, please see the [Initial View guide](/supersonic/guides/navigation/navigating-between-views/initial-view/).
  ###

  ###
   # @namespace supersonic.ui.initialView
   # @name show
   # @function
   # @description
   # Shows the Initial View. This causes all other views in your app to be reset and removed from memory, including started Views.
   # @type
   # supersonic.ui.initialView: (
   #   showAnimation?: Animation
   # ) => Promise
   # @define {Animation} showAnimation=animation("fade") A `supersonic.ui.Animation` object that defines the animation used to dismiss the Initial View (and show your actual app's root view). Defaults to `supersonic.ui.animation("fade")`
   # @returnsDescription
   # A [`Promise`](/supersonic/guides/technical-concepts/promises/) that is resolved when the Initial View starts to dismiss. If there the Initial View is not present on the screen, the promise will be rejected.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # supersonic.ui.initialView.show()
   # @exampleJavaScript
   # supersonic.ui.initialView.show();
  ###

  show: s.promiseF "show", (showAnimation="fade")->
    animation = if typeof showAnimation is "string"
      supersonic.ui.animate showAnimation
    else
      showAnimation

    new Promise (resolve, reject)->
      steroids.initialView.show {animation},
        onSuccess: resolve
        onFailure: reject

  ###
   # @namespace supersonic.ui.initialView
   # @name dismiss
   # @function
   # @description
   # Dismiss the Initial View and load the rest of your app.
   # @type
   # supersonic.ui.initialView: (
   #   dismissAnimation?: Animation
   # ) => Promise
   # @define {Animation} dismissAnimation= A `supersonic.ui.Animation` object that defines the animation used to dismiss the Initial View (and show your actual app's root view).
   # @returnsDescription
   # A [`Promise`](/supersonic/guides/technical-concepts/promises/) that is resolved when the Initial View starts to dismiss. If there the Initial View is not present on the screen, the promise will be rejected.
   # @supportsCallbacks
   # @exampleCoffeeScript
   # supersonic.ui.initialView.dismiss()
   # @exampleJavaScript
   # supersonic.ui.initialView.dismiss();
  ###
  dismiss: s.promiseF "dismiss", (showAnimation="fade")->
    animation = if typeof showAnimation is "string"
      supersonic.ui.animate showAnimation
    else
      showAnimation

    new Promise (resolve, reject)->
      steroids.initialView.dismiss {animation},
        onSuccess: resolve
        onFailure: reject
