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

# pause

The event fires when an application is put into the background.

    document.addEventListener("pause", yourCallbackFunction, false);

## Details

The `pause` event fires when the native platform puts the application
into the background, typically when the user switches to a different
application.

Applications typically should use `document.addEventListener` to
attach an event listener once the `deviceready` event fires.

## Quick Example

    document.addEventListener("pause", onPause, false);

    function onPause() {
        // Handle the pause event
    }

## Full Example

    <!DOCTYPE html>
    <html>
      <head>
        <title>Pause Example</title>

        <script type="text/javascript" charset="utf-8" src="/cordova.js"></script>
        <script type="text/javascript" charset="utf-8" src="/components/steroids-js/steroids.js"></script>
        <script type="text/javascript" charset="utf-8">

        // Wait for device API libraries to load
        //
        function onLoad() {
            document.addEventListener("deviceready", onDeviceReady, false);
        }

        // device APIs are available
        //
        function onDeviceReady() {
            document.addEventListener("pause", onPause, false);
        }

        // Handle the pause event
        //
        function onPause() {
        }

        </script>
      </head>
      <body onload="onLoad()">
      </body>
    </html>

## iOS Quirks

In the `pause` handler, any calls to the Cordova API or to native
plugins that go through Objective-C do not work, along with any
interactive calls, such as alerts or `console.log()`. They are only
processed when the app resumes, on the next run loop.
