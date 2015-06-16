steroids.tabBar.hide
=================

  > Hides the native tab bar.

    steroids.tabBar.hide();

Description
-----------

Hides the tab tab bar application wide. 

### Full example

    steroids.tabBar.hide({}, {
      onSuccess: function() {
        alert("Tab bar hidden");
      },
      onFailure: function() {
        alert("Failed to hide tab bar.")
      }
    });


Parameters
----------
- __none__

Callbacks
---------
- __onSuccess__: Called once the tab bar has been hidden.
- __onFailure__: Invoked if the tab bar could not be hidden.

Supported Platforms
-------------------

- iOS
