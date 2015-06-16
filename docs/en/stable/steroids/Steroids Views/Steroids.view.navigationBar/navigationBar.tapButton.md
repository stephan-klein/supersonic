steroids.view.navigationBar.tapButton
=================

  > Trigger a tap for a button in the navigation bar

    steroids.view.navigationBar.tapButton({index:1});

Description
-----------

Triggers a tap event on a button in the native navigation bar. The button that is triggered is determined by the button index, running left to right and starting at 0.

### Full example

    steroids.view.navigationBar.tapButton({
        index: 1
      },
      {
      onSuccess: function() {
        alert("Button tapped");
      },
      onFailure: function(error) {
        alert("Failed to tap button: " + error.errorDescription)
      }
    });


Parameters
----------
- __index__: The index of the button to tap. Buttons are indexed left to right, with the back button having the index 0.

Callbacks
---------
- __onSuccess__: Called once the button has been tapped
- __onFailure__: Called if the button could not be tapped

Supported Platforms
-------------------

- iOS
- Android
