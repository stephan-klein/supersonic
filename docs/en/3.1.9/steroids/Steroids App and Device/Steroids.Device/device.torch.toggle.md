steroids.device.torch.toggle
============================

  > Toggles the device's torch (switches it on or off)

    steroids.device.torch.toggle();

Description
-----------

Flips the on/off status of the device's torch.

Full Example
-------------

    steroids.device.torch.toggle({},{
      onSuccess: function() {
        alert('torch toggled')
      }
    });

Parameters
----------

- __none__

Callbacks
---------

- __onSuccess__: Called once the device's torch starts to turn on or off.

Supported Platforms
-------------------

- iOS
