steroids.view.navigationBar.setStyleClass
=================

  > Set a new CSS style class for your navigation bar

    steroids.view.navigationBar.setStyleClass("awesome-nav");

Description
-----------

Sets a CSS style class for the native navigation bar. The styling rules for the class are looked for in `www/native-styles/default.css`. __Note__: Unlike `steroids.view.navigationBar.addStyleClass`, this method will override any previously set style classes.

### Full example

    steroids.view.navigationBar.setStyleClass({
        styleClass: "awesome-nav"
      },
      {
      onSuccess: function() {
        alert("Tab style class set");
      },
      onFailure: function() {
        alert("Failed to set style class.")
      }
    });


Parameters
----------
- __styleClass__: The name of the style class to be applied

Callbacks
---------
- __onSuccess__: Called once the new style class has been applied
- __onFailure__: Invoked if the style class could not be applied

Supported Platforms
-------------------

- iOS
- Android
