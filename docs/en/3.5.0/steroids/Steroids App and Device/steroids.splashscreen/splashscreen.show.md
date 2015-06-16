steroids.splashscreen.show
=================

  > Shows the splashscreen.

    steroids.splashscreen.show();

Description
-----------

Shows the splashscreen programmatically.

### Full example

    steroids.splashscreen.show({}, {
      onSuccess: function() {
        alert("splashscreen shown");
      },
      onFailure: function() {
        alert("Failed to show splashscreen.")
      }
    });


Parameters
----------
- __none__

Callbacks
---------
- __onSuccess__: Called once the splashscreen has been shown.
- __onFailure__: Invoked if the splashscreen could not be shown.

Supported Platforms
-------------------

- iOS
