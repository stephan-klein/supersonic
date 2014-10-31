Promise = require 'bluebird'


module.exports = (steroids, log) ->
  # TODO: add bug later
  # bug = log.debuggable "supersonic.ui.view"

  ###
   # @namespace supersonic.ui
   # @name view
   # @function
   # @description
   # Creates a new view pointer with the route or URL given as the parameter.
   # @type
   # view: (
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

  getView = (location)->
    parsedLocation = parseRoute location
    webView = new steroids.views.WebView
      location: parsedLocation

    view =
      getLocation: -> location
      _getWebView: -> webView

    start = (id)->
      supersonic.ui.views.start view, id

    view.start = start

    view

  parseRoute = (location) ->
    if location.match /^[\w\-]+#[\w\-]+$/
      routeParts = location.split "#"
      "app/#{routeParts[0]}/#{routeParts[1]}.html"
    else
      location

  return getView
