steroids.statusBar.hide
=================

  > Hides the native status bar.

    steroids.statusBar.hide();

Description
-----------

Hides the native status bar application wide.

### Full example

    steroids.statusBar.hide({}, {
      onSuccess: function() {
        alert("Status bar hidden");
      },
      onFailure: function() {
        alert("Failed to hide status bar.")
      }
    });


Parameters
----------
- __none__

Callbacks
---------
- __onSuccess__: Called once the status bar has been hidden.
- __onFailure__: Invoked if the status bar could not be hidden.

Supported Platforms
-------------------

- iOS
