steroids.screen.unfreeze
=================

  > Unfreezes the device screen and application UI after an intentional freeze.

    steroids.screen.freeze();

    window.setTimeout(function() {
      steroids.screen.unfreeze();
    }, 2000);


Description
-----------

After the UI and screen has been frozen with steroids.screen.freeze, this call makes the UI responsive again and updates the screen to the reflect any changes that may have occurred during the freeze.

Parameters
----------
- __none__

Callbacks
---------
- __none__

Supported Platforms
-------------------

- iOS
