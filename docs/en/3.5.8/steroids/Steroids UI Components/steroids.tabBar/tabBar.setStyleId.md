steroids.tabBar.setStyleId
=================

  > Set a new CSS style id for your tab bar

    steroids.tabBar.setStyleId("awesome-tabs");

Description
-----------

Sets a CSS style id for the native tab bar. The styling rules for the id are looked for in `www/native-styles/default.css`.

### Full example

    steroids.tabBar.setStyleId({
        styleId: "awesome-tabs"
      },
      {
      onSuccess: function() {
        alert("Tab style id set");
      },
      onFailure: function() {
        alert("Failed to set style id.")
      }
    });


Parameters
----------
- __styleId__: The name of the style id to be applied

Callbacks
---------
- __onSuccess__: Called once the new style id has been applied
- __onFailure__: Invoked if the style id could not be applied

Supported Platforms
-------------------

- iOS
- Android
