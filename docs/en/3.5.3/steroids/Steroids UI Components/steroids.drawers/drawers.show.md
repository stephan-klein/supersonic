steroids.drawers.show
=====================

> Opens the left or right drawer programmatically.

    steroids.drawers.show();


Description
-----------

`steroids.drawers.show` brings up a drawer on the left or right side of the screen. The drawer must have been initialized by calling steroids.drawers.update with the `left` or `right` parameter, as appropriate.

Drawers can be shown from only one edge at a time. If no drawer has been initialized for the given edge, the API call will fail.

Full Example
------------

    var googleView = new steroids.views.WebView( { location: "http://www.google.com" } );

    steroids.drawers.show( {
      edge: steroids.screen.edges.LEFT
    }, {
      onSuccess: function() {
        steroids.logger.log("Drawer opening...")
      },
      onFailure: function(error) {
        steroids.logger.log("Could not show the drawer: " + error.errorDescription);
      }
    });

Parameters
----------

- __edge__: The edge of screen whose drawer will be shown. Defaults to __steroids.screen.edges.LEFT__.

Callbacks
---------

- __onSuccess__: Called once the drawer is about to be drawn.
- __onFailure__: Called if the drawer could not be opened. There might be another drawer open.

Supported Platforms
-------------------

- iOS
