steroids.audio.play
=================

> Plays back audio files stored on the device.

    steroids.audio.play("drum.wav");

Description
-----------

`steroids.audio.play` starts playing the audio file as soon as possible.
Calling this API will start playing the audio file regardless of the playback status of other audio files being played concurrently.
Calling this API will stop any background music playing on the device.

Full Example
------------

    steroids.audio.play({
      path: "sounds/drum.mp3"
      relativeTo: steroids.app.path
    }, {
      onSuccess: function() {
        alert("audio is playing");
      },
      onFailure: function(error) {
        alert("could not play audio: " + error.errorDescription);
      }
    });

Parameters
----------

- __path__: Path to the audio file relative to the __relativeTo__ parameter.
- __relativeTo__: Directory the __path__ is relative to. Default value is `steroids.app.path` which should be used for audio files distributed with the application itself. Use `steroids.app.userFilesPath` for audio files in the application user files directory (`Documents` in iOS).

Callbacks
---------

- __onSuccess__: Called once playback has started.
- __onFailure__: Invoked if playback could not be started. Receives a single `error` parameter. The `error` object has the property `errorDescription` which reveals further details about the error.

Supported Platforms
-------------------

- iOS
