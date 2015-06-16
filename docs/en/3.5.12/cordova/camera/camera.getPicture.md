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

# camera.getPicture

Takes a photo using the camera, or retrieves a photo from the device's
image gallery.  The image is passed to the success callback as a
base64-encoded `String`, or as the URI for the image file.  The method
itself returns a `CameraPopoverHandle` object that can be used to
reposition the file selection popover.

    navigator.camera.getPicture( cameraSuccess, cameraError, [ cameraOptions ] );

## Description

The `camera.getPicture` function opens the device's default camera
application that allows users to snap pictures. This behavior occurs
by default, when `Camera.sourceType` equals
`Camera.PictureSourceType.CAMERA`.  Once the user snaps the photo, the
camera application closes and the application is restored.

If `Camera.sourceType` is `Camera.PictureSourceType.PHOTOLIBRARY` or
`Camera.PictureSourceType.SAVEDPHOTOALBUM`, then a dialog displays
that allows users to select an existing image.  The
`camera.getPicture` function returns a `CameraPopoverHandle` object,
which can be used to reposition the image selection dialog, for
example, when the device orientation changes.

The return value is sent to the `cameraSuccess` callback function, in
one of the following formats, depending on the specified
`cameraOptions`:

- A `String` containing the base64-encoded photo image.

- A `String` representing the image file location on local storage (default).

You can do whatever you want with the encoded image or URI, for
example:

- Render the image in an `<img>` tag, as in the example below

- Save the data locally (`LocalStorage`, [Lawnchair](http://brianleroux.github.com/lawnchair/), etc.)

- Post the data to a remote server

__NOTE__: Photo resolution on newer devices is quite good. Photos
selected from the device's gallery are not downscaled to a lower
quality, even if a `quality` parameter is specified.  To avoid common
memory problems, set `Camera.destinationType` to `FILE_URI` rather
than `DATA_URL`.

## Supported Platforms

- Android
- iOS

## Android Quirks

Android uses intents to launch the camera activity on the device to capture
images, and on phones with low memory, the Cordova activity may be killed.  In this
scenario, the image may not appear when the Cordova activity is restored.

## iOS Quirks

Including a JavaScript `alert()` in either of the callback functions
can cause problems.  Wrap the alert within a `setTimeout()` to allow
the iOS image picker or popover to fully close before the alert
displays:

    setTimeout(function() {
        // do your thing here!
    }, 0);

## Example

Take a photo and retrieve it as a base64-encoded image:

    navigator.camera.getPicture(onSuccess, onFail, { quality: 50,
        destinationType: Camera.DestinationType.DATA_URL
    });

    function onSuccess(imageData) {
        var image = document.getElementById('myImage');
        image.src = "data:image/jpeg;base64," + imageData;
    }

    function onFail(message) {
        alert('Failed because: ' + message);
    }

Take a photo and retrieve the image's file location:

    navigator.camera.getPicture(onSuccess, onFail, { quality: 50,
        destinationType: Camera.DestinationType.FILE_URI });

    function onSuccess(imageURI) {
        var image = document.getElementById('myImage');
        image.src = imageURI;
    }

    function onFail(message) {
        alert('Failed because: ' + message);
    }