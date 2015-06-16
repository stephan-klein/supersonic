steroids.device.getIPAddress
============================

  > Resolves the current IP address of the device

    steroids.device.getIPAddress({}, { onSuccess: resolved });

Description
-----------

Resolves the current IP address of the device.

Full Example
-------------

    steroids.device.getIPAddress({}, {
      onSuccess: function(message) {
        alert(message.ipAddress) // something like "192.168.20.12"
      }
    });

Parameters
----------

- __none__

Callbacks
---------

- __onSuccess__: Called once the IP address has been resolved.
- __onFailure__: Called if the IP address can not be resolved.

Supported Platforms
-------------------

- iOS
