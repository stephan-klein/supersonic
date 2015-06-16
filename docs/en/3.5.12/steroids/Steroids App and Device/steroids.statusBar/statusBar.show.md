steroids.statusBar.show
=================

  > Shows the native status bar.

    steroids.statusBar.show();

Description
-----------

Shows the native status bar application wide. If no parameters are given, the status bar text color is the default color (black on iOS 7).

### Full example

    steroids.statusBar.show({style: "light"}, {
      onSuccess: function() {
        alert("Status bar shown");
      },
      onFailure: function() {
        alert("Failed to show status bar.")
      }
    });


Parameters
----------
- __style__: If set to "light", then the native status bar text color is light (white on iOS 7). __Optional__.

Callbacks
---------
- __onSuccess__: Called once the status bar has been shown.
- __onFailure__: Invoked if the status bar could not be shown.

Supported Platforms
-------------------

- iOS
