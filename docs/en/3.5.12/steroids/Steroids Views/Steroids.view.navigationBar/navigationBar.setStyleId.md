steroids.view.navigationBar.setStyleId
=================

  > Set a new CSS style id for your navigation bar

    steroids.view.navigationBar.setStyleId("awesome-tabs");

Description
-----------

Sets a CSS style id for the native navigation bar. The styling rules for the id are looked for in `www/native-styles/default.css`.

### Full example

    steroids.view.navigationBar.setStyleId({
        styleId: "awesome-nav"
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
