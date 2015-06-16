steroids.drawers.enableGesture
==============================

**This API has been deprecated in Steroids.js v3.1.9. Please use steroids.drawers.update instead.**

> Enables the user to define and open a drawer using a swipe gesture.

    var googleView = new steroids.views.WebView("http://www.google.com");

    googleView.preload({},{
      onSuccess: initGesture
    });

    function initGesture() {
      steroids.drawers.enableGesture(googleView);
    }


Description
-----------

`steroids.drawers.enableGesture` loads a drawer in the specified screen edge and enables a swipe gesture to open and close it.

The view in the drawer needs to be preloaded successfully with steroids.view.preload before the gesture can be enabled.

User can use a swiping gesture to open or close the drawer, as well as a tapping gesture over the center view to hide the drawer when the drawer is open.

Full Example
------------

    var googleView = new steroids.views.WebView( { location: "http://www.google.com" } );
    googleView.preload({}, {
      onSuccess: initGesture
    });

    function initGesture() {
      steroids.drawers.enableGesture( {
        view: googleView,
        edge: steroids.screen.edges.LEFT,
        widthOfDrawerInPixels: 200
      }, {
        onSuccess: function() {
          alert("Drawer gesture is enabled.");
        },
        onFailure: function(error) {
          alert("Could not show the drawer: " + error.errorDescription);
        }
      });
    }

Parameters
----------

As a convenience shortcut, `steroids.drawers.enableGesture` can be called with a single `steroids.views.WebView` object as the parameter. Note that the WebView must be preloaded with steroids.view.preload or the API call will fail.

Otherwise, an options object is used, which has the following parameters:

- __view__: The `steroids.views.WebView` to be rendered in the drawer. Required.
- __edge__: The edge of screen on which side the drawer will be rendered on. Defaults to __steroids.screen.edges.LEFT__.
- __widthOfDrawerInPixels__: The width of the drawer when it is fully open, defined in Device Independent Pixels (DIPs). Does not take effect if __widthOfLayerInPixels__ if defined. Default value is `280`.
- __widthOfLayerInPixels__: The width of the center view when it is fully open, in Device Independent Pixels (DIPs). Overrides __widthOfDrawerInPixels__ if defined. Default value is `undefined`.

See http://www.quirksmode.org/blog/archives/2010/04/a_pixel_is_not.html for more information on DIPs.

Callbacks
---------

- __onSuccess__: Called once the drawer gesture is enabled.
- __onFailure__: Called if the drawer gesture could not be enabled.

Supported Platforms
-------------------

- iOS
