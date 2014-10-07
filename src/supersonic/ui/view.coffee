Promise = require 'bluebird'


module.exports = (steroids, log) ->
  # TODO: add bug later
  # bug = log.debuggable "supersonic.ui.view"

  ###
   # @category core
   # @module ui
   # @name view
   # @overview
   # @description
   # Views live at the heart of every Supersonic app. A View displays the HTML content of your app.
  ###

  ###
   # @module ui
   # @name view
   # @function
   # @apiCall supersonic.ui.view
   # @description
   # Creates a new view with the route or URL given as the parameter.
   # @type
   # View: (
   #  location: String
   # ) => View
   # @define {String} location A [route](todo) (e.g. `"cars#index"`) or URL (e.g. `"http://www.google.com"`) that the view points to.
   # @returnsDescription
   # Returns a `supersonic.ui.View` object pointing to the given location.
   # @usageCoffeeScript
   # supersonic.ui.view "cars#index"
   # @exampleCoffeeScript
   # # Routes are parsed automatically. The one below points to the HTML file at app/cars/views/index.html
   # carsIndexView = supersonic.ui.view "cars#index"
   #
   # # URLs are detected and used as-is
   # googleView = supersonic.ui.view "http://www.google.com"
   #
  ###

  createView = (location, id)->
    new View(location, id)

  ###
   # @module ui
   # @name View
   # @class
   # @apiCall supersonic.ui.View
   # @description
   # A Supersonic View. A View points to a specific location (route or URL). It can be passed as an argument to other API calls (like `supersonic.ui.navigate` or `supersonic.ui.preload`).
   # @type
   # View: {
   #   location: String
   # }
   # @define {String} location The view's location, set when `supersonic.ui.view()` was called.
  ###

  class View

    constructor: (location, options={}) ->
      @location = location

      parsedLocation = @_parseRoute location

      @_webView = new steroids.views.WebView
        location: parsedLocation

    _parseRoute: (location) ->
      if location.match /^[\w\-]+#[\w\-]+$/
        routeParts = location.split "#"
        "app/#{routeParts[0]}/views/#{routeParts[1]}.html"
      else
        location

  return createView
