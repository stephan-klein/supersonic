steroids.view.navigationBar.addStyleClass
=================

  > Add a new CSS style class for your navigation bar

    steroids.view.navigationBar.addStyleClass("awesome-nav");

Description
-----------

Adds a CSS style class for the native navigation bar. The styling rules for the class are looked for in `www/native-styles/default.css`.

### Full example

    steroids.view.navigationBar.addStyleClass({
        styleClass: "awesome-nav"
      },
      {
      onSuccess: function() {
        alert("Tab style class updated");
      },
      onFailure: function() {
        alert("Failed to update style class.")
      }
    });


Parameters
----------
- __styleClass__: The name of the style class to be added

Callbacks
---------
- __onSuccess__: Called once the new style class has been added
- __onFailure__: Invoked if the style class could not be added

Supported Platforms
-------------------

- iOS
- Android
