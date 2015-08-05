Promise = require 'bluebird'

module.exports = (steroids, log) ->
  # TODO: add bug later
  # bug = log.debuggable "supersonic.ui.NavigationBarButton"

  ###
   # @namespace supersonic.ui
   # @name NavigationBarButton
   # @class
   # @description
   # A navigation bar button, for use with `supersonic.ui.navigationBar.update`.
   # @type
   # supersonic.ui.NavigationBarButton: (
   #   title: String
   #   onTap: Function
   #   styleClass: String
   #   styleId: String
   #   styleCSS: String
   # )
   # @define {String} title The title text for the button.
   # @define {Function} onTap A function that gets executed when the navigation bar button is tapped.
   # @define {String} styleClass A native CSS style class to be applied for the button.
   # @define {String} styleId A native CSS style id to be applied for the button.
   # @define {String} styleCSS Custom native CSS to be applied for the button.
   # @exampleCoffeeScript
   # options =
   #   title: "Settings"
   #   onTap: ->
   #     supersonic.ui.layers.push "common#settings"
   #   styleId: "settings"
   #
   # button = new supersonic.ui.NavigationBarButton options
   # @exampleJavaScript
   # var options = {
   #   title: "Settings",
   #   onTap: function() {
   #     supersonic.ui.layers.push("common#settings");
   #   }
   #   styleId: "settings"
   #
   # var button = new supersonic.ui.NavigationBarButton(options)
  ###
  class NavigationBarButton
    constructor: (options)->
      @btn = new steroids.buttons.NavigationBarButton()
      for key of options
        @btn[key] = options[key]

    ###
     # @namespace supersonic.ui.NavigationBarButton
     # @name addEventListener
     # @function
     # @description
     # Register a event listener that is called when this buttons is taped.
     # @type
     # supersonic.ui.NavigationBarButton.addEventListener: () => Promise
     # @returnsDescription
     # @supportsCallbacks
     # @exampleCoffeeScript
     # button = new supersonic.ui.NavigationBarButton
     # button.addEventListener "tap", ->
     #   ...
     # @exampleJavaScript
     # var button = new supersonic.ui.NavigationBarButton();
     # button.addEventListener("tap", function(){
     #  ...
     # });
     #
    ###
    addEventListener: (event, fn) ->
      if event == "tap"
        eventHandlerId = steroids.navigationBar.on "buttonTapped", (event) =>
          if event.button.id == @btn.id
            fn()

  return (options)->
    new NavigationBarButton(options)
