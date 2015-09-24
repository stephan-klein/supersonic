Promise = require 'bluebird'

module.exports = (steroids, log) ->
  ###
  # @namespace supersonic.ui
  # @name MediaGallery
  # @class
  # @description
  # A MediaGallery is a native view that displays a gallery of photos and videos (iOS only for now)
  # @type
  # MediaGallery: {
  #   start: () => Promise
  # }
  # @define {Function} start - Dislays the Native Media Gallery View.
  # @exampleCoffeeScript
  # # Constructor (urls is an array of file URLS (remote and local files))
  # mediaGallery = new supersonic.ui.MediaGallery([
  #   "http://www.mydomain.com/images/promo01.jpg"
  #   "images/floor_plan.jpg"
  #   "videos/movie.mp4"])
  #
  # # Displays the Media Gallery View
  # mediaGallery.start()
  #
  # @exampleJavaScript
  # // Constructor (urls is an array of file URLS (remote and local files))
  # var mediaGallery = new supersonic.ui.MediaGallery([
  #   "http://www.mydomain.com/images/promo01.jpg"
  #   "images/floor_plan.jpg"
  #   "videos/movie.mp4"]);
  #
  # // Displays the Media Gallery View
  # mediaGallery.start();
  #
  ###

  class MediaGallery
    constructor: (@urls=[]) ->

    start: => new Promise (resolve, reject) =>
      steroids.modal.show {
        view: new steroids.views.MediaGalleryView {
          files: @urls
        }
      },
        onSuccess: resolve
        onFailure: reject

  return MediaGallery
