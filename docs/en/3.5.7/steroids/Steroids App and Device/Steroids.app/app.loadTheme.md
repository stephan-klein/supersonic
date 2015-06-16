steroids.app.loadTheme
=================

  > Load a CSS file to style the native navigation and tab bars.

    steroids.app.loadTheme("space-theme.css");

Description
-----------

Load a CSS file to theme your app. The CSS file is looked for in `dist/native-styles/` folder.

Example
-------

    steroids.app.loadTheme({
        theme: "space-theme.css"
      },
      {
      onSuccess: function(){
        alert("theme loaded")
      },
      onFailure: function(error){
        alert("failed to load theme")
      }
    })

Parameters
----------

- __theme__: The name of the CSS file to be applied

Callbacks
---------

- __onSuccess__: Called once the theme is loaded
- __onFailure__: Called if the theme fails to load

Supported Platforms
-------------------

- iOS
- Android
