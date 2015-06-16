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

# compass.watchHeading

Gets the device's current heading at a regular interval. Each time the heading
is retrieved, the `headingSuccess` callback function is executed.

The returned watch ID references the compass watch interval. The watch
ID can be used with `navigator.compass.clearWatch` to stop watching the navigator.compass.

    var watchID = navigator.compass.watchHeading(compassSuccess, compassError, [compassOptions]);

`compassOptions` may contain the following keys:

- __frequency__: How often to retrieve the compass heading in milliseconds. _(Number)_ (Default: 100)
- __filter__: The change in degrees required to initiate a watchHeading success callback. When this value is set, __frequency__ is ignored. _(Number)_

## Example

    function onSuccess(heading) {
        var element = document.getElementById('heading');
        element.innerHTML = 'Heading: ' + heading.magneticHeading;
    };

    function onError(compassError) {
        alert('Compass error: ' + compassError.code);
    };

    var options = {
        frequency: 3000
    }; // Update every 3 seconds

    var watchID = navigator.compass.watchHeading(onSuccess, onError, options);


## iOS Quirks

Only one `watchHeading` can be in effect at one time in iOS.  If a
`watchHeading` uses a filter, calling `getCurrentHeading` or
`watchHeading` uses the existing filter value to specify heading
changes. Watching heading changes with a filter is more efficient than
with time intervals.

## Android Quirks

- No support for `filter`.

