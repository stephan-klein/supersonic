steroids.device.torch.turnOff
============================

  > Sets the device's torch to off

    steroids.device.torch.turnOff();

Description
-----------

Turns the device's torch off regardless of the previous state.


Full Example
-------------

    steroids.device.torch.turnOff({},{
      onSuccess: function() {
        alert('torch has turned off')
      }
    });

Parameters
----------

- __none__

Callbacks
---------

- __onSuccess__: Called once the device's torch starts to turn off.

Supported Platforms
-------------------

- iOS
