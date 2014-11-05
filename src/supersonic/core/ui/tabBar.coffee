Promise = require 'bluebird'


module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.ui.tabBar"

  ###
   # @namespace supersonic.ui
   # @name tabBar
   # @overview
   # @description
   # Methods for showing and dismissing the tab bar.
  ###

  ###
   # @namespace supersonic.ui.tabBar
   # @name show
   # @function
   # @description
   # Shows the tab bar
   # @usageJavaScript
   # supersonic.ui.tabBar.show();
   # @type
   # supersonic.ui.tabBar.show: (
   # ) => Promise
   # @returnsDescription
   # A promise that is resolved when the tab bar has been shown. If tab bar could not be shown, the promise will be rejected.
  ###
  show: bug "show", ->
    new Promise (resolve, reject)->
      steroids.tabBar.show {},
        onSuccess: resolve
        onFailure: reject

  ###
   # @namespace supersonic.ui.tabBar
   # @name hide
   # @function
   # @description
   # Hides the tab bar
   # @usageJavaScript
   # supersonic.ui.tabBar.hide();
   # @type
   # supersonic.ui.tabBar.hide: (
   # ) => Promise
   # @returnsDescription
   # A promise that is resolved when the tab bar has been hidden. If tab bar could not be hidden, the promise will be rejected.
  ###
  hide: bug "hide", ->
    new Promise (resolve, reject)->
      steroids.tabBar.hide {},
        onSuccess: resolve
        onFailure: reject

  ###
   # @namespace supersonic.ui.tabBar
   # @name hide
   # @function
   # @description
   # Updates the tab bar
   # @usageJavaScript
   # supersonic.ui.tabBar.update();
   # @type
   # supersonic.ui.tabBar.update: (
   # ) => Promise
   # @returnsDescription
   # A promise that is resolved when the tab bar has been updated. If tab bar could not be updated, the promise will be rejected.
  ###
  update: bug "update", (tabsArray)->
    new Promise (resolve, reject)->
      steroids.tabBar.update tabs: tabsArray,
        onSuccess: resolve
        onFailure: reject


  ###
   # @namespace supersonic.ui.tabBar
   # @name hide
   # @function
   # @description
   # Replaces the tab bar
   # @usageJavaScript
   # supersonic.ui.tabBar.replace();
   # @type
   # supersonic.ui.tabBar.replace: (
   # ) => Promise
   # @returnsDescription
   # A promise that is resolved when the tab bar has been replaced. If tab bar could not be replaced, the promise will be rejected.
  ###
  replace: bug "replace", (tabsArray)->

    handleRoutes = (tab)->
      tab.location = supersonic.ui.views._parseRoute tab.location, {prefix: "http://localhost/"}
      tab

    # support for routing
    tabs = (handleRoutes(tab) for tab in tabsArray)

    new Promise (resolve, reject)->
      steroids.tabBar.replace tabs: tabs,
        onSuccess: resolve
        onFailure: reject
