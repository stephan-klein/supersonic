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
   # @usageJavaScript
   # var button = new supersonic.ui.NavigationBarButton(options);
   # @type
   # supersonic.ui.NavigationBarButton: (
   #   title: String
   #   onTap: Function
   # )
   # @define {String} title The title text for the button.
   # @define {Function} onTap A function that gets executed when the navigation bar button is tapped.
   # @exampleJavaScript
   # var options = {
   #   title: "Settings",
   #   onTap: function() {
   #     supersonic.ui.layers.push("common#settings")
   #   }
   #
   # var button = new supersonic.ui.NavigationBarButton(options)
  ###

  class NavigationBarButton
    constructor: (options)->
      btn = new steroids.buttons.NavigationBarButton()
      for key of options
        btn[key] = options[key]
      return btn


  return (options)->
    new NavigationBarButton(options)
