steroids.audio.prime
=================

> Prepares the device for instantaneous audio playback.

    steroids.audio.prime();

Description
-----------

In iOS, audio hardware is not immediately available for output.
Any subsequent `steroids.audio.play` calls start immediately.
Calling this API will stop any background music playing on the device.

Full Example
-------------

    steroids.audio.prime({}, {
      onSuccess: function() {
        alert("Audio hardware is awake");
      },
      onFailure: function(error) {
        alert("Error priming audio hardware: " + error.errorDescription)
      }
    });

Parameters
----------

None.

Callbacks
---------

- __onSuccess__: Called once audio hardware has been primed.
- __onFailure__: Invoked if audio hardware could not be primed. Receives a single `error` parameter. The `error` object has the property `errorDescription` which reveals further details about the error.

Supported Platforms
-------------------

- iOS
