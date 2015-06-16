steroids.tabBar.setStyleCSS
=================

  > Set custom CSS for your tab bar

    steroids.tabBar.setStyleCSS("background-color: pink;");

Description
-----------

Applies CSS styling for the native tab bar.

### Full example

    steroids.tabBar.setStyleCSS({
        styleCSS: "background-color: pink;"
      },
      {
      onSuccess: function() {
        alert("Tab style set");
      },
      onFailure: function() {
        alert("Failed to set style.")
      }
    });


Parameters
----------
- __styleCSS__: The CSS rule(s) to be applied

Callbacks
---------
- __onSuccess__: Called once the new style rules have been applied
- __onFailure__: Invoked if the style rules could not be applied

Supported Platforms
-------------------

- iOS
- Android
