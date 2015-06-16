steroids.drawers.update
=======================

> Updates the left and right drawers and their options for the application.

Quick Example
-------------

    var leftDrawer = new steroids.views.WebView("drawer.html");

    function updateDrawer() {
      steroids.drawers.update({
        left: leftDrawer
      });
    }

    leftDrawer.preload({},{
      onSuccess: updateDrawer
    });

Description
-----------

`steroids.drawers.update` updates (or sets, if called for the first time) the application's drawers and their options. The method can be used to change the WebView that is rendered in the left or right side drawer. The view in the drawer needs to be preloaded successfully with steroids.view.preload before the drawer can be shown. Attempting to use a non-preloaded WebView will fail. Both a left and right side drawer can be active at the same time.

The method is also be used to update how the drawer functions – see below for the list of options.

Full Example
------------

    var leftDrawer = new steroids.views.WebView("leftDrawer.html");
    var rightDrawer = new steroids.views.WebView("rightDrawer.html");

    leftDrawer.widthOfDrawerInPixels = 200;

    function updateDrawer() {
      steroids.drawers.update({
        left: leftDrawer,
        right: rightDrawer,
        options: {
          showShadow: true,
          stretchDrawer: true,
          centerViewInteractionMode: "Full",
          animation: steroids.drawers.defaultAnimations.PARALLAX,
          openGestures: ["PanNavBar", "PanBezelCenterView"],
          closeGestures: ["PanNavBar", "PanBezelCenterView", "TapCenterView"]
        }
      }, {
        onSuccess: function() {
          steroids.logger.log("Drawer successfully updated!");
        },
        onFailure: function() {
          steroids.logger.log("Could not update drawer.");
        }
      });
    }

    function preloadRightDrawer() {
      rightDrawer.preload({},
        {
          onSuccess: updateDrawer
        }
      );
    }

    leftDrawer.preload({},
      {
        onSuccess: preloadRightDrawer
      }
    );

Parameters
----------

The API call takes a single options object with the following parameters:

- __left__: A steroids.views.WebView object that will be renderd in the left-side drawer. The WebView object can have the following drawer-specific properties:
  - __widthOfDrawerInPixels__: The width of the drawer when it is fully open, in Device Independent Pixels. Defaults to `280`.
- __right__: A steroids.views.WebView object that will be rendered in the right-side drawer. The WebView object can have the same drawer-specific properties as listed above.
- __options__: An object that has the properties listed below.


Options object properties
-------------------------

- __showShadow__: If set to `true`, a shadow effect will be rendered in the drawer.
- __stretchDrawer__: If set to `true`, panning a drawer past its maximum width will cause a "rubber-band" effect that snaps the drawer to its place when the gesture is stopped (i.e. finger is lifted from the screen).
- __centerViewInteractionMode__: Sets what kind of user interaction is allowed with the center view when the drawer is open. Possible values (as Strings) are:
  - `None`: The user cannot interact with the contents of the center view.
  - `Full`: The user can interact with all the content in the center view.
  - `NavBar`: The user can interact with only the navigation bar of the center view, including navigation bar buttons.
- __animation__: A custom steroids.Animation object used to bring the drawer into view. See steroids.drawers.defaultAnimations for the drawer animation types and options. Defaults to `steroids.drawers.defaultAnimations.SLIDE`.
- __openGestures__: An array of Strings of allowed gestures for opening the drawer, e.g. `["PanNavBar", "PanCenterView"]`. Passing an empty array disables the open gestures. The following gestures are available:
  - `PanNavBar`: Open the drawer by panning (swiping) on the navigation bar.
  - `PanCenterView`: Open the drawer by panning anywhere in the center view.
  - `PanBezelCenterView`: Open the drawer by panning from the edge of the center view. The area that catches the gesture is 20 Device Independent Pixels (DIPs) from the edge.
  - __None__: If this gesture is the only one in the array, open gestures are disabled.
- __closeGestures__: An array of Strings of allowed gestures for closing the navigation bar. Passing an empty array disables the close gestures. The following gestures are available:
  - `PanNavBar`: As with __openGestures__.
  - `PanCenterView`: As with __openGestures__.
  - `PanBezelCenterView`: As with __openGestures__.
  - `TapNavBar`: Close the drawer by tapping on the navigation bar of the center view.
  - `TapCenterView`: Close the drawer by tapping anywhere in the center view.
  - `PanDrawerview`: Close the drawer by panning anywhere in the drawer view.
  - `None`: If this gesture is the only one in the array, close gestures are disabled.
- __widthOfLayerInPixels__: The width of the center view when it is fully open, in Device Independent Pixels. Setting it to other than `0` overrides any __widthOfDrawerInPixels__ settings set for individual drawer WebViews.

See <a href="http://www.quirksmode.org/blog/archives/2010/04/a_pixel_is_not.html">an article on Quirksmode.org</a> for more information on Device Independent Pixels (DIPs) – basically, two physical pixels on a Retina screen count as one Device Independent Pixel, so a 640 physical pixels wide iPhone 5 has 320 DIPs.

Callbacks
---------

- __onSuccess__: Called once the drawer is about to be updated.
- __onFailure__: Called if the drawer could not be updated.

Supported Platforms
-------------------

- iOS
- Android, but not all of the options. Only enabling, disabling, changin the drawer size and displaying the shadow are working.
