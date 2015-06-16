steroids.device.torch.turnOn
============================

  > Sets the device's torch to on

    steroids.device.torch.turnOn();

Description
-----------

Turns the device's torch on regardless of the previous state.


Full Example
-------------

    steroids.device.torch.turnOn({},{
      onSuccess: function() {
        alert('torch has been turned on')
      }
    });

Parameters
----------

- __none__

Callbacks
---------

- __onSuccess__: Called once the device's torch starts to turn on.

Supported Platforms
-------------------

- iOS
