steroids.view.navigationBar.setAppearance
=========================================

  > Sets the appearance of the native navigation bar

    steroids.view.navigationBar.setAppearance({
      titleTextColor: '#0000FF'
    });


Description
-----------

Sets the colors (and background images) of the native navigation bar and its text and buttons. The appearance is updated globally for the app. If a parameter is left empty, the previous value will be used.

Background images
-----------------

There's a few points to know about setting background images for the navigation bar:

- You need to start the path with `steroids.app.path` (this requires the steroids.on `ready` event to have fired).
- The image path after `steroids.app.path` is relative to the root of the `dist/` folder.
- You must append a `@2x` before the file extension in your background images' file names. This makes Retina-resolution images scale correctly.
- Images will be scaled to fit the navigation bar area.
- If the image height is higher than the navigation bar height, it will extend under the status bar text.

Parameters
----------

An options object with the following properties. All color values are 6-character hex strings with a leading #, e.g. `#FF0000`

- __tintColor__: Color of the navigation bar.
- __titleTextColor__: Color of the navigation bar title.
- __buttonTintColor__: Color of the navigation bar buttons.
- __portraitBackgroundImage__: Background image for the navigation bar in portrait mode.
- __landscapeBackgroundImage__: Background image for the navigation bar in landscape mode.

Full Example
-------------

    // Set navigation bar appearance to rainbow, with background images
    steroids.view.navigationBar.setAppearance({
      tintColor: '#FF0000' // superceded by background image
      titleTextColor: '#0000FF'
      buttonTintColor: '#00FF00'
      portraitBackgroundImage: steroids.app.path + '/images/portrait-navbar@2x.png'
      landscapeBackgroundImage: steroids.app.path + '/images/landscape-navbar@2x.png'
    }, {
      onSuccess: function() {
        alert("Taste the rainbow!")
      },
      onFailure: function() {
        alert("Failed set navigation bar appearance.")
      }
    });



Callbacks
---------

- __onSuccess__: Called once the appearance has been updated.
- __onFailure__: Called if the appearance could not be updated.


Supported Platforms
-------------------

- iOS
