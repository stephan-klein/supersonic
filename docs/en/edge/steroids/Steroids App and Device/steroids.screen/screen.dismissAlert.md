steroids.screen.dismissAlert
===================

    Dismiss an alert shown on screen

    steroids.screen.dismissAlert({buttonIndex:0});

Description
-----------

Dismisses an on-screen alert box by triggering a tap on the alert dialog button specified by `buttonIndex`. Button indexes run left to right and start at 0.

### Full example

    steroids.screen.dismissAlert({
        buttonIndex: 0
      },
      {
      onSuccess: function() {
        steroids.logger.log("alert dismissed");
      },
      onFailure: function(error) {
        steroids.logger.log("Failed to dismiss alert: " + error.errorDescription)
      }
    });


Parameters
----------
- __buttonIndex__: The index of the button to tap. Buttons are indexed left to right.

Callbacks
---------
- __onSuccess__: Called once the button has been tapped
- __onFailure__: Called if the button could not be tapped

Supported Platforms
-------------------

- iOS
- Android
