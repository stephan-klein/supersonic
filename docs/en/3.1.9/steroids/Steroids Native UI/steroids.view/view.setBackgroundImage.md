steroids.view.setBackgroundImage
=================================

Sets an image for the current view's background, behind the WebView container rendering your HTML document. The background image will be visible if you drag your view past its top or bottom edge.

If you set the `background-color: 'transparent'` CSS property for your HTML page's `body` (and other elements as necessary), the background image will be visible under your HTML content.

Quick example
-------------

  steroids.view.setBackgroundImage("/img/space-background.png")

Full example
------------

    steroids.view.setBackgroundImage({
      image: "/img/space-background.png"
    }, {
      onSuccess: function() { steroids.logger.log("Background image set succesfully!"); }
      onFailure: function() { steroids.logger.log("Could not set background image."); }
    });

Parameters
----------

- __image__: The path to your image, relative to the application folder (i.e. root of `dist/` as it appears on your computer).

Callbacks
---------

- __onSuccess__: Called when the background image has been succesfully set.
- __onFailure__: Called if the background image could not be set.

Supported platforms
-------------------

- iOS
