steroids.view.navigationBar.setButtons
=================

  > Sets buttons for the native navigation bar of the current view.

    var rightButton = new steroids.buttons.NavigationBarButton();
    steroids.view.navigationBar.setButtons({ right[button1] });


Description
-----------

**This API was deprecated for iOS in Steroids.js 3.1.4, use steroids.view.navigationBar.update instead on iOS.**

Sets native buttons for the navigation bar. The Back button on the left will appear automatically when `steroids.layers.push` is used, but can be hidden with the `overrideBackButton: true` option.


Full Example
-------------

    var leftButton = new steroids.buttons.NavigationBarButton();
    var rightButton = new steroids.buttons.NavigationBarButton();
    var imageButton = new steroids.buttons.NavigationBarButton();

    leftButton.title = "Left"
    leftButton.onTap = function() { alert("Left button tapped"); }

    rightButton.title = "Right"

    imageButton.imagePath = "/icons/pill@2x.png"

    steroids.view.navigationBar.setButtons({
      left: [leftButton],
      right: [rightButton, imageButton],
      overrideBackButton: true
    }, {
      onSuccess: function() {
        alert("Buttons set!");
      },
      onFailure: function() {
        alert("Failed to set buttons.");
      }
    });

To remove buttons
-----------------

Set buttons to an empty object to remove any buttons. By default, this will also show the back button (since the `overrideBackButton` is not used).

    steroids.view.navigationBar.setButtons({}, {
      onSuccess: function() {
        alert("all buttons removed");
      },
      onFailure: function(error) {
        alert("failed to remove buttons: " + error.errorDescription);
      }
    });


Callbacks
---------

- __onSuccess__: Called once the buttons have been added.
- __onFailure__: Called if the buttons could not be added. Receives a single `error` parameter. The `error` object has the property `errorDescription` which reveals further details about the error.


Supported Platforms
-------------------

- iOS (deprecated)
- Android (only single right button with text supported)
