---
license: Licensed to the Apache Software Foundation (ASF) under one
         or more contributor license agreements.  See the NOTICE file
         distributed with this work for additional information
         regarding copyright ownership.  The ASF licenses this file
         to you under the Apache License, Version 2.0 (the
         "License"); you may not use this file except in compliance
         with the License.  You may obtain a copy of the License at

           http://www.apache.org/licenses/LICENSE-2.0

         Unless required by applicable law or agreed to in writing,
         software distributed under the License is distributed on an
         "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
         KIND, either express or implied.  See the License for the
         specific language governing permissions and limitations
         under the License.
---

# media.play

Starts or resumes playing an audio file.

    media.play();

## Quick Example

    // Play audio
    //
    function playAudio(url) {
        // Play the audio file at url
        var my_media = new Media(url,
            // success callback
            function () {
                console.log("playAudio():Audio Success");
            },
            // error callback
            function (err) {
                console.log("playAudio():Audio Error: " + err);
            }
        );
        // Play audio
        my_media.play();
    }

## iOS Quirks

- __numberOfLoops__: Pass this option to the `play` method to specify
  the number of times you want the media file to play, e.g.:

        var myMedia = new Media("http://audio.ibeat.org/content/p1rj1s/p1rj1s_-_rockGuitar.mp3")
        myMedia.play({ numberOfLoops: 2 })

- __playAudioWhenScreenIsLocked__: Pass in this option to the `play`
  method to specify whether you want to allow playback when the screen
  is locked.  If set to `true` (the default value), the state of the
  hardware mute button is ignored, e.g.:

        var myMedia = new Media("http://audio.ibeat.org/content/p1rj1s/p1rj1s_-_rockGuitar.mp3")
        myMedia.play({ playAudioWhenScreenIsLocked : false })

- __order of file search__: When only a file name or simple path is
  provided, iOS searches in the `www` directory for the file, then in
  the application's `documents/tmp` directory:

        var myMedia = new Media("audio/beer.mp3")
        myMedia.play()  // first looks for file in www/audio/beer.mp3 then in <application>/documents/tmp/audio/beer.mp3
