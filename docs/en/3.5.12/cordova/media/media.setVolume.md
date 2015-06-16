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

# media.setVolume

Set the volume for an audio file.

    media.setVolume(volume);

## Parameters

- __volume__: The volume to set for playback.  The value must be within the range of 0.0 to 1.0.

## Supported Platforms

- Android
- iOS

## Quick Example

    // Play audio
    //
    function playAudio(url) {
        // Play the audio file at url
        var my_media = new Media(url,
            // success callback
            function() {
                console.log("playAudio():Audio Success");
            },
            // error callback
            function(err) {
                console.log("playAudio():Audio Error: "+err);
        });

        // Play audio
        my_media.play();

        // Mute volume after 2 seconds
        setTimeout(function() {
            my_media.setVolume('0.0');
        }, 2000);

        // Set volume to 1.0 after 5 seconds
        setTimeout(function() {
            my_media.setVolume('1.0');
        }, 5000);
    }