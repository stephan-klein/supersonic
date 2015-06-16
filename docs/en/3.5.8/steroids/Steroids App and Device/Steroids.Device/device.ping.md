steroids.device.ping
=================

  > Pings the native side using given payload.

    steroids.device.ping();

Description
-----------

For performance testing purposes. Can also be used to verify that the native bridge works.

Full Example
-------------

    steroids.device.ping({
      data: 'BIGDATA'
    },{
      onSuccess: function(parameters) {
        alert(parameters.message == 'pong') // => true
      }
    });

Parameters
----------

- __data__: Payload to attach to the ping message. This can be used to test the performance of large API calls.

Callbacks
---------

- __onSuccess__: Called once the native side has responded with a `pong` message.

Supported Platforms
-------------------

- iOS
- Android
