Promise = require 'bluebird'

parseRoute = require './views/parseRoute'

superify = require '../superify'

module.exports = (steroids, log) ->
  s = superify 'supersonic.ui.tabs', log

  ###
   # @namespace supersonic.ui
   # @name tabs
   # @overview
   # @description
   # Methods for showing and dismissing the tab bar.
  ###

  ###
   # @namespace supersonic.ui.tabs
   # @name show
   # @function
   # @description
   # Shows the tab bar
   # @usageJavaScript
   # supersonic.ui.tabs.show();
   # @type
   # supersonic.ui.tabs.show: (
   # ) => Promise
   # @returnsDescription
   # A promise that is resolved when the tab bar has been shown. If tab bar could not be shown, the promise will be rejected.
  ###
  show: s.promiseF "show", ->
    new Promise (resolve, reject)->
      steroids.tabBar.show {},
        onSuccess: resolve
        onFailure: reject

  ###
   # @namespace supersonic.ui.tabs
   # @name hide
   # @function
   # @description
   # Hides the tab bar
   # @usageJavaScript
   # supersonic.ui.tabs.hide();
   # @type
   # supersonic.ui.tabs.hide: (
   # ) => Promise
   # @returnsDescription
   # A promise that is resolved when the tab bar has been hidden. If tab bar could not be hidden, the promise will be rejected.
  ###
  hide: s.promiseF "hide", ->
    new Promise (resolve, reject)->
      steroids.tabBar.hide {},
        onSuccess: resolve
        onFailure: reject

  ###
   # @namespace supersonic.ui.tabs
   # @name hide
   # @function
   # @description
   # Updates the tab bar
   # @usageJavaScript
   # supersonic.ui.tabs.update([{title: "Hello", badge: "1"}]);
   # @type
   # supersonic.ui.tabs.update: (
   #  tabsArray: Array
   # ) => Promise
   # @define {Array<Object>} tabsArray An array of tab configurations: {title: "Hello", badge: "1"}
   # @returnsDescription
   # A promise that is resolved when the tab bar has been updated. If tab bar could not be updated, the promise will be rejected.
  ###
  update: s.promiseF "update", (tabsArray)->
    new Promise (resolve, reject)->
      steroids.tabBar.update tabs: tabsArray,
        onSuccess: resolve
        onFailure: reject


  ###
   # @namespace supersonic.ui.tabs
   # @name replace
   # @function
   # @description
   # Replaces the tab bar
   # @usageJavaScript
   # supersonic.ui.tabs.replace([{title: "Web", location: "http://www.google.com"}]);
   # @type
   # supersonic.ui.tabs.replace: (
   #  tabsArray: Array
   # ) => Promise
   # @define {Array<Object>} tabsArray An array of tab configurations: {title: "Hello", badge: "1", location: "myroute#index"}
   # @returnsDescription
   # A promise that is resolved when the tab bar has been replaced. If tab bar could not be replaced, the promise will be rejected.
  ###
  replace: s.promiseF "replace", (tabsArray)->
    # support for routing
    for tab in tabsArray
      tab.location = parseRoute tab.location, {prefix: "http://localhost/"}

    new Promise (resolve, reject)->
      steroids.tabBar.replace tabs: tabsArray,
        onSuccess: resolve
        onFailure: reject

  ###
   # @namespace supersonic.ui.tabs
   # @name select
   # @function
   # @description
   # Selects the tab bar
   # @usageJavaScript
   # supersonic.ui.tabs.select(1);
   # @type
   # supersonic.ui.tabs.select: (
   #  tabIndex: Integer
   # ) => Promise
   # @define {Integer} tabIndex An index number of the tab to select. First tab from the left is 0, second one is 1 and so on.
   # @returnsDescription
   # A promise that is resolved when the tab bar has been selected. If tab bar could not be selected, the promise will be rejected.
  ###
  select: s.promiseF "select", (tabIndex)->
    new Promise (resolve, reject)->
      steroids.tabBar.selectTab index: tabIndex,
        onSuccess: resolve
        onFailure: reject

  ###
   # @namespace supersonic.ui.tabs
   # @name updateCurrentTab
   # @function
   # @description
   # Selects the tab bar
   # @usageJavaScript
   # supersonic.ui.tabs.updateCurrentTab({title: "Hello"});
   # @type
   # supersonic.ui.tabs.updateCurrentTab: (
   #  config: Object
   # ) => Promise
   # @define {Object} config An tab configuration object.
   # @returnsDescription
   # A promise that is resolved when the current tab has been updated. If tab could not be updated, the promise will be rejected.
  ###
  updateCurrentTab: s.promiseF "updateCurrentTab", (config={})->
    unless typeof config is "object" and Object.keys(config).length
      throw new Error "Could not update current tab without configuration object"
    new Promise (resolve, reject)->
      steroids.tabBar.currentTab.update config,
        onSuccess: resolve
        onFailure: reject

  ###
   # @namespace supersonic.ui.tabs
   # @name setStyleClass
   # @function
   # @description
   # Adds a CSS style class for the native tab bar.
   # @usageJavaScript
   # supersonic.ui.tabs.setStyleClass("my-awesome-tabs");
   # @type
   # supersonic.ui.tabs.setStyleClass: (
   #  className: String
   # ) => Promise
   # @define {String} className Name of the class to set for tab bar.
   # @returnsDescription
   # A promise that is resolved once the new style class has been set. If class could not be set, the promise will be rejected.
  ###
  setStyleClass: s.promiseF "setStyleClass", (className)->
    new Promise (resolve, reject)->
      steroids.tabBar.setStyleClass className,
        onSuccess: resolve
        onFailure: reject


  ###
   # @namespace supersonic.ui.tabs
   # @name setStyleId
   # @function
   # @description
   # Adds a CSS style id for the native tab bar.
   # @usageJavaScript
   # supersonic.ui.tabs.setStyleId("graybg");
   # @type
   # supersonic.ui.tabs.setStyleId: (
   #  id: String
   # ) => Promise
   # @define {String} id Id of the class to set for tab bar.
   # @returnsDescription
   # A promise that is resolved once the new style id has been set. If id could not be set, the promise will be rejected.
  ###
  setStyleId: s.promiseF "setStyleId", (id)->
    new Promise (resolve, reject)->
      steroids.tabBar.setStyleId id,
        onSuccess: resolve
        onFailure: reject


  ###
   # @namespace supersonic.ui.tabs
   # @name setStyleCSS
   # @function
   # @description
   # Adds a CSS style id for the native tab bar.
   # @usageJavaScript
   # supersonic.ui.tabs.setStyleCSS("background-color: red;");
   # @type
   # supersonic.ui.tabs.setStyleCSS: (
   #  css: String
   # ) => Promise
   # @define {String} css Stylesheet to set for tab bar.
   # @returnsDescription
   # A promise that is resolved once the new style css has been set. If style css could not be set, the promise will be rejected.
  ###
  setStyleCSS: s.promiseF "setStyleCSS", (css)->
    new Promise (resolve, reject)->
      steroids.tabBar.setStyleCSS css,
        onSuccess: resolve
        onFailure: reject


  ###
   # @namespace supersonic.ui.tabs
   # @name whenWillChange
   # @function
   # @apiCall supersonic.ui.tabs.whenWillChange
   # @description
   # Detect when tabs will change
   # @type
   # supersonic.ui.tabs.whenWillChange: () => unsubscribe: Function
   # @define {Function} unsubscribe Stop listening
   # @usageCoffeeScript
   # supersonic.ui.tabs.whenWillChange()
   # @usageJavaScript
   # supersonic.ui.tabs.whenWillChange();
   # @exampleCoffeeScript
   # supersonic.ui.tabs.whenWillChange().then ()->
   #   steroids.logger.log("Tab will change")
   # @exampleJavaScript
   # supersonic.ui.tabs.whenWillChange().then( function() {
   #   steroids.logger.log("Tab will change");
   # });
  ###
  whenWillChange: (f)->
    id = steroids.tabBar.on "willchange", f
    ->
      steroids.tabBar.off "willchange", id
  ###
   # @namespace supersonic.ui.tabs
   # @name whenDidChange
   # @function
   # @apiCall supersonic.ui.tabs.whenDidChange
   # @description
   # Detect when tabs did change
   # @type
   # supersonic.ui.tabs.whenDidChange: () => unsubscribe: Function
   # @define {Function} unsubscribe Stop listening
   # @usageCoffeeScript
   # supersonic.ui.tabs.whenDidChange()
   # @usageJavaScript
   # supersonic.ui.tabs.whenDidChange();
   # @exampleCoffeeScript
   # supersonic.ui.tabs.whenDidChange().then ()->
   #   steroids.logger.log("Tabs did change")
   # @exampleJavaScript
   # supersonic.ui.tabs.whenDidChange().then( funtion() {
   #   steroids.logger.log("Tabs did change");
   # });
  ###
  whenDidChange: (f)->
    id = steroids.tabBar.on "didchange", f
    ->
      steroids.tabBar.off "didchange", id
