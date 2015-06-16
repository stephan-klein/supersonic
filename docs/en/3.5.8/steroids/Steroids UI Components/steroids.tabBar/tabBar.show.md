steroids.tabBar.show
=================

  > Shows the native tab bar.

    steroids.tabBar.show();

Description
-----------

Shows the native tab bar  application wide.

### Full example

    steroids.tabBar.show({}, {
      onSuccess: function() {
        alert("Tab bar shown");
      },
      onFailure: function() {
        alert("Failed to show tab bar.")
      }
    });


Parameters
----------
- __none__

Callbacks
---------
- __onSuccess__: Called once the tab bar has been shown.
- __onFailure__: Invoked if the tab bar could not be shown.

Supported Platforms
-------------------

- iOS
- Android
