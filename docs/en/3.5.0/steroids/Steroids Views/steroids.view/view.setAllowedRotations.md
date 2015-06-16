steroids.view.setAllowedRotations
=================================

By default, the application does not rotate when the device orientation changes.  Rotation can be enabled per view with this function.  To keep the current orientation, set allowed rotations to `[]`.

Quick example
-------------

    steroids.view.setAllowedRotations([0,180,-90,90]);  // Will rotate to every direction

Full example
------------

    steroids.view.setAllowedRotations({
      allowedRotations: [0,180,-90,90]
    }, {
      onSuccess: function() {
        alert("View will rotate to every orientation.");
      }
    });

Options
-------

- __allowedRotations__: An array of orientations allowed for rotation. Valid values are 0, 180, -90 and 90. __Required__.

Callbacks
---------

- __onSuccess__: Called once the allowed rotations have been set.

Supported platforms
-------------------
- iOS
