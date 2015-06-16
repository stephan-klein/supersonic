steroids.screen.rotate
======================

  > Rotate the screen to one of the four preset orientations.

Implementation note
-------------------
Allowed rotations must be set with `steroids.view.setAllowedRotations`, or the call to `steroids.screen.rotate` will fail.

Shorthand
---------
    steroids.screen.rotate("landscapeLeft");

Verbose
-------
    steroids.screen.rotate(options, callBacks);


Parameters
----------

###Shorthand

- __orientation__ [`String`]: possible values ("portrait", "portraitUpsideDown", "landscapeLeft", "landscapeRight")


###Verbose

The verbose call accepts two objects: `options` and `callBacks`, which have the following properties:

`options`

- __orientation__: String representation of desired orientation.

`callBacks`

- __onSuccess__: called once the rotation is succesful.
- __onFailure__: called if the rotation fails.