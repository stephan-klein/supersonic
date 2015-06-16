steroids.screen.setAllowedRotations
===================================

  > Determine which of the four possible screen rotations are enabled on your device.

Implementation notes
--------------------
- By default all rotations are allowed, with the exception of custom builds where the build settings have been used to lock the app into a certain rotation scheme.
- Modals are not affected by setting allowed rotations in other views and conversely setting allowed rotations in a modal does not affect the rest of the app.

Shorthand
---------
    steroids.screen.setAllowedRotations(["landscapeLeft"]);

Verbose
-------
    steroids.screen.setAllowedRotations(options, callBacks);


Parameters
----------

###Shorthand

- __orientations__ [`Array`]: possible values ("portrait", "portraitUpsideDown", "landscapeLeft", "landscapeRight")


###Verbose

The verbose call accepts two objects: `options` and `callBacks`, which have the following properties:

`options`

- __allowedRotations__: Array of accepted rotations.

`callBacks`

- __onSuccess__: called if updating allowedRotations is succesful.
- __onFailure__: called if updating allowedRotatins fails.

Supported Platforms
-------------------

- iOS